import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fsof/ui/styles/styles.dart';
import 'package:fsof/ui/utils/constants/constants.dart';

class LabeledIconButton extends HookWidget {
  const LabeledIconButton({
    required this.image,
    this.onPressed,
    this.label,
    this.iconColor,
    Key? key,
  }) : super(key: key);

  final String image;
  final String? label;
  final Color? iconColor;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          iconSize: kDimens30,
          onPressed: onPressed,
          icon: SvgPicture.asset(
            image,
            color: iconColor,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: kDimens2),
          child: Text(
            label ?? kEmptyString,
            style: Styles.primaryButton,
          ),
        ),
      ],
    );
  }
}
