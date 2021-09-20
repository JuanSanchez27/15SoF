import 'dart:async';

import 'package:dash_kit_network/dash_kit_network.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:fsof/models/network/errors/invalid_credentials_exception.dart';
import 'package:fsof/models/network/errors/token_expired_exception.dart';

class ErrorRecorder {
  ErrorRecorder({required this.context, this.isEnabled = true});

  final bool isEnabled;
  final String context;

  FutureOr<T> recordError<T>(dynamic error, [dynamic stacktrace]) {
    if (!isEnabled) {
      throw error;
    }

    if (stacktrace != null) {
      FirebaseCrashlytics.instance.log(stacktrace.toString());
    }

    if (error is NetworkConnectionException ||
        error is InvalidCredentialsException ||
        error is TokenExpiredException) {
      throw error;
    }

    if (error is RequestErrorException) {
      final exception = error.error;

      FirebaseCrashlytics.instance.log(exception.toString());
    }

    FirebaseCrashlytics.instance.recordError(error, stacktrace);

    throw error;
  }
}
