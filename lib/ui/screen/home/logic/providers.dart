import 'package:fsof/core/dependencies/fsof_providers.dart';
import 'package:fsof/core/entities/fsof.dart';
import 'package:fsof/core/entities/result_state.dart';
import 'package:fsof/core/models/result.dart';
import 'package:fsof/ui/screen/home/logic/get_fsof_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getFsofNotifierProvier = StateNotifierProvider<GetFsofNotifier,
    ResultState<Fsof, BackendError>>(
  (ref) => GetFsofNotifier(
    getFsofUseCase: ref.watch(getFsofUseCaseProvider),
  ),
);
