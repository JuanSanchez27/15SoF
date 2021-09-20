import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fsof/resources/colors.dart';
import 'package:fsof/resources/styles.dart';

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
        fontFamily: fontFamily,
        scaffoldBackgroundColor: ColorRes.ebonyClay,
      ),
      home: Directionality(
        textDirection: TextDirection.ltr,
        child: child,
      ),
    );
  }
}
