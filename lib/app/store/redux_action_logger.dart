import 'package:async_redux/async_redux.dart';
import 'package:fsof/app/app_state.dart';

class ReduxActionLogger extends ActionObserver<AppState> {
  @override
  void observe(ReduxAction action, int dispatchCount, {bool ini = false}) {
    if (ini) {
      // ignore: avoid_print
      print('$action');
    }
  }
}
