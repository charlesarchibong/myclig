import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:myclig/core/errors/failure.dart';
import 'package:myclig/core/utils/map_failure_to_message.dart';
import 'package:myclig/features/user/domain/usecases/reset_password_usecase.dart';
import 'package:myclig/features/user/presentation/bloc/reset_password/reset_password_event.dart';
import 'package:myclig/features/user/presentation/bloc/reset_password/reset_password_state.dart';

class ResetPasswordBloc extends Bloc<ResetPasswordEvent, ResetPasswordState> {
  final ResetPassword resetPassword;
  ResetPasswordBloc(
      {@required ResetPasswordState initialState, this.resetPassword})
      : super(initialState);

  @override
  Stream<ResetPasswordState> mapEventToState(ResetPasswordEvent event) async* {
    if (event is SendPasswordResetMailEvent) {
      yield SendingResetPasswordMailState();
      final sent = await resetPassword(event.email);
      yield* _mapEitherVoid(sent);
    }
  }

  Stream<ResetPasswordState> _mapEitherVoid(Either<Failure, void> user) async* {
    yield user.fold(
      (failure) => ResetPasswordMailErrorState(
          message: MapFailureToMessage.mapFailureToMessage(failure)),
      (userEntity) => SentResetPasswordMailState(),
    );
  }
}
