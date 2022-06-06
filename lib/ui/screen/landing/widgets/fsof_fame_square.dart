import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fsof/ui/styles/styles.dart';
import 'package:fsof/ui/utils/constants/constants.dart';

class FsofFameSquare extends StatelessWidget {
  const FsofFameSquare({
    required this.title,
    required this.subtitle,
    required this.image,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  final String title;
  final String subtitle;
  final String image;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(kDimens10),
            child: Image.asset(
              image,
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
          ),
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(kDimens10),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      kBackgroundColor.withOpacity(0.7),
                      kBackgroundColor.withAlpha(0),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned.fill(
            left: kDimens32,
            right: kDimens32,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: Styles.h3,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: kDimens12),
                Text(
                  subtitle,
                  style: Styles.p1,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
