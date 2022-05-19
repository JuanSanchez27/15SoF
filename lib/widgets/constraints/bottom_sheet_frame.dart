import 'package:flutter/material.dart';
import 'package:fsof/widgets/constraints/bottom_sheet_header.dart';

class BottomSheetFrame extends StatelessWidget {
  const BottomSheetFrame({
    required this.context,
    this.content,
    this.contentWithoutPadding = true,
    Key? key,
  }) : super(key: key);

  final BuildContext context;
  final Widget? content;
  final bool contentWithoutPadding;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Padding(
          padding: contentWithoutPadding
              ? const EdgeInsets.only(
                  top: 10,
                  left: 0,
                  right: 0,
                  bottom: 30,
                )
              : const EdgeInsets.only(
                  top: 10,
                  left: 12,
                  right: 12,
                  bottom: 30,
                ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const BottomSheetHeader(),
              Container(height: 25),
              content ?? Container(),
            ],
          ),
        ),
      ),
    );
  }
}
