import 'package:meta/meta.dart';

class NoInternetException implements Exception {}

class NoEntityException implements Exception {}

class ServerException implements Exception {
  final String message;

  const ServerException({
    @required this.message,
  });
}

class CacheException implements Exception {}

class NullException implements Exception {}

class EntityAlreadyExistException implements Exception {}

class EmailAlreadyExistException implements Exception {}

class UserNameAlreadyExistException implements Exception {}

class PhoneAlreadyExistException implements Exception {}
