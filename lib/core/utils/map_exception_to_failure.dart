import 'package:myclig/core/errors/error.dart';
import 'package:myclig/core/errors/failure.dart';

class MapExceptionToFailure {
  static Failure errorToFailre(dynamic e) {
    if (e is ServerException) {
      return ServerFailure(message: e.message);
    } else if (e is EmailAlreadyExistException) {
      return EmailAlreadyExistFailure();
    } else if (e is CacheException) {
      return CacheFailure();
    } else if (e is EntityAlreadyExistException) {
      return EntityAlreadyExistFailure();
    } else if (e is NoEntityException) {
      return NoEntityFailure();
    } else if (e is NoInternetException) {
      return NoInternetFailure();
    } else if (e is PhoneAlreadyExistException) {
      return PhoneAlreadyExistFailure();
    } else if (e is UserNameAlreadyExistException) {
      return UserNameAlreadyExistFailure();
    } else {
      return UnknownFailure();
    }
  }
}
