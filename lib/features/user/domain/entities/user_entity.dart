import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String id;
  final String fullName;
  final String userName;
  final String phone;
  final String profession;
  final String organization;
  final String location;
  final String photoUrl;
  UserEntity({
    this.fullName,
    this.userName,
    this.phone,
    this.profession,
    this.organization,
    this.location,
    this.photoUrl,
    this.id,
  });
  @override
  List<Object> get props => [
        fullName,
        userName,
        phone,
        profession,
        organization,
        location,
        photoUrl,
        id,
      ];
}
