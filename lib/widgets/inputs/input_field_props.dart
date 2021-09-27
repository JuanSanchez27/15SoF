import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fsof/resources/colors.dart';
import 'package:fsof/utils/validators.dart';

class InputFieldProps {
  const InputFieldProps({
    this.isEnabled = true,
    this.hint,
    this.onSubmitted,
    this.validatorRules,
    this.controller,
    this.contentPadding,
    this.textAlign = TextAlign.start,
    this.focusNode,
    this.nextFocusNode,
    this.textInputAction = TextInputAction.done,
    this.obscureText = false,
    this.obscureToggle = false,
    this.readOnly = false,
    this.textCapitalization = TextCapitalization.none,
    this.keyboardType = TextInputType.text,
    this.autovalidateMode = AutovalidateMode.disabled,
    this.maxLines = 1,
    this.lines = 1,
    this.maxLength = 64,
    this.inputFormatters,
    this.onChanged,
    this.textColor = ColorRes.ebonyClay,
    this.hintColor = ColorRes.black,
    this.fillColor = ColorRes.white,
    this.suffixIcon,
    this.inputBorder,
    this.style,
  });

  final bool isEnabled;
  final String? hint;
  final ValueChanged<String>? onSubmitted;
  final List<FormatResult>? validatorRules;
  final TextEditingController? controller;
  final EdgeInsetsGeometry? contentPadding;
  final TextAlign textAlign;
  final FocusNode? focusNode;
  final FocusNode? nextFocusNode;
  final TextInputAction textInputAction;
  final bool obscureText;
  final bool obscureToggle;
  final bool readOnly;
  final TextCapitalization textCapitalization;
  final TextInputType keyboardType;
  final AutovalidateMode autovalidateMode;
  final int maxLines;
  final int lines;
  final int maxLength;
  final List<TextInputFormatter>? inputFormatters;
  final ValueChanged<String>? onChanged;
  final Color textColor;
  final Color hintColor;
  final Color? fillColor;
  final Widget? suffixIcon;
  final InputBorder? inputBorder;
  final TextStyle? style;
}
