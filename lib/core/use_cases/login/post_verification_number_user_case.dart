import 'package:fsof/core/models/result.dart';
import 'package:fsof/core/repositories/fsof/ifsof_repository.dart';

class PostCodeValidateUseCase {
  PostCodeValidateUseCase({
    required IFsofRepository fsofRepository,
  }) : _fsofRepository = fsofRepository;
  final IFsofRepository _fsofRepository;

  Future<Result<String, BackendError>> call({
    required String phoneNumber,
    required String deviceUniqueIdentifier,
    required String phoneNumberCountryCode,
    required String verificationCode,
    required int deviceSystemId,
  }) =>
      _fsofRepository.validateCode(
        deviceUniqueIdentifier: deviceUniqueIdentifier,
        phoneNumber: phoneNumber,
        phoneNumberCountryCode: phoneNumberCountryCode, 
        verificationCode: verificationCode,
        deviceSystemId: deviceSystemId,
      );
}
