import 'dart:async';

import 'package:fsof/app/app_state.dart';
import 'package:fsof/app/base_action.dart';
import 'package:fsof/app/operation.dart';

class ResetAction extends BaseAction {
  @override
  Operation get operationKey => Operation.resetCounter;

  @override
  Future<AppState?> reduce() async {
    return state.rebuild((s) => s.template.count = 0);
  }
}
