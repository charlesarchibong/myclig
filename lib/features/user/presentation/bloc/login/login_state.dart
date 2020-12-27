import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:myclig/features/user/domain/entities/user_entity.dart';

@immutable
abstract class LoginStates extends Equatable {
  @override
  List<Object> get props => [];
}

class InitialLoginState extends LoginStates {}

class LoadingLoginState extends LoginStates {}

class LoginErrorState extends LoginStates {
  final String message;
  LoginErrorState({
    this.message,
  }) : assert(message != null);
}

class LoggedInState extends LoginStates {
  final UserEntity userEntity;
  LoggedInState({
    this.userEntity,
  }) : assert(userEntity != null);
  @override
  List<Object> get props => [userEntity];
}
