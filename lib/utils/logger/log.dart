import 'package:fsof/utils/debug.dart';

mixin Log {
  static void d(dynamic msg) {
    // ignore: avoid_print
    debug(() => print('${LogLevel.debug.toString().toUpperCase()}: $msg\n'));
  }

  static void e(dynamic msg) {
    // ignore: avoid_print
    debug(() => print('${LogLevel.error.toString().toUpperCase()}: $msg\n'));
  }

  static void i(dynamic msg) {
    // ignore: avoid_print
    debug(() => print('${LogLevel.info.toString().toUpperCase()}: $msg\n'));
  }
}

enum LogLevel { info, debug, error }
