import 'package:fsof/core/data_sources/fsof_data_source.dart';
import 'package:fsof/core/entities/fsof.dart';
import 'package:fsof/core/models/result.dart';
import 'package:fsof/core/repositories/fsof/ifsof_repository.dart';

class FsofRepository extends IFsofRepository {
  final FsofDataSource _fsofDataSource;

  FsofRepository({
    required FsofDataSource fsofDataSource,
  }) : _fsofDataSource = fsofDataSource;

  @override
  Future<Result<Fsof, BackendError>> getFsof({
    required int id,
  }) async {
    final result = await _fsofDataSource.getAllFsofs(
      id: id,
    );

    return result.when(
      fail: (fail) => Fail(fail),
      success: (success) => Success(success.toEntity()),
    );
  }
}
