import 'package:myclig/core/constants/data_constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class GetLoggedInUserToken {
  String call();
}

class GetLoggedInUserTokenImpl implements GetLoggedInUserToken {
  final SharedPreferences sharedPreferences;

  GetLoggedInUserTokenImpl(this.sharedPreferences);

  @override
  String call() {
    return sharedPreferences.getString(LOGGEDIN_USER_TOKEN);
  }
}
