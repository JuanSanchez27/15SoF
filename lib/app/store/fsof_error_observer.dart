// ignore: implementation_imports
import 'package:async_redux/src/store.dart';
import 'package:dash_kit_core/dash_kit_core.dart' as dk;
import 'package:fsof/app/app_state.dart';
import 'package:fsof/utils/error_recorder.dart';

class FsofErrorObserver extends dk.ErrorObserver<AppState> {
  @override
  bool observe(
    Object error,
    StackTrace stackTrace,
    ReduxAction<AppState> action,
    Store<AppState> store,
  ) {
    ErrorRecorder(context: 'ErrorObserver').recordError(error, stackTrace);

    return true;
  }
}
