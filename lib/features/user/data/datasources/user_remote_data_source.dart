import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:meta/meta.dart';
import 'package:myclig/core/constants/firebase_storage_nodes.dart';
import 'package:myclig/core/errors/error.dart';
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

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final UploadToFirebase uploadToFirebase;
  final AppNotification appNotification;
  final FirebaseAuth firebaseAuth;
  final DatabaseReference databaseReference;

  UserRemoteDataSourceImpl({
    @required this.uploadToFirebase,
    @required this.appNotification,
    @required this.firebaseAuth,
    @required this.databaseReference,
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
      firebaseAuth.signInWithEmailAndPassword(
        email: userEntity.email,
        password: userEntity.password,
      );
      return updateUser(userEntity, image);
    } catch (e) {
      if (e is FirebaseAuthException) {
        print(e.code);
        if (e.code == 'user-not-found') {
          return registerUser(userEntity);
        }
      }
      throw ServerException(
        message: 'Action was not successful, please try again!',
      );
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

      if (userEntity.username != null && userEntity.username.isNotEmpty) {
        isUserNameExist(userEntity.username);
      }

      if (userEntity.phone != null && userEntity.phone.isNotEmpty) {
        isPhoneExist(userEntity.phone);
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
      return userModel;
    } catch (e) {
      if (e is FirebaseAuthException) {
        print(e.code);
        if (e.code == 'email-already-in-use') {
          throw EmailAlreadyExistException();
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

  Future<UserModel> registerUser(UserEntity userEntity, [File image]) async {
    try {
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

      if (userEntity.username != null && userEntity.username.isNotEmpty) {
        isUserNameExist(userEntity.username);
      }

      if (userEntity.phone != null && userEntity.phone.isNotEmpty) {
        isPhoneExist(userEntity.phone);
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
        userId: userCredential.user.uid,
        username: userEntity.username,
        verified: userEntity.verified,
      );
      databaseReference.child(USER_NODE).set(userModel.toMap());
      return userModel;
    } catch (e) {
      if (e is FirebaseAuthException) {
        print(e.code);
        if (e.code == 'email-already-in-use') {
          throw EmailAlreadyExistException();
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
    final DataSnapshot dataSnapshot = await databaseReference
        .child(USER_NODE)
        .equalTo(username, key: 'username')
        .once();
    print(dataSnapshot.value);
    if (dataSnapshot.value == null || dataSnapshot.value == '') {
      throw UserNameAlreadyExistException();
    }
    return true;
  }

  Future<bool> isPhoneExist(String phone) async {
    final DataSnapshot dataSnapshot = await databaseReference
        .child(USER_NODE)
        .equalTo(phone, key: 'phone')
        .once();
    print(dataSnapshot.value);
    if (dataSnapshot.value == null || dataSnapshot.value == '') {
      throw PhoneAlreadyExistException();
    }
    return true;
  }
}
