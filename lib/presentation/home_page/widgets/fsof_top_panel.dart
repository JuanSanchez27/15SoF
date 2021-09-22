import 'package:dash_kit_network/dash_kit_network.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fsof/presentation/home_page/widgets/notifications_icon.dart';
import 'package:fsof/resources/images.dart';

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
      height: 33,
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 14),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset(
              Images.sofLogo,
              alignment: Alignment.centerLeft,
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
