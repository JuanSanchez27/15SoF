import 'package:flutter/material.dart';
import 'package:fsof/ui/utils/constants/constants.dart';
import 'package:fsof/ui/widgets/constraints/fsof_bottom_sheet_header.dart';

class FsofBottomSheetFrame extends StatelessWidget {
  const FsofBottomSheetFrame({
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
            topLeft: Radius.circular(kDimens20),
            topRight: Radius.circular(kDimens20),
          ),
        ),
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Padding(
          padding: contentWithoutPadding
              ? const EdgeInsets.only(
                  top: kDimens10,
                  left: kDimens0,
                  right: kDimens0,
                  bottom: kDimens30,
                )
              : const EdgeInsets.only(
                  top: kDimens10,
                  left: kDimens12,
                  right: kDimens12,
                  bottom: kDimens30,
                ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const FsofBottomSheetHeader(),
              Container(height: kDimens25),
              content ?? Container(),
            ],
          ),
        ),
      ),
    );
  }
}
