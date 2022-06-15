
import 'package:fsof/core/api/api_utils.dart';
import 'package:fsof/core/models/result.dart';

const String _kRootPathV4 = 'api/v4';

class FsofDataSource {
  final ApiUtils _apiUtils;

  FsofDataSource({
    required ApiUtils apiUtils,
  }) : _apiUtils = apiUtils;

  Future<Result <bool , BackendError>> getPhoneCode({
    required String phoneNumber,
    required String deviceUniqueIdentifier,
    required String phoneNumberCountryCode
  }) async {
    const String path = '$_kRootPathV4/Verification/PhoneNumber';

    final body = {
      'DeviceUniqueIdentifier': deviceUniqueIdentifier,
      'PhoneNumber': phoneNumber,
      'PhoneNumberCountryCode': phoneNumberCountryCode
    };

    Result<dynamic, BackendError> result = await _apiUtils.makeRequest(
      method: Method.post,
      path: path,
      data: body,
    );

    return result.when(
      fail: (fail) => Fail(fail),
      success: (success) => Success(true),
    );
  }

  Future<Result <String , BackendError>> validateCode({
    required String phoneNumber,
    required String deviceUniqueIdentifier,
    required String phoneNumberCountryCode,
    required String verificationCode,
    required int deviceSystemId
  }) async {
    const String path = '$_kRootPathV4/Verification/PhoneNumber/Code';


    final body = {
      'DeviceUniqueIdentifier': deviceUniqueIdentifier,
      'PhoneNumber': phoneNumber,
      'PhoneNumberCountryCode': phoneNumberCountryCode,
      'DeviceOperatingSystemID': deviceSystemId,
      'VerificationCode':verificationCode,
    };

    Result<dynamic, BackendError> result = await _apiUtils.makeRequest(
      method: Method.post,
      path: path,
      data: body,
    );

    return result.when(
      fail: (fail) => Fail(fail),
      success: (success) => Success(success['VerificationToken']),
    );
  }

  Future<Result <bool , BackendError>> validateAccountExistence({
    required String deviceUniqueIdentifier,
    required int authPlatformID,
    required String authToken,
    required String deviceSystemId,
    String? email,
    String? phoneNumber,
  }) async {
    const String path = '$_kRootPathV4/VerifyAccountExistence';

    final body = {
      'DeviceUniqueIdentifier': deviceUniqueIdentifier,
      'DeviceOperatingSystemID': deviceSystemId,
      'AuthPlatformID': authPlatformID,
      'PhoneNumber': phoneNumber,
      'Email': email,
      'AuthToken': authToken
    };

    

    Result<dynamic, BackendError> result = await _apiUtils.makeRequest(
      method: Method.post,
      path: path,
      data: body,
    );

    return result.when(
      fail: (fail) => Fail(fail),
      success: (success) => Success(success['Exists']),
    );
  }

}
