import 'package:fsof/core/models/result.dart';
import 'package:fsof/core/repositories/fsof/ifsof_repository.dart';

class PostPhoneNumberUseCase {
  PostPhoneNumberUseCase({
    required IFsofRepository fsofRepository,
  }) : _fsofRepository = fsofRepository;
  final IFsofRepository _fsofRepository;

  Future<Result<bool, BackendError>> call({
    required String phoneNumber,
    required String deviceUniqueIdentifier,
    required String phoneNumberCountryCode,
  }) =>
      _fsofRepository.getPhoneCode(
        deviceUniqueIdentifier: deviceUniqueIdentifier,
        phoneNumber: phoneNumber,
        phoneNumberCountryCode: phoneNumberCountryCode,
      );
}
