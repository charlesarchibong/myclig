import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:myclig/features/user/domain/entities/user_entity.dart';

@immutable
abstract class UserState extends Equatable {
  @override
  List<Object> get props => [];
}

class InitialUserState extends UserState {}

class LoadingUserState extends UserState {}

class LoadedUserState extends UserState {
  final UserEntity userEntity;
  LoadedUserState({
    @required this.userEntity,
  });

  @override
  List<Object> get props => [userEntity];
}

class ErrorUserState extends UserState {
  final String message;
  ErrorUserState({
    @required this.message,
  });

  @override
  List<Object> get props => [message];
}
