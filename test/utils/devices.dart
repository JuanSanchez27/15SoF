import 'package:flutter/widgets.dart';
import 'package:golden_toolkit/golden_toolkit.dart' as toolkit;

// ignore: avoid_classes_with_only_static_members
class Devices {
  /// [iphone11] matches specs of iphone SE, but with lower DPI for performance.
  static toolkit.Device iphoneSE({double? contentHeight}) => toolkit.Device(
        size: Size(320.0, contentHeight ?? 568.0),
        name: 'iphone_se__text_scale_1_0',
        safeArea: const EdgeInsets.only(top: 20.0),
      );

  static toolkit.Device iphoneSEWithTextScale(
    double textScale, {
    double? contentHeight,
  }) =>
      iphoneSE(contentHeight: contentHeight).copyWith(
        name: 'iphone_se__text_scale_${textScale.title()}',
        textScale: textScale,
      );

  /// [iphone11] matches specs of iphone 8, but with lower DPI for performance.
  static toolkit.Device iphone8({double? contentHeight}) => toolkit.Device(
        size: Size(375.0, contentHeight ?? 667.0),
        name: 'iphone_8__text_scale_1_0',
        safeArea: const EdgeInsets.only(top: 20.0),
      );

  static toolkit.Device iphone8WithTextScale(
    double textScale, {
    double? contentHeight,
  }) =>
      iphone8(contentHeight: contentHeight).copyWith(
        name: 'iphone_8__text_scale_${textScale.title()}',
        textScale: textScale,
      );

  /// [iphone11] matches specs of iphone 11, but with lower DPI for performance.
  static toolkit.Device iphone11({double? contentHeight}) => toolkit.Device(
        size: Size(414.0, contentHeight ?? 896.0),
        name: 'iphone_11__text_scale_1_0',
        safeArea: const EdgeInsets.only(top: 48.0, bottom: 34.0),
      );

  static toolkit.Device iphone11WithTextScale(
    double textScale, {
    double? contentHeight,
  }) =>
      iphone11(contentHeight: contentHeight).copyWith(
        name: 'iphone_11__text_scale_${textScale.title()}',
        textScale: textScale,
      );

  /// [iphone12ProMax] matches specs of iphone 12 Pro Max, but with lower DPI
  /// for performance.
  static toolkit.Device iphone12ProMax({double? contentHeight}) =>
      toolkit.Device(
        size: Size(428.0, contentHeight ?? 926.0),
        name: 'iphone_12_pro_max__text_scale_1_0',
        safeArea: const EdgeInsets.only(top: 47.0, bottom: 34.0),
      );

  static toolkit.Device iphone12ProMaxWithTextScale(
    double textScale, {
    double? contentHeight,
  }) =>
      iphone12ProMax(contentHeight: contentHeight).copyWith(
        name: 'iphone_12_pro_max__text_scale_${textScale.title()}',
        textScale: textScale,
      );
}

List<toolkit.Device> devicesWithDifferentTextScales({
  double? contentHeight,
}) =>
    [
      Devices.iphoneSE(contentHeight: contentHeight),
      Devices.iphone8(contentHeight: contentHeight),
      Devices.iphone11(contentHeight: contentHeight),
      Devices.iphone12ProMax(contentHeight: contentHeight),
      Devices.iphoneSEWithTextScale(1.3, contentHeight: contentHeight),
      Devices.iphone8WithTextScale(1.3, contentHeight: contentHeight),
      Devices.iphone11WithTextScale(1.3, contentHeight: contentHeight),
      Devices.iphone12ProMaxWithTextScale(1.3, contentHeight: contentHeight),
      Devices.iphoneSEWithTextScale(1.6, contentHeight: contentHeight),
      Devices.iphone8WithTextScale(1.6, contentHeight: contentHeight),
      Devices.iphone11WithTextScale(1.6, contentHeight: contentHeight),
      Devices.iphone12ProMaxWithTextScale(1.6, contentHeight: contentHeight),
    ];

extension DoubleExtensions on double {
  String title() {
    return toString().replaceFirst('.', '_');
  }
}
