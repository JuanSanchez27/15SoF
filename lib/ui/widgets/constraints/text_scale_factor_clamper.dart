import 'package:flutter/widgets.dart';

class FsofTextScaleFactorClamper extends StatelessWidget {
  const FsofTextScaleFactorClamper({
    required this.child,
    Key? key,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    final constrainedTextScaleFactor =
        mediaQueryData.textScaleFactor.clamp(1.0, 1.5);

    return MediaQuery(
      data: mediaQueryData.copyWith(
        textScaleFactor: constrainedTextScaleFactor,
      ),
      child: child,
    );
  }
}
