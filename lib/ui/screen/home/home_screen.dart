import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:fsof/ui/screen/home/handlers/video_feed_manager.dart';
import 'package:fsof/ui/screen/home/widgets/fsof_top_panel.dart';
import 'package:fsof/ui/screen/home/widgets/video_feed_player.dart';
import 'package:fsof/ui/utils/constants/constants.dart';
import 'package:preload_page_view/preload_page_view.dart';

class HomeScreen extends HookWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static Route goTo() => MaterialPageRoute(
        builder: (_) => const HomeScreen(),
        settings: const RouteSettings(name: kRouteHome),
      );

  @override
  Widget build(BuildContext context) {
    final videoManager = useMemoized(() => VideoFeedManager());
    final pageController = useMemoized(
      () => PreloadPageController(initialPage: 0),
    );

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          RefreshIndicator(
            onRefresh: () => Future.delayed(
              const Duration(seconds: 2),
              () => debugPrint('Video feed updated'),
            ),
            child: PreloadPageView.builder(
              itemCount: videoManager.videos.length,
              controller: pageController,
              preloadPagesCount: 1,
              itemBuilder: (context, position) => VideoFeedPlayer(
                key: ValueKey(videoManager.videos[position]),
                index: position,
                manager: videoManager,
              ),
              onPageChanged: (int position) {
                videoManager.onVideoChanged(newPageIndex: position);
                debugPrint('page changed. current: $position');
              },
              scrollDirection: Axis.vertical,
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).padding.top + 6,
            width: MediaQuery.of(context).size.width,
            child: FsofTopPanel(
              hasNotifications: true,
              //onNotificationsPressed: () => _openNotifications(context),
            ),
          ),
        ],
      ),
    );
  }

//void _openNotifications(BuildContext context) => showNotImplemented(context);
}
