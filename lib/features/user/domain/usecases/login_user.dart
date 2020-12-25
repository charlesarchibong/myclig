import 'package:dartz/dartz.dart';
import 'package:myclig/core/errors/failure.dart';
import 'package:myclig/features/user/domain/entities/user_entity.dart';
import 'package:myclig/features/user/domain/repositories/user_repository.dart';

class LoginUser {
  final UserRepository userRepository;

  LoginUser(this.userRepository);

  Future<Either<Failure, UserEntity>> call(String email, String password) {
    return userRepository.loginUser(email, password);
  }
}
