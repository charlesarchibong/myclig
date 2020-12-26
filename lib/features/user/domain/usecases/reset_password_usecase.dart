import 'package:dartz/dartz.dart';
import 'package:myclig/core/errors/failure.dart';
import 'package:myclig/features/user/domain/entities/user_entity.dart';
import 'package:myclig/features/user/domain/repositories/user_repository.dart';

class ResetPassword {
  final UserRepository userRepository;

  ResetPassword(this.userRepository);

  Future<Either<Failure, UserEntity>> call(String email) {
    return userRepository.resetPassword(email);
  }
}
