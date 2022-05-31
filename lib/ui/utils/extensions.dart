import 'dart:io';

import 'package:fsof/ui/utils/formats.dart';


extension StringExtension on String {
  String capitalize() {
    if (length == 0) {
      return this;
    }
    if (length <= 1) {
      return toUpperCase();
    }
    return '${this[0].toUpperCase()}${substring(1)}';
  }

  String toPrivatePhone() {
    if (length < 4) {
      return this;
    }
    return 'xxx-xxx-${substring(length - 4)}';
  }

  String toPrivateEmail() {
    if (!contains('@')) {
      return this;
    }
    final mainPart = split('@')[0];

    String replace(startIndex) =>
        replaceRange(startIndex, indexOf('@'), 'xxxxxx');

    if (mainPart.length < 3) {
      return replace(1);
    }
    return replace(3);
  }

  String snakeToCamel() {
    if (isEmpty) {
      return this;
    }

    final inputs =
        split('_').fold('', (prev, item) => '$prev${item.capitalize()}').trim();
    return inputs[0].toLowerCase() + inputs.substring(1);
  }

  String camelToSnake() {
    if (isEmpty) {
      return this;
    }

    final result =
        replaceAllMapped(RegExp('[A-Z]'), (match) => '_${match.group(0)}');
    final finalResult = result.toLowerCase();

    return finalResult;
  }

  String snakeToCommon() {
    if (isEmpty) {
      return this;
    }

    final inputs = split('_');
    return inputs.fold('', (prev, item) => '$prev ${item.capitalize()}').trim();
  }
}

// https://github.com/dart-lang/sdk/issues/42947
extension FirstWhereOrNullExtension<E> on Iterable<E> {
  E? firstWhereOrNull(bool Function(E) test) {
    for (final element in this) {
      if (test(element)) {
        return element;
      }
    }

    return null;
  }
}

extension DateExtension on DateTime? {
  String toDefaultFormatString() {
    if (this == null) {
      return '';
    }

    try {
      return defaultDateFormat.format(this!);
    } on Exception catch (_) {
      return '';
    }
  }
}

extension PlatformEnvironmentExtension on Platform {
  static bool isTest = Platform.environment.containsKey('FLUTTER_TEST');
}
