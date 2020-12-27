import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:myclig/core/constants/data_constant.dart';
import 'package:myclig/core/local_data/user_token/set_user_logged_in_token.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MockSharedPreferences extends Mock implements SharedPreferences {}

main() {
  MockSharedPreferences mockSharedPreferences;
  SaveLoggedInUserTokenImpl saveLoggedInUserTokenImpl;

  setUp(() {
    mockSharedPreferences = MockSharedPreferences();
    saveLoggedInUserTokenImpl =
        SaveLoggedInUserTokenImpl(mockSharedPreferences);
  });

  test('should test if the token was successfully saved to the local storage',
      () async {
    when(mockSharedPreferences.setString(LOGGEDIN_USER_TOKEN, '12345'))
        .thenAnswer((_) async => true);
    final result = await saveLoggedInUserTokenImpl('12345');

    expect(result, equals(true));

    verify(mockSharedPreferences.setString(LOGGEDIN_USER_TOKEN, '12345'));
  });
}
