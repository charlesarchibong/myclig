import 'dart:convert';

import 'package:myclig/features/user/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    String id,
    String fullName,
    String userName,
    String phone,
    String profession,
    String organization,
    String location,
    String photoUrl,
  }) : super(
          id: id,
          fullName: fullName,
          location: location,
          organization: organization,
          phone: phone,
          profession: profession,
          userName: userName,
          photoUrl: photoUrl,
        );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'fullName': fullName,
      'userName': userName,
      'phone': phone,
      'profession': profession,
      'organization': organization,
      'location': location,
      'photoUrl': photoUrl,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return UserModel(
      id: map['id'],
      fullName: map['fullName'],
      userName: map['userName'],
      phone: map['phone'],
      profession: map['profession'],
      organization: map['organization'],
      location: map['location'],
      photoUrl: map['photoUrl'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));
}
