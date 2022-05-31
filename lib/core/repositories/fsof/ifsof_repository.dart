import 'package:fsof/core/entities/fsof.dart';
import 'package:fsof/core/models/result.dart';

abstract class IFsofRepository{
  Future<Result<Fsof, BackendError>> getFsof({
    required int id,
  });
}