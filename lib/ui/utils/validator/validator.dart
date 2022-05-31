import 'package:fsof/ui/utils/validator/email_validator.dart';
import 'package:fsof/ui/utils/validator/phone_number_formatter.dart';

class FormatResult {
  FormatResult(this.function, this.errorText);

  bool Function(String) function;
  String errorText;
}

bool validateEmpty(String string) => string.trim().isEmpty;

bool validateEmail(String email) {
  final partsSplittedByDot = email.split('.');
  final domainMoreThanTwoLetters = partsSplittedByDot.isNotEmpty &&
      partsSplittedByDot[partsSplittedByDot.length - 1].length >= 2;
  return !EmailValidator.validate(email) || !domainMoreThanTwoLetters;
}

bool validateZipCode(String string) {
  final numbersOnly = RegExp(r'([0-9]+$)');
  final enoughLength = RegExp(r'(?=.{5,10})');
  final isValid = numbersOnly.hasMatch(string) && enoughLength.hasMatch(string);
  return !isValid;
}

bool validatePassword(String password) {
  final atLeastOneLetter = RegExp(r'^(?=.*[a-z]+)');
  final atLeastOneCapital = RegExp(r'(?=.*[A-Z]+)');
  final atLeastOneNumber = RegExp(r'(?=.*[0-9]+)');
  final atLeastOneSpecial = RegExp(r'(?=.*[!@#\$&\(\)\.\+,\/\-,]*)');
  final enoughLength = RegExp(r'(?=.{8,72})');
  final isValid = atLeastOneLetter.hasMatch(password) &&
      atLeastOneCapital.hasMatch(password) &&
      atLeastOneNumber.hasMatch(password) &&
      atLeastOneSpecial.hasMatch(password) &&
      enoughLength.hasMatch(password);
  return !isValid;
}

bool validatePhone(String phone) {
  final unformattedPhone = undoFormatPhoneNumber(phone);
  return !validatePhoneNumber(unformattedPhone, isFormatted: false);
}

///Todos estos Strings van con textos reales, solo es para probar
final ruleNotEmpty = FormatResult(validateEmpty, 'Strings.fieldIsRequired');
final ruleEmail = FormatResult(validateEmail, 'Strings.incorrectEmail');
final rulePassword =
    FormatResult(validatePassword, 'Strings.incorrectPassword');
final ruleZipCode = FormatResult(validateZipCode, 'Strings.incorrectZipCode');
final rulePhone = FormatResult(validatePhone, 'Strings.incorrectPhoneNumber');

FormatResult rulePasswordsShouldMatch(
  bool Function(String) function,
) {
  return FormatResult(function, 'Strings.passwordAreDifferent');
}

String? validate(String value, List<dynamic> validators) {
  for (var item in validators) {
    if (item.function(value)) {
      return item.errorText;
    }
  }
  return null;
}
