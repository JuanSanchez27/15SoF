import 'dart:ui';

import 'package:dash_kit_network/dash_kit_network.dart';
import 'package:flutter/material.dart';
import 'package:fsof/models/network/errors/request_common_error_exception.dart';
import 'package:fsof/resources/colors.dart';
import 'package:fsof/resources/strings.dart';
import 'package:fsof/resources/styles.dart';

Future<DialogResponse?> showNotImplemented(
  BuildContext context, {
  String? featureName,
}) {
  return showSofDialog(
    context: context,
    title: Strings.warning,
    message: Strings.inDevelopment,
    displayNegative: false,
  );
}

Future<DialogResponse?> handleError({
  required BuildContext context,
  required dynamic exception,
  VoidCallback? onRetry,
  String? errorMessage,
  bool barrierDismissible = true,
}) {
  switch (exception.runtimeType) {
    case NetworkConnectionException:
      return showErrorDialog(
        context: context,
        message: Strings.noInternetError,
        onRetry: onRetry,
        barrierDismissible: barrierDismissible,
      );
    case RequestCommonErrorException:
      return showErrorDialog(
        context: context,
        message: errorMessage ?? Strings.commonError,
        onRetry: onRetry,
        barrierDismissible: barrierDismissible,
      );

    default:
      if (errorMessage?.isNotEmpty == true) {
        return showErrorDialog(
          context: context,
          message: errorMessage,
          onRetry: onRetry,
          barrierDismissible: barrierDismissible,
        );
      } else {
        return showErrorDialog(
          context: context,
          onRetry: onRetry,
          barrierDismissible: barrierDismissible,
        );
      }
  }
}

Future<T?> showCommonDialog<T>({
  required BuildContext context,
  required Widget content,
  bool barrierDismissible = true,
  Color? backgroundColor,
}) {
  return showDialog<T>(
    context: context,
    barrierDismissible: barrierDismissible,
    builder: (context) {
      return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
        child: Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14.0),
          ),
          backgroundColor: backgroundColor,
          child: content,
        ),
      );
    },
  );
}

Future<DialogResponse?> showSofDialog({
  required BuildContext context,
  required String title,
  required String message,
  String? positiveButton,
  String? negativeButton,
  bool displayPositive = true,
  bool displayNegative = true,
  bool barrierDismissible = true,
}) {
  return showCommonDialog<DialogResponse>(
    context: context,
    barrierDismissible: barrierDismissible,
    content: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            title,
            style: Styles.dialogTitle,
            textAlign: TextAlign.left,
          ),
          const SizedBox(height: 8),
          Text(
            message,
            style: Styles.dialogText,
            textAlign: TextAlign.left,
          ),
          const SizedBox(height: 16),
          Row(
            children: <Widget>[
              if (displayNegative)
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.of(context, rootNavigator: true)
                          .pop(DialogResponse.decline);
                    },
                    child: Text(
                      negativeButton ?? Strings.cancel,
                      style: Styles.dialogButton,
                    ),
                  ),
                ),
              if (displayPositive && displayNegative) const SizedBox(width: 10),
              if (displayPositive)
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: ColorRes.primary,
                      elevation: 0,
                    ),
                    onPressed: () {
                      Navigator.of(context, rootNavigator: true)
                          .pop(DialogResponse.confirm);
                    },
                    child: Text(
                      positiveButton ?? Strings.ok,
                      style: Styles.dialogButton.copyWith(
                        color: ColorRes.white,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    ),
  );
}

Future<DialogResponse?> showErrorDialog({
  required BuildContext context,
  String? title,
  String? message,
  VoidCallback? onRetry,
  bool barrierDismissible = true,
}) async {
  final response = await showSofDialog(
    context: context,
    title: title ?? Strings.warning,
    message: message ?? Strings.commonError,
    negativeButton: onRetry != null ? Strings.cancel : Strings.ok,
    positiveButton: onRetry != null ? Strings.retry : null,
    displayPositive: onRetry != null,
    displayNegative: true,
    barrierDismissible: barrierDismissible,
  );

  if (response == DialogResponse.confirm && onRetry != null) {
    onRetry();
  }

  return Future.value(response);
}

enum DialogResponse { confirm, decline, cancel }
