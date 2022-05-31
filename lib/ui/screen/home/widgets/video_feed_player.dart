import 'package:flutter/material.dart';

import 'package:fsof/ui/screen/home/handlers/video_feed_manager.dart';
import 'package:fsof/ui/screen/home/widgets/video_bottom_panel.dart';
import 'package:fsof/ui/screen/home/widgets/video_play_control.dart';
import 'package:fsof/ui/utils/constants/constants.dart';
import 'package:fsof/ui/utils/extensions.dart';
import 'package:video_player/video_player.dart';

class VideoFeedPlayer extends StatefulWidget {
  const VideoFeedPlayer({
    required this.index,
    required this.manager,
    Key? key,
  }) : super(key: key);

  final int index;
  final VideoFeedManager manager;

  @override
  _VideoFeedPlayerState createState() => _VideoFeedPlayerState();
}

class _VideoFeedPlayerState extends State<VideoFeedPlayer> {
  VideoFeedManager get manager => widget.manager;

  int get index => widget.index;

  @override
  void initState() {
    super.initState();

    if (!PlatformEnvironmentExtension.isTest) {
      manager.initializeControllerAtIndex(index).then((_) {
        if (index == 0) {
          return manager.onVideoChanged(newPageIndex: kDimens0);
        }
      }).then((_) => setState(() {}));
    }
  }

  @override
  void dispose() {
    if (!PlatformEnvironmentExtension.isTest) {
      manager.disposeControllerAtIndex(index);
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = manager.getController(index);

    return Scaffold(
      body: controller == null
          ? const SizedBox.shrink()
          : Container(
              color: kWhite50,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Stack(
                    alignment: Alignment.bottomCenter,
                    children: <Widget>[
                      PlatformEnvironmentExtension.isTest
                          ? _buildTestWidget()
                          : Column(
                              children: [
                                Expanded(
                                  child: FittedBox(
                                    fit: BoxFit.cover,
                                    // TODO(Viktor): Find the way to avoid SizedBox with 1 height.
                                    child: SizedBox(
                                      width: manager
                                          .getController(index)!
                                          .value
                                          .aspectRatio,
                                      height: kDimens1,
                                      child: VideoPlayer(
                                        manager.getController(index)!,
                                      ),
                                    ),
                                  ),
                                ),
                                VideoProgressIndicator(
                                  controller,
                                  colors: VideoProgressColors(
                                    playedColor: kPrimaryColor,
                                    bufferedColor:
                                        kPrimaryColor.withOpacity(0.3),
                                    backgroundColor: kWhite50,
                                  ),
                                  allowScrubbing: true,
                                  padding: EdgeInsets.zero,
                                ),
                              ],
                            ),
                      if (!PlatformEnvironmentExtension.isTest)
                        VideoPlayControl(controller: controller),
                    ],
                  ),
                  Positioned(
                    bottom: 0,
                    width: MediaQuery.of(context).size.width,
                    child: const VideoBottomPanel(),
                  ),
                ],
              ),
            ),
    );
  }

  Widget _buildTestWidget() {
    return Column(
      children: [
        Expanded(
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(kImageIcHome),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
