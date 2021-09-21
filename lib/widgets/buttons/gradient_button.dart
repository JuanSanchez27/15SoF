import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fsof/resources/colors.dart';
import 'package:fsof/resources/styles.dart';

class GradientButton extends StatelessWidget {
  const GradientButton({
    required this.text,
    Key? key,
    this.onPressed,
    this.textColor = ColorRes.white,
    this.padding = const EdgeInsets.symmetric(horizontal: 46, vertical: 12),
    this.icon,
    this.gradient,
  }) : super(key: key);

  final String? icon;
  final String text;
  final VoidCallback? onPressed;
  final Color textColor;
  final EdgeInsets padding;
  final LinearGradient? gradient;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: gradient ??
            const LinearGradient(
              colors: [ColorRes.bondiBlue, ColorRes.primary],
              stops: [0, 1],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
        borderRadius: BorderRadius.circular(25),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: padding,
          primary: ColorRes.transparent,
          tapTargetSize: MaterialTapTargetSize.padded,
            shadowColor: ColorRes.transparent,
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) ...[
              SvgPicture.asset(icon!),
              const SizedBox(width: 24),
            ],
            Flexible(
              child: Text(
                text,
                style: Styles.gradientButton.copyWith(color: textColor),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
