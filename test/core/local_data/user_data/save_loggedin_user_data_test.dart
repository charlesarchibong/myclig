import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:myclig/core/constants/data_constant.dart';
import 'package:myclig/core/local_data/user_data/save_loggedin_user_data.dart';
import 'package:myclig/features/user/data/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MockSharedPreferences extends Mock implements SharedPreferences {}

main() {
  MockSharedPreferences mockSharedPreferences;
  SaveLoggedInUserDataImpl setLoggedInUserDateImpl;

  setUp(() {
    mockSharedPreferences = MockSharedPreferences();
    setLoggedInUserDateImpl = SaveLoggedInUserDataImpl(mockSharedPreferences);
  });
  final UserModel userModel = UserModel(
    fullName: 'Charles',
    userId: '111',
    location: 'Calabar',
    organization: 'Software',
    phone: '09039311559',
    photoUrl: 'https://charlesarchibong.com',
    profession: 'Programmer',
    username: 'zealcodes',
  );
  test(
      'should test if the user data was successfully cache in the local storage',
      () async {
    when(
      mockSharedPreferences.setString(
        LOGGEDIN_USER_DATA,
        json.encode(
          userModel.toMap(),
        ),
      ),
    ).thenAnswer((_) async => true);
    final result = await setLoggedInUserDateImpl(userModel);

    expect(result, equals(true));

    verify(
      mockSharedPreferences.setString(
        LOGGEDIN_USER_DATA,
        json.encode(
          userModel.toMap(),
        ),
      ),
    );
  });
}
