import 'dart:convert';

import 'package:myclig/core/constants/data_constant.dart';
import 'package:myclig/features/user/data/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class GetLoggedInUserData {
  UserModel call();
}

class GetLoggedInUserDataImpl implements GetLoggedInUserData {
  final SharedPreferences sharedPreferences;

  GetLoggedInUserDataImpl(this.sharedPreferences);

  @override
  UserModel call() {
    if (sharedPreferences.getString(
          LOGGEDIN_USER_DATA,
        ) ==
        null) {
      return null;
    }
    return UserModel.fromMap(
      json.decode(
        sharedPreferences.getString(
          LOGGEDIN_USER_DATA,
        ),
      ),
    );
  }
}
