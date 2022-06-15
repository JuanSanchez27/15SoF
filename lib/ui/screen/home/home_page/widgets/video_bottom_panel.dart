import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:fsof/ui/screen/home/home_page/widgets/video_controls.dart';
import 'package:fsof/ui/screen/home/home_page/widgets/video_details.dart';
import 'package:fsof/ui/screen/home/widgets/dialogs.dart';
import 'package:fsof/ui/utils/constants/constants.dart';

class VideoBottomPanel extends HookWidget {
  const VideoBottomPanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children:  [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(
              left: kDimens16,
              bottom: kDimens10,
            ),
            child: VideoDetails(
              isFollowingAuthor: false,
              onFollowPressed: () => _followAuthor(context),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(kDimens8),
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
