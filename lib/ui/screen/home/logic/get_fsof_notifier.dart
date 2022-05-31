import 'package:fsof/core/entities/fsof.dart';
import 'package:fsof/core/entities/result_state.dart';
import 'package:fsof/core/models/result.dart';
import 'package:fsof/core/use_cases/get_fsof_use_case/get_fsof_use_case.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GetFsofNotifier
    extends StateNotifier<ResultState<Fsof, BackendError>> {
  final GetFsofUseCase _getFsofUseCase;

  GetFsofNotifier({
    required GetFsofUseCase getFsofUseCase,
  })  : _getFsofUseCase = getFsofUseCase,
        super(ResultState.loading());

  Future<void> getFsof({
    required int numPokedex,
  }) async {
    final response = await _getFsofUseCase.call(
      id: numPokedex,
    );

    state = response.when(
      fail: (fail) => ResultState.error(fail),
      success: (success) => ResultState.data(success),
    );
  }
}
