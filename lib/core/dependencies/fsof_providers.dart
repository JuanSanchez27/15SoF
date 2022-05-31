import 'package:fsof/core/data_sources/fsof_data_source.dart';
import 'package:fsof/core/dependencies/apis_provider.dart';
import 'package:fsof/core/repositories/fsof/fsof_repository.dart';
import 'package:fsof/core/use_cases/get_fsof_use_case/get_fsof_use_case.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final fsofDataSourceProvider = Provider((ref) => FsofDataSource(
      apiUtils: ref.watch(fsofApiProvider),
    ));

final fsofRepositoryProvider = Provider((ref) => FsofRepository(
      fsofDataSource: ref.watch(fsofDataSourceProvider),
    ));

final getFsofUseCaseProvider = Provider(
  (ref) => GetFsofUseCase(
    fsofRepository: ref.watch(fsofRepositoryProvider),
  ),
);
