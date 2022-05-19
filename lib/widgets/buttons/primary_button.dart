import 'package:flutter/material.dart';
import 'package:fsof/resources/colors.dart';
import 'package:fsof/resources/styles.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    required this.text,
    Key? key,
    this.onPressed,
    this.color = ColorRes.primary,
    this.textColor = ColorRes.white,
    this.padding = const EdgeInsets.all(16),
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
          borderRadius: BorderRadius.circular(8.0),
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
