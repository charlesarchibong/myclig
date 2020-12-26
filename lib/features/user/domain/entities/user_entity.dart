import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class UserEntity extends Equatable {
  final String userId;
  final String fullName;
  final String username;
  final String phone;
  final String email;
  final String profession;
  final String organization;
  final String location;
  final String photoUrl;
  final String password;
  final String referalCode;
  final bool verified;
  final String fcmToken;
  final bool checkEmailAndUsername;
  UserEntity({
    this.fullName,
    this.username,
    this.phone,
    this.profession,
    this.organization,
    this.location,
    this.photoUrl,
    this.referalCode,
    this.password,
    this.userId,
    this.verified = false,
    this.checkEmailAndUsername = true,
    @required this.email,
    this.fcmToken,
  });
  @override
  List<Object> get props => [
        fullName,
        username,
        phone,
        profession,
        password,
        referalCode,
        organization,
        checkEmailAndUsername,
        location,
        photoUrl,
        verified,
        email,
        userId,
        fcmToken,
      ];

  @override
  bool get stringify => true;
}
