import 'package:flutter/material.dart';

Color contrastColor(Color color) {
  if (color == Colors.transparent || color.alpha < 50) {
    return Colors.black;
  }
  final luminance =
      (0.299 * color.red + 0.587 * color.green + 0.114 * color.blue) / 255;
  return luminance > 0.5 ? Colors.black : Colors.white;
}

Color fromHex(String hexString) {
  if (hexString.isEmpty) {
    return Colors.white;
  }
  final buffer = StringBuffer();
  if (hexString.length == 6 || hexString.length == 7) {
    buffer.write('ff');
  }
  buffer.write(hexString.replaceFirst('#', ''));
  return Color(int.parse(buffer.toString(), radix: 16));
}
