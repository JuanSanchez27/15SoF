import 'dart:async';

import 'package:async_redux/async_redux.dart';
import 'package:dash_kit_core/dash_kit_core.dart';
import 'package:fsof/app/app_state.dart';

class ReduxActionObserver extends ActionObserver<AppState> {
  final _onAction = StreamController<ReduxAction>.broadcast();

  Stream<ReduxAction> get onAction => _onAction.stream;

  @override
  void observe(ReduxAction action, int dispatchCount, {bool ini = false}) {
    _onAction.add(action);
  }
}
