import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fsof/resources/colors.dart';
import 'package:fsof/utils/extensions.dart';

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
        color: ColorRes.white,
        shape: BoxShape.circle,
      ),
      child: Container(
        padding: const EdgeInsets.all(1),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: ColorRes.white,
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
