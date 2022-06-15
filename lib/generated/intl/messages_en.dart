// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(to) => "Code sent to\n\$${to}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "eCommonError": MessageLookupByLibrary.simpleMessage(
            "An error occurred while performing the operation"),
        "eIncorrectCode":
            MessageLookupByLibrary.simpleMessage("Incorrect verification code"),
        "eInvalidPhoneNumber":
            MessageLookupByLibrary.simpleMessage("Invalid phone number"),
        "eNoInternetError": MessageLookupByLibrary.simpleMessage(
            "Could not connect to the server. Please check your internet connection"),
        "eNumbersAttendsExceedLimit": MessageLookupByLibrary.simpleMessage(
            "Numbers of attempts to verify phone number exceeded the limit. \nPlease try again in 1 hour."),
        "eTimeoutError":
            MessageLookupByLibrary.simpleMessage("Operation timeout exceeded"),
        "eWarning": MessageLookupByLibrary.simpleMessage("Warning"),
        "fieldIsRequired":
            MessageLookupByLibrary.simpleMessage("This field is required"),
        "gCancel": MessageLookupByLibrary.simpleMessage("Cancel"),
        "gContinue": MessageLookupByLibrary.simpleMessage("Continue"),
        "gDone": MessageLookupByLibrary.simpleMessage("Done"),
        "gLoading": MessageLookupByLibrary.simpleMessage("Loading"),
        "gOk": MessageLookupByLibrary.simpleMessage("OK"),
        "gRetry": MessageLookupByLibrary.simpleMessage("Retry"),
        "gSkip": MessageLookupByLibrary.simpleMessage("Skip"),
        "incorrectEmail": MessageLookupByLibrary.simpleMessage(
            "Please enter a valid email address"),
        "incorrectPassword": MessageLookupByLibrary.simpleMessage(
            "The password must be a minimum of 8 \n characters with at least one number, lowercase and uppercase letters. \n Special characters [! @ # \$ & ( ) . + , / -] are allowed"),
        "incorrectPhoneNumber": MessageLookupByLibrary.simpleMessage(
            "Incorrect phone number format"),
        "incorrectZipCode": MessageLookupByLibrary.simpleMessage(
            "Please enter a valid zip code"),
        "mInDevelopment": MessageLookupByLibrary.simpleMessage(
            "This functionality is in development"),
        "passwordAreDifferent":
            MessageLookupByLibrary.simpleMessage("Passwords do not match"),
        "pressPlsButton":
            MessageLookupByLibrary.simpleMessage("Press Plus button"),
        "sHomeFollow": MessageLookupByLibrary.simpleMessage("Follow"),
        "sHomeFollowing": MessageLookupByLibrary.simpleMessage("Following"),
        "sHomeName": MessageLookupByLibrary.simpleMessage("name"),
        "sHomeUrl": MessageLookupByLibrary.simpleMessage("url"),
        "sLandingCreateFameSubtitle": MessageLookupByLibrary.simpleMessage(
            "Get instant rewards by joining a challenge"),
        "sLandingCreateFameTitle":
            MessageLookupByLibrary.simpleMessage("Create Fame"),
        "sLandingGetFameSubtitle": MessageLookupByLibrary.simpleMessage(
            "Receive your video board and TV appearances"),
        "sLandingGetFameTitle":
            MessageLookupByLibrary.simpleMessage("Get Fame"),
        "sLandingWatchFame": MessageLookupByLibrary.simpleMessage("Watch Fame"),
        "sLoginCodeCodeSentTo": m0,
        "sLoginCodeEnterCode":
            MessageLookupByLibrary.simpleMessage("Enter code"),
        "sLoginCodeSendNewCode":
            MessageLookupByLibrary.simpleMessage("Send new code"),
        "sLoginEmail": MessageLookupByLibrary.simpleMessage("Email"),
        "sLoginEmailPasswordSubtitle":
            MessageLookupByLibrary.simpleMessage("Enter your password"),
        "sLoginEmailSubtitle":
            MessageLookupByLibrary.simpleMessage("Enter your email address"),
        "sLoginEmailTitle":
            MessageLookupByLibrary.simpleMessage("Email Log In"),
        "sLoginEnterBirthdayDesc": MessageLookupByLibrary.simpleMessage(
            "You must be 13 or older to use this app"),
        "sLoginEnterBirthdayHint":
            MessageLookupByLibrary.simpleMessage("mm/dd/yyyy"),
        "sLoginEnterBirthdayTitle":
            MessageLookupByLibrary.simpleMessage("Enter Your Birthday"),
        "sLoginForgotPassword":
            MessageLookupByLibrary.simpleMessage("Forgot password?"),
        "sLoginGuestPageAgreement1":
            MessageLookupByLibrary.simpleMessage("By continuing, I accept the"),
        "sLoginGuestPageAgreement2":
            MessageLookupByLibrary.simpleMessage(" Official Rules "),
        "sLoginGuestPageAgreement3": MessageLookupByLibrary.simpleMessage("&"),
        "sLoginGuestPageAgreement4":
            MessageLookupByLibrary.simpleMessage(" Privacy Policy."),
        "sLoginGuestPageContinue":
            MessageLookupByLibrary.simpleMessage("Or Continue with"),
        "sLoginGuestPageLogin":
            MessageLookupByLibrary.simpleMessage("Continue with Phone"),
        "sLoginGuestPageR": MessageLookupByLibrary.simpleMessage("®"),
        "sLoginGuestPageRegistered1":
            MessageLookupByLibrary.simpleMessage("Registered by email?"),
        "sLoginGuestPageRegistered2":
            MessageLookupByLibrary.simpleMessage(" Log In "),
        "sLoginGuestPageRegistered3":
            MessageLookupByLibrary.simpleMessage("here."),
        "sLoginGuestPageTitle":
            MessageLookupByLibrary.simpleMessage("The future of memories"),
        "sLoginMobileSendCode":
            MessageLookupByLibrary.simpleMessage("Send code"),
        "sLoginMobileSubtitle": MessageLookupByLibrary.simpleMessage(
            "A verification code will be sent to you"),
        "sLoginMobileTitle":
            MessageLookupByLibrary.simpleMessage("Enter Phone Number"),
        "sLoginParentalConsentTitle": MessageLookupByLibrary.simpleMessage(
            " Since you\'re younger than 18, parental consent is required."),
        "sLoginParentalConsentingInitial":
            MessageLookupByLibrary.simpleMessage("Consenting parent initials"),
        "sLoginParentalContentSubtitle": MessageLookupByLibrary.simpleMessage(
            "Your parental or legal guardian must enter their initials to authorize your use."),
        "sLoginPassword": MessageLookupByLibrary.simpleMessage("Password"),
        "sTitle": MessageLookupByLibrary.simpleMessage("15SoF"),
        "sWebViewPrivacyPolicyTitle":
            MessageLookupByLibrary.simpleMessage("Privacy Policy"),
        "sWebViewTermsOfUseTitle":
            MessageLookupByLibrary.simpleMessage("Official Rules"),
        "skipCount": MessageLookupByLibrary.simpleMessage("Skip Count"),
        "wMinAgeGotIt": MessageLookupByLibrary.simpleMessage("Got It"),
        "wMinAgeRequired": MessageLookupByLibrary.simpleMessage(
            "You must be 13 years or older to use this app")
      };
}
