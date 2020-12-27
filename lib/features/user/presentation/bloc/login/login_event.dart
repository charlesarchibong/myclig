import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class LoginEvents extends Equatable {
  @override
  List<Object> get props => [];
}

class AuthenticateEvent extends LoginEvents {
  final String email;
  final String password;
  AuthenticateEvent({
    @required this.email,
    @required this.password,
  });
  @override
  List<Object> get props => [email, password];
}
