import 'package:fsof/core/models/result.dart';

abstract class IFsofRepository {
  Future<Result<bool, BackendError>> getPhoneCode({
    required String phoneNumber,
    required String deviceUniqueIdentifier,
    required String phoneNumberCountryCode,
  });

  Future<Result<String, BackendError>> validateCode({
    required String phoneNumber,
    required String deviceUniqueIdentifier,
    required String phoneNumberCountryCode,
    required String verificationCode,
    required int deviceSystemId,
  });

  Future<Result <bool , BackendError>> validateAccountExistence({
    required String deviceUniqueIdentifier,
    required int authPlatformID,
    required String authToken,
    required String deviceSystemId,
    String? email,
    String? phoneNumber,
  });
}
