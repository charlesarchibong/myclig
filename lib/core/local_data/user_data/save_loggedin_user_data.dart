import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../features/user/data/models/user_model.dart';
import '../../constants/data_constant.dart';

abstract class SaveLoggedInUserData {
  Future<bool> call(UserModel userModel);
}

class SaveLoggedInUserDataImpl implements SaveLoggedInUserData {
  final SharedPreferences sharedPreferences;

  SaveLoggedInUserDataImpl(this.sharedPreferences);

  @override
  Future<bool> call(UserModel userModel) {
    return sharedPreferences.setString(
      LOGGEDIN_USER_DATA,
      json.encode(
        userModel.toMap(),
      ),
    );
  }
}
