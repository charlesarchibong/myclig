import 'package:flutter/material.dart';
import 'package:myclig/core/utils/email_validator.dart';

class CustomFormValidation {
  static Color getColor(String text, FocusNode focus) {
    if (focus.hasFocus && text == null) {
      return Color(0xffE5FFEA);
    }
    if (focus.hasFocus && text.isEmpty) {
      return Colors.redAccent;
    } else if (focus.hasFocus && text.isNotEmpty) {
      return Color(0xffE5FFEA);
    } else {
      return Colors.transparent;
    }
  }

  static Color getColorBvn(String text, FocusNode focus) {
    if (focus.hasFocus && text == null) {
      return Color(0xffE5FFEA);
    }
    if (focus.hasFocus && text.isEmpty) {
      return Colors.redAccent;
    } else if (text != null && text.length != 11) {
      return Colors.redAccent;
    } else if (focus.hasFocus && text.isNotEmpty) {
      return Color(0xffE5FFEA);
    } else {
      return Colors.transparent;
    }
  }

  static String errorEmailMessage(String text, String message, [String type]) {
    // var text = text ? '' : message;
    // return text;
    if (text == null) {
      return '';
    } else if (text.isEmpty) {
      return message;
    } else if (EmailValidator.validEmail(text) == false) {
      return 'Email must be a valid email address';
    } else {
      return '';
    }
  }

  static String errorMessage(String text, String message, [String type]) {
    // var text = text ? '' : message;
    // return text;
    if (text == null) {
      return '';
    } else if (text.isEmpty) {
      return message;
    } else {
      return '';
    }
  }

  static String errorMessagePassword(String text, String message,
      [String type]) {
    // var text = text ? '' : message;
    // return text;
    if (text == null) {
      return '';
    } else if (text.isEmpty) {
      return message;
    } else if (text.length <= 7) {
      return 'Password must have 8 or more characters';
    } else {
      return '';
    }
  }

  static String errorMessageAccount(String text, String message,
      [String type]) {
    if (text == null) {
      return '';
    } else if (text.isEmpty) {
      return message;
    } else if (text.length <= 9) {
      return 'Account number must have 10 characters';
    } else {
      return '';
    }
  }

  static String errorPhoneNumber(String text, String message, [String type]) {
    if (text == null) {
      return '';
    } else if (text.isEmpty) {
      return message;
    } else if (text.length <= 10) {
      return 'Phone number must have 11 characters';
    } else {
      return '';
    }
  }

  static String errorMessageConfirmPassword(
      String text, String message, String password,
      [String type]) {
    // var text = text ? '' : message;
    // return text;
    if (text == null) {
      return '';
    } else if (text.isEmpty) {
      return message;
    } else if (text.length <= 7) {
      return 'Password must have 8 or more characters';
    } else if (text != password) {
      return 'Confirmation password must match password';
    } else {
      return '';
    }
  }

  static String errorMessagePin(String text, String message, [String type]) {
    // var text = text ? '' : message;
    // return text;
    if (text == null) {
      return '';
    } else if (text.isEmpty) {
      return message;
    } else if (text.length <= 3) {
      return 'Pin must have 4 characters';
    } else {
      return '';
    }
  }

  static String errorMessageConfirmPin(
      String text, String message, String password,
      [String type]) {
    // var text = text ? '' : message;
    // return text;
    if (text == null) {
      return '';
    } else if (text.isEmpty) {
      return message;
    } else if (text.length <= 3) {
      return 'Password must have 4 characters';
    } else if (text != password) {
      return 'Confirmation pin must match pin';
    } else {
      return '';
    }
  }

  static String errorMessageBvn(String text, String message, [String type]) {
    // var text = text ? '' : message;
    // return text;
    if (text == null) {
      return '';
    } else if (text.isEmpty) {
      return message;
    } else if (text.length != 11) {
      return 'Please enter a valid BVN';
    } else {
      return '';
    }
  }
}
