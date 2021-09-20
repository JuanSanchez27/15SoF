import 'package:flutter/material.dart';

class DropFocus extends StatelessWidget {
  const DropFocus({
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
