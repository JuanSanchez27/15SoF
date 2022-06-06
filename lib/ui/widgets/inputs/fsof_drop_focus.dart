import 'package:flutter/material.dart';

class FsofDropFocus extends StatelessWidget {
  const FsofDropFocus({
    required this.child,
    Key? key,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        WidgetsBinding.instance!.focusManager.primaryFocus?.unfocus();
      },
      child: child,
    );
  }
}
