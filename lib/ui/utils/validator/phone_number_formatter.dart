String formatPhoneNumber(String value, {bool isValidateEnabled = true}) {
  if (isValidateEnabled && !validatePhoneNumber(value, isFormatted: false)) {
    return value;
  }

  final countryCode = value.substring(0, value.length - 10);
  final firstPart = value.substring(value.length - 10, value.length - 7);
  final secondPart = value.substring(value.length - 7, value.length - 4);
  final lastPart = value.substring(value.length - 4, value.length);

  return '$countryCode-$firstPart-$secondPart-$lastPart';
}

String undoFormatPhoneNumber(String value, {bool isValidateEnabled = true}) {
  if (isValidateEnabled && !validatePhoneNumber(value, isFormatted: true)) {
    return value;
  }

  return value.replaceAll(RegExp(r'-'), '');
}

bool validatePhoneNumber(String value, {bool isFormatted = true}) {
  final minLength = isFormatted ? 14 : 11;
  final maxLength = isFormatted ? 18 : 14;

  final phoneNumber =
      value.startsWith(RegExp(r'^\+')) ? value.substring(1) : value;

  if (phoneNumber.length < minLength || phoneNumber.length > maxLength) {
    return false;
  }
  if (!isFormatted && !_validatePhone(phoneNumber)) {
    return false;
  }
  if (isFormatted && !phoneNumber.contains('-') ||
      !_validateFormattedPhone(phoneNumber)) {
    return false;
  }

  return true;
}

bool _validatePhone(String value) {
  final regExp = RegExp(r'([^0-9])');
  return !regExp.hasMatch(value);
}

bool _validateFormattedPhone(String value) {
  final regExp = RegExp(r'([^-0-9])');
  return !regExp.hasMatch(value);
}
