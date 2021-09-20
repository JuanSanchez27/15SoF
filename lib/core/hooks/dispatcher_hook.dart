import 'package:async_redux/async_redux.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fsof/app/app_state.dart';
import 'package:fsof/app/base_action.dart';

typedef Dispatcher = Future<void> Function(BaseAction);

Dispatcher useDispatcher() {
  final context = useContext();
  final storeProvider = StoreProvider.of<AppState>(context, 'dispatcher');
  return storeProvider.dispatch;
}
