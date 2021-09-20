import 'dart:async';

import 'package:fsof/app/app_state.dart';
import 'package:fsof/app/base_action.dart';
import 'package:fsof/app/operation.dart';
import 'package:fsof/services/fsof_service.dart';
import 'package:get_it/get_it.dart';

class GetTitleAction extends BaseAction {
  @override
  Operation get operationKey => Operation.getTitle;

  @override
  Future<AppState?> reduce() async {
    final templateService = GetIt.I.get<FsofService>();

    final title = await templateService.getTitle();

    return state.rebuild((s) => s.template.title = title);
  }
}
