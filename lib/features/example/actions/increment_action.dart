import 'package:fsof/app/app_state.dart';
import 'package:fsof/app/base_action.dart';

class IncrementAction extends BaseAction {
  IncrementAction({required this.increment});

  final int increment;

  @override
  AppState? reduce() {
    return state
        .rebuild((s) => s.template.count = state.template.count + increment);
  }
}
