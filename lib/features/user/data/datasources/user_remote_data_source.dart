import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/services.dart';
import 'package:logger/logger.dart';
import 'package:meta/meta.dart';
import 'package:myclig/core/constants/firebase_storage_nodes.dart';
import 'package:myclig/core/errors/error.dart';
import 'package:myclig/core/local_data/user_data/save_loggedin_user_data.dart';
import 'package:myclig/core/notification/get_fcm_user_token.dart';
import 'package:myclig/core/upload/upload_to_firebase_storage.dart';
import 'package:myclig/features/user/data/models/user_model.dart';
import 'package:myclig/features/user/domain/entities/user_entity.dart';

abstract class UserRemoteDataSource {
  Future<UserModel> registerOrUpdateUser(UserEntity userEntity, [File image]);
  Future<UserModel> loginUser(String email, String password);
  Future<UserModel> getUser(String userId);
}

const USER_NODE = 'Users';
const REFERRALS = 'Referrals';

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final UploadToFirebase uploadToFirebase;
  final AppNotification appNotification;
  final FirebaseAuth firebaseAuth;
  final DatabaseReference databaseReference;
  final SaveLoggedInUserData saveLoggedInUserData;

  UserRemoteDataSourceImpl({
    @required this.uploadToFirebase,
    @required this.appNotification,
    @required this.firebaseAuth,
    @required this.databaseReference,
    @required this.saveLoggedInUserData,
  });
  @override
  Future<UserModel> getUser(String userId) {
    // TODO: implement getUser
    throw UnimplementedError();
  }

  @override
  Future<UserModel> loginUser(String email, String password) {
    // TODO: implement loginUser
    throw UnimplementedError();
  }

  @override
  Future<UserModel> registerOrUpdateUser(UserEntity userEntity,
      [File image]) async {
    try {
      if (userEntity.userId != null && userEntity.userId.isNotEmpty) {
        return updateUser(userEntity, image);
      }
      return registerUser(userEntity);
    } catch (e) {
      print(e);

      if (e is FirebaseAuthException) {
        // if (e.code == 'user-not-found') {
        //   return registerUser(userEntity);
        // }
        if (e.code == 'wrong-password') {
          throw EmailAlreadyExistException();
        }
      }
      rethrow;
    }
  }

  Future<UserModel> updateUser(UserEntity userEntity, [File image]) async {
    try {
      String imageUrl = userEntity.photoUrl;
      if (image != null) {
        imageUrl = await uploadToFirebase.upload(
          image,
          FirebaseStorageNodes.PROFILE_IMAGE_NODE,
        );
      }

      print(imageUrl);
      if (userEntity.username != null && userEntity.username.isNotEmpty) {
        // await isUserNameExist(userEntity.username);
        if (await isUserNameExist(userEntity.username)) {
          print('username already exist');
          throw UserNameAlreadyExistException();
        }
      }

      if (userEntity.phone != null && userEntity.phone.isNotEmpty) {
        if (await isPhoneExist(userEntity.phone)) {
          print('phone already exist');
          throw PhoneAlreadyExistException();
        }
      }

      UserModel userModel = UserModel(
        email: userEntity.email,
        fcmToken: await appNotification.getFirebaseNotificationToken(),
        fullName: userEntity.fullName,
        location: userEntity.location,
        organization: userEntity.organization,
        phone: userEntity.phone,
        photoUrl: imageUrl,
        profession: userEntity.profession,
        userId: userEntity.userId,
        username: userEntity.username,
        verified: userEntity.verified,
      );

      databaseReference
          .child(USER_NODE)
          .child(userModel.userId)
          .update(userModel.toMap());
      saveLoggedInUserData(userModel);
      if (userEntity.referalCode != null && userEntity.referalCode.isNotEmpty) {
        _incrementReferal(userEntity.referalCode, userEntity.userId);
      }
      return userModel;
    } catch (e) {
      print(e);
      if (e is FirebaseAuthException) {
        print(e.code);
        if (e.code == 'email-already-in-use') {
          throw EmailAlreadyExistException();
        }
      }
      rethrow;
    }
  }

  Future<UserModel> registerUser(UserEntity userEntity, [File image]) async {
    try {
      print('register');
      String imageUrl = userEntity.photoUrl;
      if (image != null) {
        imageUrl = await uploadToFirebase.upload(
          image,
          FirebaseStorageNodes.PROFILE_IMAGE_NODE,
        );
      }
      UserCredential userCredential =
          await firebaseAuth.createUserWithEmailAndPassword(
        email: userEntity.email,
        password: userEntity.password,
      );

      UserModel userModel = UserModel(
        email: userEntity.email,
        fcmToken: await appNotification.getFirebaseNotificationToken(),
        fullName: userEntity.fullName,
        location: userEntity.location,
        organization: userEntity.organization,
        phone: userEntity.phone,
        photoUrl: imageUrl,
        profession: userEntity.profession,
        userId: userCredential.user.uid,
        username: userEntity.username,
        verified: userEntity.verified,
      );
      Logger().i(userModel.toMap());
      databaseReference
          .child(USER_NODE)
          .child(userModel.userId)
          .set(userModel.toMap());
      saveLoggedInUserData(userModel);
      return userModel;
    } catch (e) {
      print(e);
      if (e is PlatformException) {
        throw ServerException(message: e.message);
      }
      if (e is FirebaseAuthException) {
        print(e.code);
        if (e.code == 'email-already-in-use') {
          throw EmailAlreadyExistException();
        }
        if (e.code == 'weak-password') {
          throw ServerException(
            message:
                'Password is weak, password must contain at least one uppercase, one lowercase and special characters',
          );
        }
      } else if (e is EmailAlreadyExistException ||
          e is PhoneAlreadyExistException ||
          e is UserNameAlreadyExistException) {
        rethrow;
      }
      throw ServerException(
        message: 'Action was not successful, please try again!',
      );
    }
  }

  Future<bool> isUserNameExist(String username) async {
    bool exist = false;
    final DataSnapshot dataSnapshot = await databaseReference
        .child(USER_NODE)
        .orderByChild('username')
        .equalTo(username)
        .once();
    if (dataSnapshot.value == null) {
      return exist;
    }
    Map<String, dynamic>.from(dataSnapshot.value).forEach((key, values) async {
      // if (key != null && key.isNotEmpty) throw UserNameAlreadyExistException();
      UserModel userModel = UserModel.fromMap(
        Map<String, dynamic>.from(
          values,
        ),
      );

      print(userModel.username);

      if (userModel.userId == FirebaseAuth.instance.currentUser.uid) {
        exist = false;
      } else {
        exist = true;
      }
    });
    return exist;
  }

  Future<bool> _incrementReferal(String code, String userId) async {
    final DataSnapshot dataSnapshot = await databaseReference
        .child(REFERRALS)
        .orderByChild('code')
        .equalTo(code)
        .once();
    Map<String, dynamic>.from(dataSnapshot.value).forEach((key, values) async {
      await databaseReference
          .child(REFERRALS)
          .child(key)
          .child('users')
          .child(userId)
          .set(
        {
          'date': DateTime.now().millisecondsSinceEpoch,
        },
      );
      return true;
    });
    return false;
  }

  Future<bool> isPhoneExist(String phone) async {
    bool exist = false;
    final DataSnapshot dataSnapshot = await databaseReference
        .child(USER_NODE)
        .orderByChild('phone')
        .equalTo(phone)
        .once();
    if (dataSnapshot.value == null) {
      return exist;
    }
    Map<String, dynamic>.from(dataSnapshot.value).forEach((key, values) async {
      // if (key != null && key.isNotEmpty) throw PhoneAlreadyExistException();
      print(values);
      UserModel userModel =
          UserModel.fromMap(Map<String, dynamic>.from(values));
      print(userModel.username);
      print(userModel.userId);
      print(FirebaseAuth.instance.currentUser.uid);

      if (userModel.userId == FirebaseAuth.instance.currentUser.uid) {
        exist = false;
      } else {
        exist = true;
      }
    });
    return exist;
  }
}
