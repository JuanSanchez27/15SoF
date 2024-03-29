import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:fsof/ui/screen/home/widgets/labeled_icon_button.dart';
import 'package:fsof/ui/utils/constants/constants.dart';

class VideoControls extends HookWidget {
  const VideoControls({
    required this.isFavorite,
    this.onFavoritePressed,
    this.onCommentsPressed,
    this.onSharePressed,
    Key? key,
  }) : super(key: key);

  final bool isFavorite;

  final VoidCallback? onFavoritePressed;
  final VoidCallback? onCommentsPressed;
  final VoidCallback? onSharePressed;

  @override
  Widget build(BuildContext context) {
    final isFavoriteVideo = useState(isFavorite);

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        LabeledIconButton(
          image: kImageIcLike,
          label: '3.5K',
          iconColor: isFavoriteVideo.value ? kPrimaryColor : kWhite50,
          onPressed: () {
            isFavoriteVideo.value = !isFavoriteVideo.value;
            onFavoritePressed?.call();
          },
        ),
        const SizedBox(height: kDimens8),
        LabeledIconButton(
          image: kImageIcComment,
          label: '6 230',
          onPressed: onCommentsPressed,
        ),
        const SizedBox(height: kDimens8),
        LabeledIconButton(
          image: kImageIcShare,
          onPressed: onSharePressed,
        ),
      ],
    );
  }
}
