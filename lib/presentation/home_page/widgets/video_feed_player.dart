import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fsof/presentation/home_page/handlers/video_feed_manager.dart';
import 'package:fsof/presentation/home_page/widgets/video_bottom_panel.dart';
import 'package:fsof/resources/colors.dart';
import 'package:fsof/resources/images.dart';
import 'package:fsof/utils/extensions.dart';
import 'package:fsof/widgets/buttons/fsof_play_button.dart';
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
          return manager.onVideoChanged(newPageIndex: 0);
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
              color: ColorRes.white,
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
                                _buildVideoContent(context),
                                VideoProgressIndicator(
                                  controller,
                                  colors: VideoProgressColors(
                                    playedColor: ColorRes.primary,
                                    bufferedColor:
                                        ColorRes.primary.withOpacity(0.3),
                                    backgroundColor: ColorRes.white,
                                  ),
                                  allowScrubbing: true,
                                  padding: EdgeInsets.zero,
                                ),
                              ],
                            ),
                      if (!PlatformEnvironmentExtension.isTest)
                        _PlayingControl(controller: controller),
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
                image: AssetImage(Images.homePage),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildVideoContent(BuildContext context) {
    return Expanded(
      child: FittedBox(
        fit: BoxFit.cover,
        child: SizedBox(
          width: manager.getController(index)!.value.aspectRatio,
          height: 1,
          child: VideoPlayer(manager.getController(index)!),
        ),
      ),
    );
  }
}

class _PlayingControl extends HookWidget {
  const _PlayingControl({required this.controller, Key? key}) : super(key: key);

  final VideoPlayerController controller;

  @override
  Widget build(BuildContext context) {
    final isVideoPlaying = useListenable(controller);

    return Stack(
      children: <Widget>[
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 50),
          reverseDuration: const Duration(milliseconds: 200),
          child: isVideoPlaying.value.isPlaying
              ? const SizedBox.shrink()
              : const Center(child: FsofPlayButton()),
        ),
        GestureDetector(
          onTap: () {
            isVideoPlaying.value.isPlaying
                ? controller.pause()
                : controller.play();
          },
        ),
      ],
    );
  }
}
