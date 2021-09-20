import 'package:dash_kit_core/dash_kit_core.dart';
import 'package:dash_kit_network/dash_kit_network.dart';
import 'package:fsof/api_client/fsof_api_client.dart';
import 'package:fsof/app/app_state.dart';
import 'package:fsof/app/store/fsof_error_observer.dart';
import 'package:fsof/app/store/redux_action_logger.dart';
import 'package:fsof/app/store/redux_action_observer.dart';
import 'package:fsof/services/fsof_service.dart';
import 'package:fsof/utils/error_recorder.dart';
import 'package:get_it/get_it.dart';

Store<AppState> configureStore() {
  final actionLogger = ReduxActionLogger();
  final actionObserver = ReduxActionObserver();
  GetIt.I.registerSingleton<ReduxActionObserver>(actionObserver);

  return Store<AppState>(
    initialState: AppState.initial(),
    actionObservers: [
      actionObserver,
      actionLogger,
    ],
    errorObserver: FsofErrorObserver(),
  );
}

void configureDependencyInjection(
  FsofApiClient apiClient,
  TokenStorage tokenStorage,
) {
  final exampleService = FsofService(
    apiClient: apiClient,
    errorRecorder: ErrorRecorder(context: (FsofService).toString()),
  );

  GetIt.I.registerSingleton<FsofService>(exampleService);
}
