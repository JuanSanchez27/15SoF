import 'package:flutter/foundation.dart';


mixin Debug {
  static const String firstName = '';
  static const String lastName = '';
  static const String password = '';
  static const String repeatPassword = '';
  static const String suffix = '';
  static const String zipCode = '';
  static const String email = '';
  static const String phone = '';
  static const bool isAgreed = false;

  static bool isDebugModeEnabled() {
    return !kReleaseMode;
  }

  static bool isDemoMode = false;
  static bool isImpersonateModeEnabled = true;
}

void debug(void Function() debugAction) {
  if (Debug.isDebugModeEnabled()) {
    debugAction();
  }
}

void demo(void Function() demoAction) {
  if (Debug.isDemoMode) {
    demoAction();
  }
}

T? demoValue<T>(T debugValue) {
  if (Debug.isDemoMode) {
    return debugValue;
  }

  return null;
}
