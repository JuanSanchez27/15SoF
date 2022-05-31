import 'dart:developer';

import 'package:fsof/ui/utils/exceptions.dart';
import 'package:video_player/video_player.dart';

class VideoFeedManager {
  final videos = [
    'https://15sof-cdn-qa03.azureedge.net:443/sna-original-videos/92caa8f1-72d0-4183-8649-fc5df25593c7.mov',
    'https://15sof-cdn-accountvideos-qa03.azureedge.net/account-videos/90889c6a-a125-40cd-8407-c0b1a3b82ed1.mp4',
    'https://15sof-cdn-qa03.azureedge.net:443/sna-original-videos/385b34f1-65a8-46ab-b3aa-1d0e28bc3e07.mov',
    'https://15sof-cdn-qa03.azureedge.net:443/sna-original-videos/03f0d6e7-93d7-4ab0-91bb-ab622b9acbad.mp4',
    'https://15sof-cdn-accountvideos-qa03.azureedge.net/account-videos/dcb66f8c-1fc7-40e2-86a9-56b93afc37c5.mp4',
  ];

  final Map<int, VideoPlayerController> _controllers = {};

  VideoPlayerController? getController(int index) => _controllers[index];

  Future initializeControllerAtIndex(int index) async {
    checkIndexBounds(index);

    final _controller = VideoPlayerController.network(videos[index]);
    await _controller.setLooping(true);
    _controllers[index] = _controller;
    await _controller.initialize();
    log('🚀🚀🚀 INITIALIZED $index');
  }

  Future<void> disposeControllerAtIndex(int index) async {
    checkIndexBounds(index);

    final _controller = _controllers[index]!;
    _controllers.remove(index);
    await _controller.dispose();
    log('🚀🚀🚀 DISPOSED $index');
  }

  Future<void> _playVideoAtIndex(int index) async {
    if (index >= videos.length || index < 0) {
      throw IndexOutOfBoundsException;
    }

    await _controllers[index]!.play();
    log('🚀🚀🚀 PLAYING $index');
  }

  Future<void> _stopVideoAtIndex(int index) async {
    checkIndexBounds(index);

    final _controller = _controllers[index]!;
    await _controller.pause();
    await _controller.seekTo(const Duration());
    log('🚀🚀🚀 STOPPED $index');
  }

  Future<void> onVideoChanged({required newPageIndex}) async {
    await Future.wait(
      _controllers.keys
          .where((key) => key != newPageIndex)
          .map((key) => _stopVideoAtIndex(key)),
    );
    await _playVideoAtIndex(newPageIndex);
  }

  void checkIndexBounds(int index) {
    if (index >= videos.length || index < 0) {
      throw IndexOutOfBoundsException;
    }
  }
}
