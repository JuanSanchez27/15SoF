import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fsof/ui/screen/home/widgets/notifications_icon.dart';


import 'package:fsof/ui/utils/constants/constants.dart';

class FsofTopPanel extends HookWidget {
  const FsofTopPanel({
    required this.hasNotifications,
    this.isRegistered = true,
    this.onNotificationsPressed,
    Key? key,
  }) : super(key: key);

  final bool hasNotifications;
  final bool isRegistered;
  final VoidCallback? onNotificationsPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Padding(
        padding: const EdgeInsets.only(left: kDimens20, right: kDimens6),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset(
                kImageLogo,
                alignment: Alignment.centerLeft,
                height: kDimens32,
              ),
            isRegistered
                ? NotificationsIcon(
                    hasNotifications: hasNotifications,
                    onNotificationsPressed: onNotificationsPressed,
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
