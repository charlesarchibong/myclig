import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myclig/core/errors/failure.dart';
import 'package:myclig/core/utils/map_failure_to_message.dart';
import 'package:myclig/features/user/domain/entities/user_entity.dart';
import 'package:myclig/features/user/domain/usecases/register_or_update_user_usecase.dart';
import 'package:myclig/features/user/presentation/bloc/user/user_event.dart';
import 'package:myclig/features/user/presentation/bloc/user/user_state.dart';

class VerifyCreatedAccountBloc extends Bloc<UserEvent, UserState> {
  final RegisterOrUpdateUser registerOrUpdateUser;
  VerifyCreatedAccountBloc(
    this.registerOrUpdateUser,
  ) : super(InitialUserState());

  @override
  Stream<UserState> mapEventToState(UserEvent event) async* {
    if (event is RegisterOrUpdateUserEvent) {
      yield LoadingUserState();
      final user = await registerOrUpdateUser(event.userEntity, event.file);
      yield* _mapEitherErrorOrLoaded(user);
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
