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
  final bool verified;
  final String fcmToken;
  UserEntity({
    this.fullName,
    this.username,
    this.phone,
    this.profession,
    this.organization,
    this.location,
    this.photoUrl,
    this.userId,
    this.verified = false,
    @required this.email,
    this.fcmToken,
  });
  @override
  List<Object> get props => [
        fullName,
        username,
        phone,
        profession,
        organization,
        location,
        photoUrl,
        this.verified,
        email,
        userId,
        fcmToken,
      ];
}
