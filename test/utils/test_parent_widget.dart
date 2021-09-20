import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fsof/resources/colors.dart';

class TestParentWidget extends StatelessWidget {
  const TestParentWidget({
    required this.child,
    Key? key,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: ColorRes.white,
        fontFamily: 'OpenSans',
      ),
      home: Directionality(
        textDirection: TextDirection.ltr,
        child: child,
      ),
    );
  }
}
