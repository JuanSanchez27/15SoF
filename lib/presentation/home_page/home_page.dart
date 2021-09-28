import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fsof/presentation/dialogs/dialogs.dart';
import 'package:fsof/presentation/home_page/widgets/fsof_top_panel.dart';
import 'package:fsof/presentation/home_page/widgets/video_feed_player.dart';
import 'package:preload_page_view/preload_page_view.dart';

class HomePage extends HookWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const videos = [
      'https://15sof-cdn-qa03.azureedge.net:443/sna-original-videos/92caa8f1-72d0-4183-8649-fc5df25593c7.mov',
      'https://15sof-cdn-accountvideos-qa03.azureedge.net/account-videos/90889c6a-a125-40cd-8407-c0b1a3b82ed1.mp4',
      'https://15sof-cdn-qa03.azureedge.net:443/sna-original-videos/385b34f1-65a8-46ab-b3aa-1d0e28bc3e07.mov',
      'https://15sof-cdn-qa03.azureedge.net:443/sna-original-videos/03f0d6e7-93d7-4ab0-91bb-ab622b9acbad.mp4',
      'https://15sof-cdn-accountvideos-qa03.azureedge.net/account-videos/dcb66f8c-1fc7-40e2-86a9-56b93afc37c5.mp4',
    ];

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          RefreshIndicator(
            onRefresh: () => Future.delayed(
              const Duration(seconds: 2),
              //ignore: avoid_print
              () => print('Video feed updated'),
            ),
            child: PreloadPageView.builder(
              itemCount: videos.length,
              controller: PreloadPageController(initialPage: 0),
              preloadPagesCount: 1,
              itemBuilder: (context, position) =>
                  VideoFeedPlayer(videoUrl: videos[position]),
              onPageChanged: (int position) {
                //ignore: avoid_print
                print('page changed. current: $position');
              },
              scrollDirection: Axis.vertical,
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).padding.top + 6,
            width: MediaQuery.of(context).size.width,
            child: FsofTopPanel(
              hasNotifications: true,
              onNotificationsPressed: () => _openNotifications(context),
            ),
          ),
        ],
      ),
    );
  }

  void _openNotifications(BuildContext context) => showNotImplemented(context);
}
