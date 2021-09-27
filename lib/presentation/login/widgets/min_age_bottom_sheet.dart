import 'package:flutter/material.dart';
import 'package:fsof/resources/colors.dart';
import 'package:fsof/resources/strings.dart';
import 'package:fsof/resources/styles.dart';
import 'package:fsof/widgets/buttons/gradient_button.dart';

class MinAgeBottomSheet extends StatelessWidget {
  const MinAgeBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.all(36),
          child: Text(
            Strings.minAgeRequired,
            style: Styles.bottomSheetText.copyWith(color: ColorRes.ebonyClay),
          ),
        ),
        GradientButton(
          text: Strings.gotIt,
          onPressed: () => Navigator.of(context).pop(),
        ),
        const SizedBox(height: 24),
      ],
    );
  }
}
