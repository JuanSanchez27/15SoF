import 'package:fsof/core/models/result.dart';
import 'package:fsof/core/repositories/fsof/ifsof_repository.dart';

class PostValidateAccountExistence {
  PostValidateAccountExistence({
    required IFsofRepository fsofRepository,
  }) : _fsofRepository = fsofRepository;
  final IFsofRepository _fsofRepository;

  Future<Result<bool, BackendError>> call({
    required String deviceUniqueIdentifier,
    required int authPlatformID,
    required String authToken,
    required String deviceSystemId,
    String? email,
    String? phoneNumber,
  }) =>
      _fsofRepository.validateAccountExistence(
        deviceUniqueIdentifier: deviceUniqueIdentifier,
        phoneNumber: phoneNumber,
        deviceSystemId: deviceSystemId, 
        authToken: authToken,
        email: email, 
        authPlatformID: authPlatformID
      );
}
