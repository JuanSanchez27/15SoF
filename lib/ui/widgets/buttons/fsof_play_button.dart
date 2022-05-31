import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fsof/ui/utils/constants/constants.dart';

class FsofPlayButton extends HookWidget {
  const FsofPlayButton({
    this.size = kDimens50,
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
            kBlue.withOpacity(0.5),
            kPrimaryColor.withOpacity(0.5),
          ],
          stops: const [0, 1],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(
            left: kDimens16,
            top: kDimens12,
            right: kDimens12,
            bottom: kDimens12,
          ),
          child: SvgPicture.asset(
            kImageIcPlay,
            height: size * 0.55,
          ),
        ),
      ),
    );
  }
}
