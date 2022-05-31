import 'package:fsof/core/api/api_utils.dart';
import 'package:fsof/core/models/fsof_model.dart';
import 'package:fsof/core/models/result.dart';

const String _kRootPathV2 = 'api/v2';

class FsofDataSource {
  final ApiUtils _apiUtils;

  FsofDataSource({
    required ApiUtils apiUtils,
  }) : _apiUtils = apiUtils;

  Future<Result<FsofModel, BackendError>> getAllFsofs({
    required int id,
  }) async {
    final String path = '$_kRootPathV2/fsof';

    Result<dynamic, BackendError> result = await _apiUtils.makeRequest(
      method: Method.get,
      path: path,
    );

    return result.when(
      fail: (fail) => Fail(fail),
      success: (success) {
        FsofModel fsof = FsofModel.fromJson(success['results'][0]);
        return Success(fsof);
      },
    );
  }
}
