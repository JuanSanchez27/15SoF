import 'package:flutter/material.dart';

class SofBackButton extends StatelessWidget {
  const SofBackButton({
    required this.color,
    Key? key,
  }) : super(key: key);

  final Color color;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => (){
        Navigator.pop(context);
      },
      icon: Icon(Icons.arrow_back_ios, color: color),
    );
  }
}
