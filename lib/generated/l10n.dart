// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class I18n {
  I18n();

  static I18n? _current;

  static I18n get current {
    assert(_current != null,
        'No instance of I18n was loaded. Try to initialize the I18n delegate before accessing I18n.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<I18n> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = I18n();
      I18n._current = instance;

      return instance;
    });
  }

  static I18n of(BuildContext context) {
    final instance = I18n.maybeOf(context);
    assert(instance != null,
        'No instance of I18n present in the widget tree. Did you add I18n.delegate in localizationsDelegates?');
    return instance!;
  }

  static I18n? maybeOf(BuildContext context) {
    return Localizations.of<I18n>(context, I18n);
  }

  /// `name`
  String get sHomeName {
    return Intl.message(
      'name',
      name: 'sHomeName',
      desc: '',
      args: [],
    );
  }

  /// `url`
  String get sHomeUrl {
    return Intl.message(
      'url',
      name: 'sHomeUrl',
      desc: '',
      args: [],
    );
  }

  /// `15SoF`
  String get sTitle {
    return Intl.message(
      '15SoF',
      name: 'sTitle',
      desc: '',
      args: [],
    );
  }

  /// `Follow`
  String get sHomeFollow {
    return Intl.message(
      'Follow',
      name: 'sHomeFollow',
      desc: '',
      args: [],
    );
  }

  /// `Following`
  String get sHomeFollowing {
    return Intl.message(
      'Following',
      name: 'sHomeFollowing',
      desc: '',
      args: [],
    );
  }

  /// `Get Fame`
  String get sLandingGetFameTitle {
    return Intl.message(
      'Get Fame',
      name: 'sLandingGetFameTitle',
      desc: '',
      args: [],
    );
  }

  /// `Receive your video board and TV appearances`
  String get sLandingGetFameSubtitle {
    return Intl.message(
      'Receive your video board and TV appearances',
      name: 'sLandingGetFameSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Create Fame`
  String get sLandingCreateFameTitle {
    return Intl.message(
      'Create Fame',
      name: 'sLandingCreateFameTitle',
      desc: '',
      args: [],
    );
  }

  /// `Get instant rewards by joining a challenge`
  String get sLandingCreateFameSubtitle {
    return Intl.message(
      'Get instant rewards by joining a challenge',
      name: 'sLandingCreateFameSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Watch Fame`
  String get sLandingWatchFame {
    return Intl.message(
      'Watch Fame',
      name: 'sLandingWatchFame',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get sLoginEmail {
    return Intl.message(
      'Email',
      name: 'sLoginEmail',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get sLoginPassword {
    return Intl.message(
      'Password',
      name: 'sLoginPassword',
      desc: '',
      args: [],
    );
  }

  /// `Forgot password?`
  String get sLoginForgotPassword {
    return Intl.message(
      'Forgot password?',
      name: 'sLoginForgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Email Log In`
  String get sLoginEmailTitle {
    return Intl.message(
      'Email Log In',
      name: 'sLoginEmailTitle',
      desc: '',
      args: [],
    );
  }

  /// `Enter your email address`
  String get sLoginEmailSubtitle {
    return Intl.message(
      'Enter your email address',
      name: 'sLoginEmailSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Enter your password`
  String get sLoginEmailPasswordSubtitle {
    return Intl.message(
      'Enter your password',
      name: 'sLoginEmailPasswordSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Enter Phone Number`
  String get sLoginMobileTitle {
    return Intl.message(
      'Enter Phone Number',
      name: 'sLoginMobileTitle',
      desc: '',
      args: [],
    );
  }

  /// `A verification code will be sent to you`
  String get sLoginMobileSubtitle {
    return Intl.message(
      'A verification code will be sent to you',
      name: 'sLoginMobileSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Send code`
  String get sLoginMobileSendCode {
    return Intl.message(
      'Send code',
      name: 'sLoginMobileSendCode',
      desc: '',
      args: [],
    );
  }

  /// `Enter code`
  String get sLoginCodeEnterCode {
    return Intl.message(
      'Enter code',
      name: 'sLoginCodeEnterCode',
      desc: '',
      args: [],
    );
  }

  /// `Code sent to\n${to}`
  String sLoginCodeCodeSentTo(Object to) {
    return Intl.message(
      'Code sent to\n\$$to',
      name: 'sLoginCodeCodeSentTo',
      desc: '',
      args: [to],
    );
  }

  /// `Send new code`
  String get sLoginCodeSendNewCode {
    return Intl.message(
      'Send new code',
      name: 'sLoginCodeSendNewCode',
      desc: '',
      args: [],
    );
  }

  /// `Enter Your Birthday`
  String get sLoginEnterBirthdayTitle {
    return Intl.message(
      'Enter Your Birthday',
      name: 'sLoginEnterBirthdayTitle',
      desc: '',
      args: [],
    );
  }

  /// `You must be 13 or older to use this app`
  String get sLoginEnterBirthdayDesc {
    return Intl.message(
      'You must be 13 or older to use this app',
      name: 'sLoginEnterBirthdayDesc',
      desc: '',
      args: [],
    );
  }

  /// `mm/dd/yyyy`
  String get sLoginEnterBirthdayHint {
    return Intl.message(
      'mm/dd/yyyy',
      name: 'sLoginEnterBirthdayHint',
      desc: '',
      args: [],
    );
  }

  /// ` Since you're younger than 18, parental consent is required.`
  String get sLoginParentalConsentTitle {
    return Intl.message(
      ' Since you\'re younger than 18, parental consent is required.',
      name: 'sLoginParentalConsentTitle',
      desc: '',
      args: [],
    );
  }

  /// `Your parental or legal guardian must enter their initials to authorize your use.`
  String get sLoginParentalContentSubtitle {
    return Intl.message(
      'Your parental or legal guardian must enter their initials to authorize your use.',
      name: 'sLoginParentalContentSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Consenting parent initials`
  String get sLoginParentalConsentingInitial {
    return Intl.message(
      'Consenting parent initials',
      name: 'sLoginParentalConsentingInitial',
      desc: '',
      args: [],
    );
  }

  /// `The future of memories`
  String get sLoginGuestPageTitle {
    return Intl.message(
      'The future of memories',
      name: 'sLoginGuestPageTitle',
      desc: '',
      args: [],
    );
  }

  /// `®`
  String get sLoginGuestPageR {
    return Intl.message(
      '®',
      name: 'sLoginGuestPageR',
      desc: '',
      args: [],
    );
  }

  /// `Or Continue with`
  String get sLoginGuestPageContinue {
    return Intl.message(
      'Or Continue with',
      name: 'sLoginGuestPageContinue',
      desc: '',
      args: [],
    );
  }

  /// `Registered by email?`
  String get sLoginGuestPageRegistered1 {
    return Intl.message(
      'Registered by email?',
      name: 'sLoginGuestPageRegistered1',
      desc: '',
      args: [],
    );
  }

  /// ` Log In `
  String get sLoginGuestPageRegistered2 {
    return Intl.message(
      ' Log In ',
      name: 'sLoginGuestPageRegistered2',
      desc: '',
      args: [],
    );
  }

  /// `here.`
  String get sLoginGuestPageRegistered3 {
    return Intl.message(
      'here.',
      name: 'sLoginGuestPageRegistered3',
      desc: '',
      args: [],
    );
  }

  /// `Continue with Phone`
  String get sLoginGuestPageLogin {
    return Intl.message(
      'Continue with Phone',
      name: 'sLoginGuestPageLogin',
      desc: '',
      args: [],
    );
  }

  /// `By continuing, I accept the`
  String get sLoginGuestPageAgreement1 {
    return Intl.message(
      'By continuing, I accept the',
      name: 'sLoginGuestPageAgreement1',
      desc: '',
      args: [],
    );
  }

  /// ` Official Rules `
  String get sLoginGuestPageAgreement2 {
    return Intl.message(
      ' Official Rules ',
      name: 'sLoginGuestPageAgreement2',
      desc: '',
      args: [],
    );
  }

  /// `&`
  String get sLoginGuestPageAgreement3 {
    return Intl.message(
      '&',
      name: 'sLoginGuestPageAgreement3',
      desc: '',
      args: [],
    );
  }

  /// ` Privacy Policy.`
  String get sLoginGuestPageAgreement4 {
    return Intl.message(
      ' Privacy Policy.',
      name: 'sLoginGuestPageAgreement4',
      desc: '',
      args: [],
    );
  }

  /// `Privacy Policy`
  String get sWebViewPrivacyPolicyTitle {
    return Intl.message(
      'Privacy Policy',
      name: 'sWebViewPrivacyPolicyTitle',
      desc: '',
      args: [],
    );
  }

  /// `Official Rules`
  String get sWebViewTermsOfUseTitle {
    return Intl.message(
      'Official Rules',
      name: 'sWebViewTermsOfUseTitle',
      desc: '',
      args: [],
    );
  }

  /// `You must be 13 years or older to use this app`
  String get wMinAgeRequired {
    return Intl.message(
      'You must be 13 years or older to use this app',
      name: 'wMinAgeRequired',
      desc: '',
      args: [],
    );
  }

  /// `Got It`
  String get wMinAgeGotIt {
    return Intl.message(
      'Got It',
      name: 'wMinAgeGotIt',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get gCancel {
    return Intl.message(
      'Cancel',
      name: 'gCancel',
      desc: '',
      args: [],
    );
  }

  /// `OK`
  String get gOk {
    return Intl.message(
      'OK',
      name: 'gOk',
      desc: '',
      args: [],
    );
  }

  /// `Done`
  String get gDone {
    return Intl.message(
      'Done',
      name: 'gDone',
      desc: '',
      args: [],
    );
  }

  /// `Retry`
  String get gRetry {
    return Intl.message(
      'Retry',
      name: 'gRetry',
      desc: '',
      args: [],
    );
  }

  /// `Skip`
  String get gSkip {
    return Intl.message(
      'Skip',
      name: 'gSkip',
      desc: '',
      args: [],
    );
  }

  /// `Continue`
  String get gContinue {
    return Intl.message(
      'Continue',
      name: 'gContinue',
      desc: '',
      args: [],
    );
  }

  /// `Loading`
  String get gLoading {
    return Intl.message(
      'Loading',
      name: 'gLoading',
      desc: '',
      args: [],
    );
  }

  /// `This functionality is in development`
  String get mInDevelopment {
    return Intl.message(
      'This functionality is in development',
      name: 'mInDevelopment',
      desc: '',
      args: [],
    );
  }

  /// `Warning`
  String get eWarning {
    return Intl.message(
      'Warning',
      name: 'eWarning',
      desc: '',
      args: [],
    );
  }

  /// `An error occurred while performing the operation`
  String get eCommonError {
    return Intl.message(
      'An error occurred while performing the operation',
      name: 'eCommonError',
      desc: '',
      args: [],
    );
  }

  /// `Operation timeout exceeded`
  String get eTimeoutError {
    return Intl.message(
      'Operation timeout exceeded',
      name: 'eTimeoutError',
      desc: '',
      args: [],
    );
  }

  /// `Could not connect to the server. Please check your internet connection`
  String get eNoInternetError {
    return Intl.message(
      'Could not connect to the server. Please check your internet connection',
      name: 'eNoInternetError',
      desc: '',
      args: [],
    );
  }

  /// `Invalid phone number`
  String get eInvalidPhoneNumber {
    return Intl.message(
      'Invalid phone number',
      name: 'eInvalidPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Incorrect verification code`
  String get eIncorrectCode {
    return Intl.message(
      'Incorrect verification code',
      name: 'eIncorrectCode',
      desc: '',
      args: [],
    );
  }

  /// `Numbers of attempts to verify phone number exceeded the limit. \nPlease try again in 1 hour.`
  String get eNumbersAttendsExceedLimit {
    return Intl.message(
      'Numbers of attempts to verify phone number exceeded the limit. \nPlease try again in 1 hour.',
      name: 'eNumbersAttendsExceedLimit',
      desc: '',
      args: [],
    );
  }

  /// `Press Plus button`
  String get pressPlsButton {
    return Intl.message(
      'Press Plus button',
      name: 'pressPlsButton',
      desc: '',
      args: [],
    );
  }

  /// `Skip Count`
  String get skipCount {
    return Intl.message(
      'Skip Count',
      name: 'skipCount',
      desc: '',
      args: [],
    );
  }

  /// `This field is required`
  String get fieldIsRequired {
    return Intl.message(
      'This field is required',
      name: 'fieldIsRequired',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid email address`
  String get incorrectEmail {
    return Intl.message(
      'Please enter a valid email address',
      name: 'incorrectEmail',
      desc: '',
      args: [],
    );
  }

  /// `The password must be a minimum of 8 \n characters with at least one number, lowercase and uppercase letters. \n Special characters [! @ # $ & ( ) . + , / -] are allowed`
  String get incorrectPassword {
    return Intl.message(
      'The password must be a minimum of 8 \n characters with at least one number, lowercase and uppercase letters. \n Special characters [! @ # \$ & ( ) . + , / -] are allowed',
      name: 'incorrectPassword',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid zip code`
  String get incorrectZipCode {
    return Intl.message(
      'Please enter a valid zip code',
      name: 'incorrectZipCode',
      desc: '',
      args: [],
    );
  }

  /// `Incorrect phone number format`
  String get incorrectPhoneNumber {
    return Intl.message(
      'Incorrect phone number format',
      name: 'incorrectPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Passwords do not match`
  String get passwordAreDifferent {
    return Intl.message(
      'Passwords do not match',
      name: 'passwordAreDifferent',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<I18n> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<I18n> load(Locale locale) => I18n.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
