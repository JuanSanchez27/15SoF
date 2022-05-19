import 'dart:async';

import 'package:alice_lightweight/alice.dart';
import 'package:async_redux/async_redux.dart' hide Store;
import 'package:dash_kit_core/dash_kit_core.dart';
import 'package:dash_kit_network/dash_kit_network.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fsof/app/app_state.dart';
import 'package:fsof/app/store/store.dart';
import 'package:fsof/configuration/api_client.dart';
import 'package:fsof/configuration/app_configuration.dart';
import 'package:fsof/configuration/control_panel.dart';
import 'package:fsof/configuration/error_reporting.dart';
import 'package:fsof/configuration/fsof_api_environment.dart';
import 'package:fsof/configuration/uikit.dart';
import 'package:fsof/fsof_app.dart';
import 'package:fsof/navigation/app_router.dart';
import 'package:fsof/utils/launch_counter.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main({
  FsofApiEnvironment environment = FsofApiEnvironment.production,
}) async {
  WidgetsFlutterBinding.ensureInitialized();
  AppConfiguration.init(environment: environment);
  await Firebase.initializeApp();

  configureUiKit();
  configureErrorReporting();

  final alice = Alice();
  const storage = FlutterSecureStorage();
  const tokenStorage = TokenStorage(storage);

  final sharedPreferences = await SharedPreferences.getInstance();

  final apiClient = configureApiClient(
    alice: alice,
    tokenStorage: tokenStorage,
    environment: environment,
  );

  configureDependencyInjection(
    apiClient,
    tokenStorage,
  );

  final store = configureStore();

  appRouter.navigatorKey = alice.getNavigatorKey();

  configureControlPanel(alice, apiClient);

  final launchCounter = LaunchCounter(sharedPreferences);
  if (launchCounter.isFirstLaunch()) {
    await tokenStorage.clearTokens();
  }

  final isAuthorized = await tokenStorage.isAuthorized();

  runZonedGuarded(() {
    runApp(
      StoreProvider<AppState>(
        store: store,
        child: FsofApp(
          isAuthorized: isAuthorized,
        ),
      ),
    );
  }, FirebaseCrashlytics.instance.recordError);
}
