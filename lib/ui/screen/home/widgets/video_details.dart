import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fsof/generated/l10n.dart';

import 'package:fsof/ui/screen/home/widgets/cached_profile_image.dart';
import 'package:fsof/ui/styles/styles.dart';
import 'package:fsof/ui/utils/constants/constants.dart';
import 'package:fsof/ui/widgets/texts/fsof_link_text.dart';

class VideoDetails extends HookWidget {
  const VideoDetails({
    required this.isFollowingAuthor,
    this.onFollowPressed,
    Key? key,
  }) : super(key: key);
  final bool isFollowingAuthor;
  final VoidCallback? onFollowPressed;

  @override
  Widget build(BuildContext context) {
    final isFollowing = useState(isFollowingAuthor);

    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const CachedProfileImage(
              imageUrl:
                  'https://img.freepik.com/free-photo/grunge-paint-background_1409-1337.jpg?w=2000',
              size: kDimens32,
            ),
            const SizedBox(width: kDimens12),
            Flexible(
              child: Text(
                '@username',
                style: Styles.p1.copyWith(fontWeight: FontWeight.bold),
                overflow: TextOverflow.ellipsis,
                maxLines: kDimens1.toInt(),
              ),
            ),
            const SizedBox(width: kDimens12),
            LinkText(
              justTextStyle: Styles.p1.copyWith(fontWeight: FontWeight.bold),
              linkTextStyle: isFollowing.value
                  ? Styles.p1.copyWith(fontWeight: FontWeight.bold)
                  : Styles.p1,
              maxLines: 1,
              texts: [
                '•  ',
                ClickableText(
                  text: isFollowing.value
                      ? I18n.of(context).sHomeFollowing
                      : I18n.of(context).sHomeFollow,
                  onPressed: () {
                    isFollowing.value = !isFollowing.value;
                    onFollowPressed?.call();
                  },
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: kDimens6),
        Text(
          'authorName',
          style: Styles.p1.copyWith(fontWeight: FontWeight.bold),
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
        const SizedBox(height: kDimens2),
        Text('hashtags', style: Styles.p2.copyWith(height: 1.1)),
      ],
    );
  }
}
