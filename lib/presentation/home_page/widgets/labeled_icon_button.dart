import 'package:dash_kit_network/dash_kit_network.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fsof/resources/styles.dart';

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
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
          iconSize: 30,
          onPressed: onPressed,
          icon: SvgPicture.asset(
            image,
            color: iconColor,
          ),
        ),
        if (label != null)
          Padding(
            padding: const EdgeInsets.only(top: 2),
            child: Text(
              label!,
              style: Styles.primaryButton,
            ),
          ),
      ],
    );
  }
}
