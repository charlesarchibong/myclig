import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:myclig/core/errors/failure.dart';
import 'package:myclig/core/utils/map_failure_to_message.dart';
import 'package:myclig/features/user/domain/entities/user_entity.dart';
import 'package:myclig/features/user/domain/usecases/get_user_usecase.dart';
import 'package:myclig/features/user/domain/usecases/login_user_usecase.dart';
import 'package:myclig/features/user/domain/usecases/register_or_update_user_usecase.dart';
import 'package:myclig/features/user/domain/usecases/reset_password_usecase.dart';
import 'package:myclig/features/user/presentation/bloc/user_event.dart';
import 'package:myclig/features/user/presentation/bloc/user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final GetUser getUser;
  final RegisterOrUpdateUser registerOrUpdateUser;
  final LoginUser loginUser;
  final ResetPassword resetPassword;

  UserBloc({
    @required this.getUser,
    @required this.registerOrUpdateUser,
    @required this.loginUser,
    @required this.resetPassword,
  })  : assert(getUser != null),
        assert(registerOrUpdateUser != null),
        assert(loginUser != null),
        assert(resetPassword != null);

  @override
  UserState get initialState => InitialUserState();

  @override
  Stream<UserState> mapEventToState(UserEvent event) async* {
    if (event is RegisterOrUpdateUserEvent) {
      yield LoadingUserState();
      final user = await registerOrUpdateUser(event.userEntity, event.file);
      yield* _mapEitherErrorOrLoaded(user);
    } else if (event is GetUserEvent) {
      yield LoadingUserState();
      final user = await getUser(event.userId);
      yield* _mapEitherErrorOrLoaded(user);
    } else if (event is LoginUserEvent) {
      yield LoadingUserState();
      final user = await loginUser(event.email, event.password);
      yield* _mapEitherErrorOrLoaded(user);
    } else if (event is ResetPasswordEvent) {
      yield LoadingUserState();
      final reset = await resetPassword(event.email);
      yield* _mapEitherErrorOrLoaded(reset);
    }
  }

  Stream<UserState> _mapEitherErrorOrLoaded(
      Either<Failure, UserEntity> user) async* {
    yield user.fold(
      (failure) => ErrorUserState(
          message: MapFailureToMessage.mapFailureToMessage(failure)),
      (userEntity) => LoadedUserState(
        userEntity: userEntity,
      ),
    );
  }
}
