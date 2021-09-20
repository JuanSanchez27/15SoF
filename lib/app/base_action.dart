import 'package:dash_kit_core/dash_kit_core.dart';
import 'package:fsof/app/app_state.dart';
import 'package:fsof/app/operation.dart';
import 'package:fsof/utils/test.dart';

abstract class BaseAction extends Action<AppState> {
  BaseAction({bool isRefreshing = false}) : super(isRefreshing: isRefreshing);

  @override
  Operation? get operationKey => null;

  @override
  bool abortDispatch() => isTestingEnvironment();
}
