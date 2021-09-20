import 'package:dash_kit_uikit/dash_kit_uikit.dart';
import 'package:flutter/widgets.dart';
import 'package:fsof/widgets/buttons/primary_button.dart';

class PrimaryButtonUiKitBuilder extends UiKitBuilder {
  @override
  Type get componentType => PrimaryButton;

  @override
  void buildComponentStates() {
    build(
      'Enabled Primary Button',
      Center(
        child: PrimaryButton(
          text: 'Enabled Primary Button',
          onPressed: () {},
        ),
      ),
    );
    build(
      'Disabled Primary Button',
      const PrimaryButton(text: 'Disabled Primary Button'),
    );
    build(
      'Expanded Primary Button',
      PrimaryButton(
        text: 'Enabled Primary Button',
        onPressed: () {},
      ),
    );
  }
}
