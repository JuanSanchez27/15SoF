import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fsof/resources/colors.dart';
import 'package:fsof/resources/images.dart';
import 'package:fsof/resources/strings.dart';
import 'package:fsof/resources/styles.dart';

class FameSquare extends StatelessWidget {
  const FameSquare._({
    required this.title,
    required this.subtitle,
    required this.image,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  factory FameSquare.createFame({required VoidCallback onPressed}) {
    return FameSquare._(
      title: Strings.createFameTitle,
      subtitle: Strings.createFameSubtitle,
      image: Images.createFame,
      onPressed: onPressed,
    );
  }

  factory FameSquare.getFame({required VoidCallback onPressed}) {
    return FameSquare._(
      title: Strings.getFameTitle,
      subtitle: Strings.getFameSubtitle,
      image: Images.getFame,
      onPressed: onPressed,
    );
  }

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
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              image,
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
          ),
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      ColorRes.ebonyClay.withOpacity(0.7),
                      ColorRes.ebonyClay.withAlpha(0),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned.fill(
            left: 32,
            right: 32,
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
                const SizedBox(height: 12),
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
