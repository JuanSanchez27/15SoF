import 'package:dash_kit_control_panel/dash_kit_control_panel.dart';
import 'package:dash_kit_uikit/dash_kit_uikit.dart';
import 'package:flutter/material.dart';
import 'package:fsof/navigation/app_router.dart';

class UiKitSetting extends StatefulWidget implements ControlPanelSetting {
  const UiKitSetting({
    Key? key,
  }) : super(key: key);

  @override
  _UiKitSettingState createState() => _UiKitSettingState();

  @override
  Setting get setting => Setting(
        id: runtimeType.toString(),
        title: 'Ui Kit',
      );
}

class _UiKitSettingState extends State<UiKitSetting> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      child: ElevatedButton(
        onPressed: openUiKit,
        child: FittedBox(
          child: Text(
            'UI kit',
            style: TextStyle(
              color: Colors.white.withAlpha(240),
              letterSpacing: 0.4,
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }

  void openUiKit() {
    appRouter.goTo(
      context: context,
      route: const UiKitPage(componentWithPadding: true),
    );
  }
}
