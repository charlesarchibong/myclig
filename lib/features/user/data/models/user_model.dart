import 'dart:convert';

import 'package:myclig/features/user/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    String userId,
    String fullName,
    String username,
    String phone,
    String profession,
    String organization,
    String location,
    String photoUrl,
    String email,
    String fcmToken,
    bool verified = false,
  }) : super(
          userId: userId,
          fullName: fullName,
          location: location,
          organization: organization,
          phone: phone,
          profession: profession,
          username: username,
          photoUrl: photoUrl,
          email: email,
          verified: verified,
          fcmToken: fcmToken,
        );

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'fullName': fullName,
      'username': username,
      'phone': phone,
      'profession': profession,
      'organization': organization,
      'location': location,
      'img_url': photoUrl,
      'email': email,
      'verified': verified,
      'fcmToken': fcmToken
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return UserModel(
      userId: map['userId'],
      fullName: map['fullName'],
      username: map['username'],
      phone: map['phone'],
      profession: map['profession'],
      organization: map['organization'],
      location: map['location'],
      photoUrl: map['img_url'],
      email: map['email'],
      verified: map['verified'],
      fcmToken: map['fcmToken'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));
}
