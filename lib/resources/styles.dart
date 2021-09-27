import 'package:flutter/cupertino.dart';
import 'package:fsof/resources/colors.dart';

const fontFamily = 'Ubuntu';

// ignore: avoid_classes_with_only_static_members
class Styles {
  static const h3 = TextStyle(
    fontFamily: fontFamily,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w700,
    fontSize: 28,
    height: 1,
    color: ColorRes.white,
    leadingDistribution: TextLeadingDistribution.even,
  );

  static const h4 = TextStyle(
    fontFamily: fontFamily,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w700,
    fontSize: 24,
    height: 1,
    color: ColorRes.white,
    leadingDistribution: TextLeadingDistribution.even,
  );

  static const h5 = TextStyle(
    fontFamily: fontFamily,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.normal,
    fontSize: 18,
    height: 1.3,
    color: ColorRes.white,
    leadingDistribution: TextLeadingDistribution.even,
  );

  static const p1 = TextStyle(
    fontFamily: fontFamily,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.normal,
    fontSize: 14,
    height: 1.4,
    color: ColorRes.white,
    leadingDistribution: TextLeadingDistribution.even,
  );

  static const p2 = TextStyle(
    fontFamily: fontFamily,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.normal,
    fontSize: 12,
    height: 2,
    color: ColorRes.white,
    leadingDistribution: TextLeadingDistribution.even,
  );

  static const bodySmall = TextStyle(
    fontFamily: fontFamily,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.normal,
    fontSize: 11,
    height: 1,
    color: ColorRes.white,
    leadingDistribution: TextLeadingDistribution.even,
  );

  static const primaryButton = TextStyle(
    fontFamily: fontFamily,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w700,
    fontSize: 12,
    height: 1,
    color: ColorRes.white,
    leadingDistribution: TextLeadingDistribution.even,
  );

  static const dialogTitle = TextStyle(
    fontFamily: fontFamily,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w700,
    fontSize: 16,
    height: 1.4,
    color: ColorRes.black,
    leadingDistribution: TextLeadingDistribution.even,
  );

  static const dialogText = TextStyle(
    fontFamily: fontFamily,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.normal,
    fontSize: 13,
    height: 1.4,
    color: ColorRes.black,
    leadingDistribution: TextLeadingDistribution.even,
  );

  static const dialogButton = TextStyle(
    fontFamily: fontFamily,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w500,
    fontSize: 13,
    height: 1,
    color: ColorRes.black,
    leadingDistribution: TextLeadingDistribution.even,
  );

  static const gradientButton = TextStyle(
    fontFamily: fontFamily,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w700,
    fontSize: 16,
    height: 1,
    color: ColorRes.white,
    leadingDistribution: TextLeadingDistribution.even,
  );

  static const bottomSheetText = TextStyle(
    fontFamily: fontFamily,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w500,
    fontSize: 16,
    height: 1.5,
    color: ColorRes.white,
    leadingDistribution: TextLeadingDistribution.even,
  );
}
