import 'package:flutter/services.dart';
import 'package:fsof/resources/colors.dart';

void configureSystemUi({bool isLight = false}) {
  SystemChrome.setSystemUIOverlayStyle(isLight
      ? SystemUiOverlayStyle.light
          .copyWith(statusBarColor: ColorRes.transparent)
      : SystemUiOverlayStyle.dark
          .copyWith(statusBarColor: ColorRes.transparent));
}
