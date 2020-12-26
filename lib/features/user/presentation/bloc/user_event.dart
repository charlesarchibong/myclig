import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:myclig/features/user/domain/entities/user_entity.dart';

@immutable
abstract class UserEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class RegisterOrUpdateUserEvent extends UserEvent {
  final UserEntity userEntity;
  final File file;
  RegisterOrUpdateUserEvent({@required this.userEntity, this.file});
  @override
  List<Object> get props => [userEntity];
}

class LoginUserEvent extends UserEvent {
  final String email;
  final String password;
  LoginUserEvent({
    @required this.email,
    @required this.password,
  });
  @override
  List<Object> get props => [email, password];
}

class GetUserEvent extends UserEvent {
  final String userId;
  GetUserEvent({
    @required this.userId,
  });
  @override
  List<Object> get props => [userId];
}

class ResetPasswordEvent extends UserEvent {
  final String email;
  ResetPasswordEvent({
    @required this.email,
  });
  @override
  List<Object> get props => [email];
}
