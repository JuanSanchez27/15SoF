import 'package:flutter/material.dart';
import 'package:fsof/ui/utils/constants/constants.dart';

class FsofBottomSheetHeader extends StatelessWidget {
  const FsofBottomSheetHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: kDimens8),
      height: kDimens4,
      width: kDimens32,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(kDimens2),
        color: kGray,
      ),
      alignment: Alignment.center,
    );
  }
}
