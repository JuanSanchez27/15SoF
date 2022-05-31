import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fsof/ui/styles/styles.dart';
import 'package:fsof/ui/utils/constants/constants.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

const TextStyle pinCodeTextStyle = TextStyle(
  fontFamily: fontFamily,
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w700,
  fontSize: kDimens24,
  height: kDimens1,
  color: kBackgroundColor,
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
    this.size = kDimens41,
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
      backgroundColor: kBackgroundColor,
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
        borderRadius: BorderRadius.circular(kDimens8),
        borderWidth: kDimens2,
        shape: PinCodeFieldShape.box,
        activeColor: kTransparent,
        inactiveColor: kTransparent,
        selectedColor: kPrimaryColor,
        errorBorderColor: kDarkRed,
        activeFillColor: kWhite100,
        selectedFillColor: kWhite100,
        inactiveFillColor: kWhite100,
        fieldOuterPadding: const EdgeInsets.symmetric(horizontal: kDimens10),
      ),
    );
  }
}
