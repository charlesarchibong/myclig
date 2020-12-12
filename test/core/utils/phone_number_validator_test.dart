import 'package:flutter_test/flutter_test.dart';
import 'package:myclig/core/utils/phone_number_validator.dart';

main() {
  group('test if the phone number is a valid phone number with country code',
      () {
    test(
        'should test if the function will return a valid phone number from an invalid phone number',
        () {
      final result = PhoneNumberValidator.getValidPhoneNumber('09039311559');
      expect(
        result,
        equals('2349039311559'),
      );
    });

    test(
        'should test if the function will return a valid phone number from an valid phone number',
        () {
      final result = PhoneNumberValidator.getValidPhoneNumber('2349039311559');
      expect(
        result,
        equals('2349039311559'),
      );
    });
  });
}
