import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fsof/resources/colors.dart';
import 'package:fsof/resources/styles.dart';

class LinkText extends StatefulWidget {
  const LinkText({
    required this.texts,
    this.justTextStyle,
    this.linkTextStyle,
    this.textAlign,
    this.maxLines,
    this.overflow,
    Key? key,
  }) : super(key: key);

  final List<dynamic> texts;
  final TextStyle? justTextStyle;
  final TextStyle? linkTextStyle;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;

  @override
  State<StatefulWidget> createState() {
    return LinkTextState();
  }
}

class LinkTextState extends State<LinkText> {
  bool isLinkHold = false;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        style: DefaultTextStyle.of(context).style,
        children: widget.texts.map((text) {
          if (text is ClickableText) {
            return TextSpan(
              text: text.text,
              style: _linkTextStyle(),
              recognizer: TapGestureRecognizer()
                ..onTap = text.onPressed
                ..onTapDown = _onTapDown
                ..onTapUp = _onTapUp
                ..onTapCancel = _onTapCancel,
            );
          }

          if (text is String) {
            return TextSpan(
              text: text,
              style: _justTextStyle(),
            );
          }

          throw Exception('Unknown text value type!');
        }).toList(),
      ),
      textAlign: widget.textAlign ?? TextAlign.start,
      maxLines: widget.maxLines,
      overflow: widget.overflow,
    );
  }

  TextStyle _justTextStyle() {
    return widget.justTextStyle ?? Styles.p2;
  }

  TextStyle _linkTextStyle() {
    final chosenStyle = widget.linkTextStyle ??
        Styles.p2.copyWith(
          color: ColorRes.primary,
          fontWeight: FontWeight.w700,
        );
    return chosenStyle.copyWith(
      color: chosenStyle.color!.withOpacity(isLinkHold ? 0.5 : 1),
    );
  }

  void _onTapDown(TapDownDetails style) {
    setState(() => isLinkHold = true);
  }

  void _onTapUp(TapUpDetails style) {
    setState(() => isLinkHold = false);
  }

  void _onTapCancel() {
    setState(() => isLinkHold = false);
  }
}

class ClickableText {
  const ClickableText({
    required this.text,
    required this.onPressed,
  });

  final String text;
  final VoidCallback onPressed;
}
