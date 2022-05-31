import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fsof/ui/utils/constants/constants.dart';

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
          icon: SvgPicture.asset(kImageIcNotification),
        ),
        if (hasNotifications)
          Positioned(
            right: kDimens0,
            top: kDimens0,
            child: Transform.translate(
              offset: const Offset(-kDimens11, kDimens8),
              child: Container(
                width: kDimens11,
                height: kDimens11,
                decoration: const BoxDecoration(
                  color: kDarkRed,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
