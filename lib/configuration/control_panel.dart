import 'package:alice_lightweight/alice.dart';
import 'package:dash_kit_control_panel/dash_kit_control_panel.dart';
import 'package:fsof/api_client/fsof_api_client.dart';
import 'package:fsof/app/settings_provider.dart';
import 'package:fsof/navigation/app_router.dart';

void configureControlPanel(Alice alice, FsofApiClient apiClient) {
  final settingsProvider = SettingsProvider(
    alice: alice,
    dios: [apiClient.dio],
  );

  ControlPanel.initialize(
    navigatorKey: appRouter.navigatorKey,
    settingsProvider: settingsProvider,
  );
}
