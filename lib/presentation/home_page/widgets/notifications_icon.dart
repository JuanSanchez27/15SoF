import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fsof/resources/colors.dart';
import 'package:fsof/resources/images.dart';

class NotificationsIcon extends HookWidget {
  const NotificationsIcon({
    required this.hasNotifications,
    this.onNotificationsPressed,
    Key? key,
  }) : super(key: key);

  final bool hasNotifications;
  final VoidCallback? onNotificationsPressed;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        IconButton(
          onPressed: onNotificationsPressed,
          icon: SvgPicture.asset(Images.icNotification),
        ),
        if (hasNotifications)
          Positioned(
            right: 0,
            top: 0,
            child: Transform.translate(
              offset: const Offset(-11, 8),
              child: Container(
                width: 11,
                height: 11,
                decoration: const BoxDecoration(
                  color: ColorRes.monzaRed,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
