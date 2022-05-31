import 'package:fsof/core/entities/fsof.dart';
import 'package:fsof/core/models/result.dart';
import 'package:fsof/core/repositories/fsof/ifsof_repository.dart';

class GetFsofUseCase {
  final IFsofRepository _fsofRepository;

  GetFsofUseCase({
    required IFsofRepository fsofRepository,
  }) : _fsofRepository = fsofRepository;

  Future<Result<Fsof, BackendError>> call({
    required int id,
  }) =>
      _fsofRepository.getFsof(
        id: id,
      );
}
