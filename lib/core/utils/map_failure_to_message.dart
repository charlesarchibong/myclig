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
    } else {
      return 'An expected error occurred, please try again';
    }
  }
}
