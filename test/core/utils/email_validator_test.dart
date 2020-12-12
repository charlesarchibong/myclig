import 'package:flutter_test/flutter_test.dart';
import 'package:myclig/core/utils/email_validator.dart';

main() {
  group('should test for valid email', () {
    test('should return true when the email is valid', () {
      final result = EmailValidator.validEmail('charlesarchibong10@gmail.com');
      expect(result, equals(true));
    });

    test('should return false when the email is invalid', () {
      final result = EmailValidator.validEmail('charlesarchibong10@gmail.');
      expect(result, equals(false));
    });
  });
}
