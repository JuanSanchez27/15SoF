import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fsof/presentation/dialogs/dialogs.dart';
import 'package:fsof/presentation/home_page/widgets/fsof_top_panel.dart';
import 'package:fsof/presentation/home_page/widgets/video_controls.dart';
import 'package:fsof/presentation/home_page/widgets/video_details.dart';
import 'package:fsof/resources/images.dart';

class HomePage extends HookWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            Images.homePage,
            fit: BoxFit.fitWidth,
          ),
          Positioned(
            top: MediaQuery.of(context).padding.top + 6,
            width: MediaQuery.of(context).size.width,
            child: FsofTopPanel(
              hasNotifications: true,
              onNotificationsPressed: () => _openNotifications(context),
            ),
          ),
          Positioned(
            bottom: 0,
            width: MediaQuery.of(context).size.width,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 16,
                      bottom: 10,
                    ),
                    child: VideoDetails(
                      isFollowingAuthor: false,
                      onFollowPressed: () => _followAuthor(context),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 6,
                    right: 16,
                    bottom: 24,
                  ),
                  child: VideoControls(
                    isFavorite: false,
                    onFavoritePressed: () => _addToFavorite(context),
                    onCommentsPressed: () => _openComments(context),
                    onSharePressed: () => _shareVideo(context),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _addToFavorite(BuildContext context) => showNotImplemented(context);

  void _openComments(BuildContext context) => showNotImplemented(context);

  void _shareVideo(BuildContext context) => showNotImplemented(context);

  void _followAuthor(BuildContext context) => showNotImplemented(context);

  void _openNotifications(BuildContext context) => showNotImplemented(context);
}
