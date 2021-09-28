import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fsof/resources/colors.dart';
import 'package:fsof/resources/images.dart';

class FsofPlayButton extends HookWidget {
  const FsofPlayButton({
    this.size = 50,
    Key? key,
  }) : super(key: key);

  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          colors: [
            ColorRes.bondiBlue.withOpacity(0.5),
            ColorRes.primary.withOpacity(0.5),
          ],
          stops: const [0, 1],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 12, 12, 12),
          child: SvgPicture.asset(
            Images.icPlay,
            height: size * 0.55,
          ),
        ),
      ),
    );
  }
}
