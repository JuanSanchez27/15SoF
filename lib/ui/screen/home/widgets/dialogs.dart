import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fsof/generated/l10n.dart';
import 'package:fsof/ui/styles/styles.dart';
import 'package:fsof/ui/utils/constants/constants.dart';

Future<DialogResponse?> showNotImplemented(
  BuildContext context, {
  String? featureName,
}) {
  return showSofDialog(
    context: context,
    title: I18n.of(context).eWarning,
    message: I18n.of(context).mInDevelopment,
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
    /*case NetworkConnectionException:
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
      );*/

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
        filter: ImageFilter.blur(sigmaX: kDimens18, sigmaY: kDimens18),
        child: Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(kDimens14),
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
      padding: const EdgeInsets.symmetric(
        horizontal: kDimens24,
        vertical: kDimens20,
      ),
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
                      negativeButton ?? I18n.of(context).gCancel,
                      style: Styles.dialogButton,
                    ),
                  ),
                ),
              if (displayPositive && displayNegative) const SizedBox(width: 10),
              if (displayPositive)
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: kPrimaryColor,
                      elevation: kDimens0,
                    ),
                    onPressed: () {
                      Navigator.of(context, rootNavigator: true)
                          .pop(DialogResponse.confirm);
                    },
                    child: Text(
                      positiveButton ?? I18n.of(context).gOk,
                      style: Styles.dialogButton.copyWith(
                        color: kWhite100,
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
    title: title ?? I18n.of(context).eWarning,
    message: message ?? I18n.of(context).eCommonError,
    negativeButton:
        onRetry != null ? I18n.of(context).gCancel : I18n.of(context).gOk,
    positiveButton: onRetry != null ? I18n.of(context).gRetry : null,
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
