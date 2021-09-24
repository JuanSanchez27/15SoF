import 'package:dash_kit_network/dash_kit_network.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fsof/presentation/home_page/widgets/cached_profile_image.dart';
import 'package:fsof/resources/constants.dart';
import 'package:fsof/resources/strings.dart';
import 'package:fsof/resources/styles.dart';
import 'package:fsof/widgets/texts/link_text.dart';

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
            const CachedProfileImage(imageUrl: mimojiUrl, size: 26),
            const SizedBox(width: 12),
            Flexible(
              child: Text(
                '@$username',
                style: Styles.p1.copyWith(fontWeight: FontWeight.bold),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
            const SizedBox(width: 12),
            LinkText(
              justTextStyle: Styles.p1.copyWith(fontWeight: FontWeight.bold),
              linkTextStyle: isFollowing.value
                  ? Styles.p1.copyWith(fontWeight: FontWeight.bold)
                  : Styles.p1,
              maxLines: 1,
              texts: [
                '•  ',
                ClickableText(
                  text: isFollowing.value ? Strings.following : Strings.follow,
                  onPressed: () {
                    isFollowing.value = !isFollowing.value;
                    onFollowPressed?.call();
                  },
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 6),
        Text(
          authorName,
          style: Styles.p1.copyWith(fontWeight: FontWeight.bold),
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
        const SizedBox(height: 2),
        Text(hashtags, style: Styles.p2.copyWith(height: 1.1)),
      ],
    );
  }
}
