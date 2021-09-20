import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TransparentFadeMaterialPageRoute<T>
    extends MaterialPageRoute<T> {
  TransparentFadeMaterialPageRoute({
    required WidgetBuilder builder,
    RouteSettings? settings,
  }) : super(builder: builder, settings: settings);

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return FadeTransition(opacity: animation, child: child);
  }
}
