import 'package:dartz/dartz.dart';
import 'package:myclig/core/errors/failure.dart';
import 'package:myclig/features/user/domain/entities/user_entity.dart';
import 'package:myclig/features/user/domain/repositories/user_repository.dart';

class RegisterOrUpdateUser {
  final UserRepository userRepository;

  RegisterOrUpdateUser(this.userRepository);

  Future<Either<Failure, UserEntity>> call(UserEntity userEntity) {
    return userRepository.registerOrUpdateUser(userEntity);
  }
}
