import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fsof/ui/styles/styles.dart';
import 'package:fsof/ui/utils/constants/constants.dart';

class FsofGradientButton extends StatelessWidget {
  const FsofGradientButton({
    required this.text,
    Key? key,
    this.onPressed,
    this.textColor = kWhite100,
    this.padding = const EdgeInsets.symmetric(
      horizontal: kDimens46,
      vertical: kDimens12,
    ),
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
    return Opacity(
      opacity: onPressed == null ? 0.4 : 1,
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: gradient ??
              const LinearGradient(
                colors: [kBlue, kPrimaryColor],
                stops: [0, 1],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
          borderRadius: BorderRadius.circular(kDimens25),
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: padding,
            primary: kTransparent,
            tapTargetSize: MaterialTapTargetSize.padded,
            shadowColor: kTransparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(kDimens25),
            ),
          ),
          onPressed: onPressed,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: kDimens4,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (icon != null) ...[
                  SvgPicture.asset(icon!),
                  const SizedBox(width: kDimens24),
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
        ),
      ),
    );
  }
}
