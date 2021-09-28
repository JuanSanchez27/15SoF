import 'package:flutter/material.dart';
import 'package:fsof/presentation/home_page/widgets/video_bottom_panel.dart';
import 'package:fsof/resources/colors.dart';
import 'package:fsof/resources/images.dart';
import 'package:fsof/utils/extensions.dart';
import 'package:fsof/widgets/buttons/fsof_play_button.dart';
import 'package:video_player/video_player.dart';

class VideoFeedPlayer extends StatefulWidget {
  const VideoFeedPlayer({
    required this.videoUrl,
    Key? key,
  }) : super(key: key);

  final String videoUrl;

  @override
  _VideoFeedPlayerState createState() => _VideoFeedPlayerState();
}

class _VideoFeedPlayerState extends State<VideoFeedPlayer> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();

    if (!PlatformEnvironmentExtension.isTest) {
      _controller = VideoPlayerController.network(
        widget.videoUrl,
        videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true),
      );

      _controller.addListener(() {
        setState(() {});
      });
      _controller.setLooping(true);
      _controller
        ..initialize()
        ..play();
      //_controller.seekTo(Duration.zero);
    }
  }

  @override
  void dispose() {
    if (!PlatformEnvironmentExtension.isTest) {
      _controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: ColorRes.white,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: <Widget>[
                Column(
                  children: PlatformEnvironmentExtension.isTest
                      ? [
                          Expanded(
                            child: Container(
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(Images.homePage),
                                    fit: BoxFit.cover),
                              ),
                            ),
                          ),
                        ]
                      : [
                          Expanded(
                            child: FittedBox(
                              fit: BoxFit.cover,
                              child: SizedBox(
                                width: _controller.value.aspectRatio,
                                height: 1,
                                child: VideoPlayer(_controller),
                              ),
                            ),
                          ),
                          VideoProgressIndicator(
                            _controller,
                            colors: VideoProgressColors(
                              playedColor: ColorRes.primary,
                              bufferedColor: ColorRes.primary.withOpacity(0.3),
                              backgroundColor: ColorRes.white,
                            ),
                            allowScrubbing: true,
                            padding: EdgeInsets.zero,
                          ),
                        ],
                ),
                if (!PlatformEnvironmentExtension.isTest)
                  _ControlsOverlay(controller: _controller),
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
}

class _ControlsOverlay extends StatelessWidget {
  const _ControlsOverlay({required this.controller, Key? key})
      : super(key: key);

  final VideoPlayerController controller;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 50),
          reverseDuration: const Duration(milliseconds: 200),
          child: controller.value.isPlaying
              ? const SizedBox.shrink()
              : const Center(child: FsofPlayButton()),
        ),
        GestureDetector(
          onTap: () {
            controller.value.isPlaying ? controller.pause() : controller.play();
          },
        ),
      ],
    );
  }
}
