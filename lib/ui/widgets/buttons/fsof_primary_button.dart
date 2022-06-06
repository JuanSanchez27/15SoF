import 'package:flutter/material.dart';
import 'package:fsof/ui/styles/styles.dart';
import 'package:fsof/ui/utils/constants/constants.dart';

class FsofPrimaryButton extends StatelessWidget {
  const FsofPrimaryButton({
    required this.text,
    Key? key,
    this.onPressed,
    this.color = kPrimaryColor,
    this.textColor = kWhite100,
    this.padding = const EdgeInsets.all(kDimens16),
    this.splashColor,
  }) : super(key: key);

  final String text;
  final VoidCallback? onPressed;
  final Color color;
  final Color textColor;
  final EdgeInsets padding;
  final Color? splashColor;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        padding: padding,
        backgroundColor: color,
        primary: splashColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(kDimens8),
        ),
        tapTargetSize: MaterialTapTargetSize.padded,
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: Styles.primaryButton.copyWith(color: textColor),
        textAlign: TextAlign.center,
      ),
    );
  }
}
