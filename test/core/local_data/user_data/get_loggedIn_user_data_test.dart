import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:myclig/core/constants/data_constant.dart';
import 'package:myclig/core/local_data/user_data/get_loggedin_user_data.dart';
import 'package:myclig/features/user/data/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../fixtures/fixture.dart';

class MockSharedPreferences extends Mock implements SharedPreferences {}

main() {
  MockSharedPreferences mockSharedPreferences;
  GetLoggedInUserDataImpl getLoggedInUserDateImpl;

  setUp(() {
    mockSharedPreferences = MockSharedPreferences();
    getLoggedInUserDateImpl = GetLoggedInUserDataImpl(mockSharedPreferences);
  });

  test(
      'should test if the user data was successfully gotten from the local storage',
      () {
    when(mockSharedPreferences.getString(LOGGEDIN_USER_DATA)).thenReturn(
      fixture('user_fixture'),
    );
    final result = getLoggedInUserDateImpl();

    expect(result, isA<UserModel>());

    verify(mockSharedPreferences.getString(LOGGEDIN_USER_DATA));
  });
}
