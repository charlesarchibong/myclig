import 'package:myclig/core/constants/data_constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class SaveLoggedInUserToken {
  Future<bool> call(String token);
}

class SaveLoggedInUserTokenImpl implements SaveLoggedInUserToken {
  final SharedPreferences sharedPreferences;

  SaveLoggedInUserTokenImpl(this.sharedPreferences);

  @override
  Future<bool> call(String token) async {
    return sharedPreferences.setString(LOGGEDIN_USER_TOKEN, token);
  }
}
