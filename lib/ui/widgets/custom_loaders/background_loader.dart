import 'package:flutter/material.dart';
import 'package:fsof/ui/utils/constants/colors.dart';

class Sky extends CustomPainter {
  final double _width;
  final double _rectHeight;

  Sky(this._width, this._rectHeight);

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawRect(
      Rect.fromLTRB(
          0.0, 0.0, _width, _rectHeight
      ),
      Paint()..color = kPrimaryColor,
    );
  }

  @override
  bool shouldRepaint(Sky oldDelegate) {
    return _width != oldDelegate._width || _rectHeight != oldDelegate._rectHeight;
  }
}
