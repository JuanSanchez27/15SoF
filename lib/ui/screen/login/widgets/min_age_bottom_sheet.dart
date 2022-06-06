import 'package:flutter/material.dart';
import 'package:fsof/generated/l10n.dart';
import 'package:fsof/ui/styles/styles.dart';
import 'package:fsof/ui/utils/constants/constants.dart';
import 'package:fsof/ui/widgets/buttons/fsof_gradient_button.dart';

class MinAgeBottomSheet extends StatelessWidget {
  const MinAgeBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.all(kDimens36),
          child: Text(
            I18n.of(context).wMinAgeRequired,
            style: Styles.bottomSheetText.copyWith(color: kBackgroundColor),
          ),
        ),
        FsofGradientButton(
          text: I18n.of(context).wMinAgeGotIt,
          onPressed: () => Navigator.of(context).pop(),
        ),
        const SizedBox(height: kDimens24),
      ],
    );
  }
}
