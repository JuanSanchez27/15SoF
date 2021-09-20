import 'package:fsof/api_client/fsof_api_client.dart';
import 'package:fsof/utils/error_recorder.dart';

class FsofService {
  FsofService({
    required this.apiClient,
    required this.errorRecorder,
  });

  final FsofApiClient apiClient;
  final ErrorRecorder errorRecorder;

  Future<String> getTitle() {
    return apiClient.getTitle().onError(errorRecorder.recordError);
  }

  Stream<int> getZero() {
    return Stream.value(0);
  }
}
