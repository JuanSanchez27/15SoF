import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fsof/widgets/buttons/fsof_play_button.dart';
import 'package:video_player/video_player.dart';

class VideoPlayControl extends HookWidget {
  const VideoPlayControl({
    required this.controller,
    Key? key,
  }) : super(key: key);

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
