import 'package:flutter/material.dart';
import 'dart:math' as math;

class Responsive {

  late double _diagonal, _height, _width;
  late bool _isTable;

  double get diagonal => _diagonal;
  double get height => _height;
  double get width => _width;

  bool get isTable => _isTable;

  static Responsive of(BuildContext context) => Responsive(context);

  Responsive(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    _width = size.width;
    _height = size.height;

    //para calcular el responsive en diagonal hay que recurrir a la formula "c2 = a2 + b2"
    _diagonal = math.sqrt(math.pow(_width, 2) + math.pow(_height, 2));

    _isTable = size.shortestSide >= 600;

  }

  double wp(double percent) => _width * percent / 100;
  double hp(double percent) => _height * percent / 100;
  double dp(double percent) => _diagonal * percent / 100;

}