import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:myclig/core/utils/map_failure_to_message.dart';
import 'package:myclig/features/user/domain/usecases/get_user.dart';
import 'package:myclig/features/user/domain/usecases/login_user.dart';
import 'package:myclig/features/user/domain/usecases/register_or_update_user.dart';
import 'package:myclig/features/user/presentation/bloc/user_event.dart';
import 'package:myclig/features/user/presentation/bloc/user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final GetUser getUser;
  final RegisterOrUpdateUser registerOrUpdateUser;
  final LoginUser loginUser;

  UserBloc({
    @required this.getUser,
    @required this.registerOrUpdateUser,
    @required this.loginUser,
  })  : assert(getUser != null),
        assert(registerOrUpdateUser != null),
        assert(loginUser != null);

  @override
  UserState get initialState => InitialUserState();

  @override
  Stream<UserState> mapEventToState(
      UserState currentState, UserEvent event) async* {
    if (event is RegisterOrUpdateUserEvent) {
      yield LoadingUserState();
      final user = await registerOrUpdateUser(event.userEntity);
      yield user.fold(
        (failure) => ErrorUserState(
            message: MapFailureToMessage.mapFailureToMessage(failure)),
        (userEntity) => LoadedUserState(
          userEntity: userEntity,
        ),
      );
    } else if (event is GetUserEvent) {
      yield LoadingUserState();
      final user = await getUser(event.userId);
      yield user.fold(
        (failure) => ErrorUserState(
            message: MapFailureToMessage.mapFailureToMessage(failure)),
        (userEntity) => LoadedUserState(
          userEntity: userEntity,
        ),
      );
    } else if (event is LoginUserEvent) {
      yield LoadingUserState();
      final user = await loginUser(event.email, event.password);
      yield user.fold(
        (failure) => ErrorUserState(
            message: MapFailureToMessage.mapFailureToMessage(failure)),
        (userEntity) => LoadedUserState(
          userEntity: userEntity,
        ),
      );
    }
  }
}
