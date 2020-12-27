import 'package:equatable/equatable.dart';

abstract class ResetPasswordEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class SendPasswordResetMailEvent extends ResetPasswordEvent {
  final String email;
  SendPasswordResetMailEvent({
    this.email,
  })  : assert(email.isNotEmpty),
        assert(email != null);

  @override
  List<String> get props => [email];
}
