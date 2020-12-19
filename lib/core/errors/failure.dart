import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class Failure extends Equatable {
  Failure([List properties = const <dynamic>[]]) : super();
}

class NoInternetFailure extends Failure {
  @override
  List<Object> get props => [];
}

class ServerFailure extends Failure {
  final String message;
  ServerFailure({
    @required this.message,
  });

  @override
  List<Object> get props => [message];
}

class CacheFailure extends Failure {
  @override
  List<Object> get props => [];
}

class NoEntityFailure extends Failure {
  @override
  List<Object> get props => [];
}

class PendingFailure extends Failure {
  @override
  List<Object> get props => [];
}

class UpdateRequiredFailure extends Failure {
  final String message;
  UpdateRequiredFailure({
    this.message,
  });
  @override
  List<Object> get props => [message];
}

class NullFailure extends Failure {
  @override
  List<Object> get props => [];
}

class UnknownFailure extends Failure {
  @override
  List<Object> get props => [];
}