import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:fsof/ui/utils/constants/constants.dart';
import 'package:fsof/ui/utils/extensions.dart';

class CachedProfileImage extends StatelessWidget {
  const CachedProfileImage({
    required this.imageUrl,
    this.size,
    Key? key,
  }) : super(key: key);

  final String imageUrl;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: const BoxDecoration(
        color: kWhite50,
        shape: BoxShape.circle,
      ),
      child: Container(
        padding: const EdgeInsets.all(kDimens1),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: kWhite40,
        ),
        child: PlatformEnvironmentExtension.isTest
            ? Container()
            : Container(
                decoration: const BoxDecoration(shape: BoxShape.circle),
                clipBehavior: Clip.antiAlias,
                child: CachedNetworkImage(
                  imageUrl: imageUrl,
                  placeholder: (context, url) =>
                      const CupertinoActivityIndicator(),
                  fit: BoxFit.contain,
                ),
              ),
      ),
    );
  }
}
