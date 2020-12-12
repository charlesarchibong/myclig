class PhoneNumberValidator {
  static String getValidPhoneNumber(String phone) {
    if (phone == null || phone.isEmpty) return '';
    if (phone.startsWith('0')) {
      phone = '234' + phone.substring(1, phone.length);
    }
    return phone;
  }
}
