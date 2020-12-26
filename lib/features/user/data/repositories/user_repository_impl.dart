import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:myclig/core/errors/error.dart';
import 'package:myclig/core/errors/failure.dart';
import 'package:myclig/core/network/network_info.dart';
import 'package:myclig/core/utils/map_exception_to_failure.dart';
import 'package:myclig/features/user/data/datasources/user_remote_data_source.dart';
import 'package:myclig/features/user/domain/entities/user_entity.dart';
import 'package:myclig/features/user/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final NetworkInfo networkInfo;
  final UserRemoteDataSource userRemoteDataSource;
  UserRepositoryImpl({
    @required this.networkInfo,
    @required this.userRemoteDataSource,
  });
  @override
  Future<Either<Failure, UserEntity>> getUser(String userId) async {
    try {
      if (await networkInfo.isConnected) {
        return Right(
          await userRemoteDataSource.getUser(userId),
        );
      } else {
        throw NoInternetException();
      }
    } catch (e) {
      return Left(MapExceptionToFailure.errorToFailre(e));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> loginUser(
      String email, String password) async {
    try {
      if (await networkInfo.isConnected) {
        return Right(
          await userRemoteDataSource.loginUser(
            email,
            password,
          ),
        );
      } else {
        throw NoInternetException();
      }
    } catch (e) {
      return Left(MapExceptionToFailure.errorToFailre(e));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> registerOrUpdateUser(
      UserEntity userEntity,
      [File image]) async {
    try {
      if (await networkInfo.isConnected) {
        return Right(
          await userRemoteDataSource.registerOrUpdateUser(
            userEntity,
            image,
          ),
        );
      } else {
        throw NoInternetException();
      }
    } catch (e) {
      return Left(MapExceptionToFailure.errorToFailre(e));
    }
  }
}
