import 'package:dash_kit_uikit/dash_kit_uikit.dart';
import 'package:fsof/widgets/buttons/flat_button.uikit.dart';
import 'package:fsof/widgets/texts/text.uikit.dart';

void registerWidgetGroups() {
  UiKit.register(
    () => [
      UiComponentGroup('Text widgets', [
        TextUiKitBuilder(),
      ]),
      UiComponentGroup('Button widgets', [
        FlatButtonUiKitBuilder(),
      ]),
    ],
  );
}
