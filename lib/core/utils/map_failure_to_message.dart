import 'package:myclig/core/errors/failure.dart';

class MapFailureToMessage {
  static String mapFailureToMessage(Failure failure) {
    if (failure is ServerFailure) {
      return failure.message;
    } else if (failure is NoInternetFailure) {
      return 'Please check your internet connection and try again';
    } else if (failure is CacheFailure) {
      return 'Entity does not exist on user device';
    } else if (failure is NoEntityFailure) {
      return 'No information available, please try again';
    } else if (failure is EntityAlreadyExistFailure) {
      return 'User exist with this username/phone';
    } else if (failure is EmailAlreadyExistFailure) {
      return 'User already exist with this email';
    } else if (failure is PhoneAlreadyExistFailure) {
      return 'User already exist with this phone number';
    } else if (failure is UserNameAlreadyExistFailure) {
      return 'User already exist with this username';
    } else {
      return 'An expected error occurred, please try again';
    }
  }
}
