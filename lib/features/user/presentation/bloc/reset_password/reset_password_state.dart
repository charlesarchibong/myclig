import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class ResetPasswordState extends Equatable {
  @override
  List<Object> get props => [];
}

class InitialResetPasswordMailState extends ResetPasswordState {}

class ResetPasswordMailErrorState extends ResetPasswordState {
  final String message;
  ResetPasswordMailErrorState({
    @required this.message,
  });
  @override
  List<Object> get props => [message];
}

class SendingResetPasswordMailState extends ResetPasswordState {}

class SentResetPasswordMailState extends ResetPasswordState {}
