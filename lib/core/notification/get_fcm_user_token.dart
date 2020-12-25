import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:meta/meta.dart';

abstract class AppNotification {
  Future<String> getFirebaseNotificationToken();
}

class AppNotificationImpl implements AppNotification {
  final FirebaseMessaging firebaseMessaging;
  AppNotificationImpl({
    @required this.firebaseMessaging,
  });
  @override
  Future<String> getFirebaseNotificationToken() async {
    return await firebaseMessaging.getToken();
  }
}
