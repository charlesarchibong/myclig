import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:myclig/core/constants/data_constant.dart';
import 'package:myclig/core/local_data/user_token/get_user_logged_in_token.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MockSharedPreferences extends Mock implements SharedPreferences {}

main() {
  MockSharedPreferences mockSharedPreferences;
  GetLoggedInUserTokenImpl getLoggedInUserTokenImpl;

  setUp(() {
    mockSharedPreferences = MockSharedPreferences();
    getLoggedInUserTokenImpl = GetLoggedInUserTokenImpl(mockSharedPreferences);
  });

  test(
      'should test if the token was successfully gotten from the local storage',
      () {
    when(mockSharedPreferences.getString(LOGGEDIN_USER_TOKEN)).thenReturn(
      '12345',
    );
    final result = getLoggedInUserTokenImpl();

    expect(result, equals('12345'));

    verify(mockSharedPreferences.getString(LOGGEDIN_USER_TOKEN));
  });
}
