import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:myclig/core/errors/failure.dart';
import 'package:myclig/core/utils/map_failure_to_message.dart';
import 'package:myclig/features/user/domain/entities/user_entity.dart';
import 'package:myclig/features/user/domain/usecases/login_user_usecase.dart';
import 'package:myclig/features/user/presentation/bloc/login/login_event.dart';
import 'package:myclig/features/user/presentation/bloc/login/login_state.dart';

class LoginBloc extends Bloc<LoginEvents, LoginStates> {
  final LoginUser loginUser;

  LoginBloc({@required LoginStates initialState, @required this.loginUser})
      : super(initialState);

  @override
  Stream<LoginStates> mapEventToState(LoginEvents event) async* {
    if (event is AuthenticateEvent) {
      yield LoadingLoginState();
      final login = await loginUser(
        event.email,
        event.password,
      );
      yield* _mapEitherErrorOrLoaded(login);
    }
  }

  Stream<LoginStates> _mapEitherErrorOrLoaded(
      Either<Failure, UserEntity> user) async* {
    yield user.fold(
      (failure) => LoginErrorState(
          message: MapFailureToMessage.mapFailureToMessage(failure)),
      (userEntity) => LoggedInState(
        userEntity: userEntity,
      ),
    );
  }
}
