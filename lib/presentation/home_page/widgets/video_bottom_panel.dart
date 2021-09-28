import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fsof/presentation/dialogs/dialogs.dart';
import 'package:fsof/presentation/home_page/widgets/video_controls.dart';
import 'package:fsof/presentation/home_page/widgets/video_details.dart';

class VideoBottomPanel extends HookWidget {
  const VideoBottomPanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
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
          padding: const EdgeInsets.all(8),
          child: VideoControls(
            isFavorite: false,
            onFavoritePressed: () => _addToFavorite(context),
            onCommentsPressed: () => _openComments(context),
            onSharePressed: () => _shareVideo(context),
          ),
        ),
      ],
    );
  }

  void _addToFavorite(BuildContext context) => showNotImplemented(context);

  void _openComments(BuildContext context) => showNotImplemented(context);

  void _shareVideo(BuildContext context) => showNotImplemented(context);

  void _followAuthor(BuildContext context) => showNotImplemented(context);
}
