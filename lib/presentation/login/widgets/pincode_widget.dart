import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fsof/resources/colors.dart';
import 'package:fsof/resources/styles.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

const TextStyle pinCodeTextStyle = TextStyle(
  fontFamily: fontFamily,
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w700,
  fontSize: 24,
  height: 1,
  color: ColorRes.ebonyClay,
  leadingDistribution: TextLeadingDistribution.even,
);

class PinCodeWidget extends StatelessWidget {
  const PinCodeWidget({
    required this.obscureText,
    required this.length,
    required this.onChanged,
    required this.onSubmitted,
    required this.onCompleted,
    Key? key,
    this.errorAnimationController,
    this.size = 41.0,
    this.controller,
    this.enablePinAutofill = true,
  }) : super(key: key);

  final bool obscureText;
  final int length;
  final Function(String value) onChanged;
  final Function(String value) onSubmitted;
  final Function(String value) onCompleted;
  final StreamController<ErrorAnimationType>? errorAnimationController;
  final double? size;
  final TextEditingController? controller;
  final bool enablePinAutofill;

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      controller: controller,
      obscureText: obscureText,
      autoDisposeControllers: false,
      mainAxisAlignment: MainAxisAlignment.center,
      showCursor: false,
      appContext: context,
      length: length,
      onChanged: onChanged,
      onSubmitted: onSubmitted,
      onCompleted: onCompleted,
      backgroundColor: ColorRes.ebonyClay,
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      useHapticFeedback: true,
      errorAnimationController: errorAnimationController,
      textStyle: pinCodeTextStyle,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      enablePinAutofill: enablePinAutofill,
      enableActiveFill: true,
      pinTheme: PinTheme(
        fieldWidth: size,
        fieldHeight: size,
        borderRadius: BorderRadius.circular(8),
        borderWidth: 2,
        shape: PinCodeFieldShape.box,
        activeColor: ColorRes.transparent,
        inactiveColor: ColorRes.transparent,
        selectedColor: ColorRes.primary,
        errorBorderColor: ColorRes.errorRed,
        activeFillColor: ColorRes.white,
        selectedFillColor: ColorRes.white,
        inactiveFillColor: ColorRes.white,
        fieldOuterPadding: const EdgeInsets.symmetric(horizontal: 10),
      ),
    );
  }
}
