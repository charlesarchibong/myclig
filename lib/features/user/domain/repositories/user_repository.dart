import 'package:dartz/dartz.dart';
import 'package:myclig/core/errors/failure.dart';
import 'package:myclig/features/user/domain/entities/user_entity.dart';

abstract class UserRepository {
  Future<Either<Failure, UserEntity>> registerOrUpdateUser(
      UserEntity userEntity);
  Future<Either<Failure, UserEntity>> loginUser(String email, String password);
  Future<Either<Failure, UserEntity>> getUser(String userId);
}
