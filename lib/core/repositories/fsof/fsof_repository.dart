import 'package:fsof/core/data_sources/fsof_data_source.dart';
import 'package:fsof/core/models/result.dart';
import 'package:fsof/core/repositories/fsof/ifsof_repository.dart';

class FsofRepository extends IFsofRepository {
  final FsofDataSource _fsofDataSource;

  FsofRepository({
    required FsofDataSource fsofDataSource,
  }) : _fsofDataSource = fsofDataSource;

  @override
  Future<Result<bool, BackendError>> getPhoneCode({
    required String phoneNumber,
    required String deviceUniqueIdentifier,
    required String phoneNumberCountryCode,
  }) async {
    final result = await _fsofDataSource.getPhoneCode(
      deviceUniqueIdentifier: deviceUniqueIdentifier,
      phoneNumberCountryCode: phoneNumberCountryCode,
      phoneNumber: phoneNumber,
    );

    return result.when(
      fail: (fail) => Fail(fail),
      success: (success) => Success(success),
    );
  }

  @override
  Future<Result<String, BackendError>> validateCode({
    required String phoneNumber,
    required String deviceUniqueIdentifier,
    required String phoneNumberCountryCode,
    required String verificationCode,
    required int deviceSystemId,
  }) async {
    final result = await _fsofDataSource.validateCode(
      deviceUniqueIdentifier: deviceUniqueIdentifier,
      phoneNumberCountryCode: phoneNumberCountryCode,
      phoneNumber: phoneNumber,
      verificationCode: verificationCode,
      deviceSystemId: deviceSystemId,
    );

    return result.when(
      fail: (fail) => Fail(fail),
      success: (success) => Success(success),
    );
  }

  @override
  Future<Result<bool, BackendError>> validateAccountExistence({
    required String deviceUniqueIdentifier,
    required int authPlatformID,
    required String authToken,
    required String deviceSystemId,
    String? email,
    String? phoneNumber,
  }) async{
    final result = await _fsofDataSource.validateAccountExistence(
      deviceUniqueIdentifier: deviceUniqueIdentifier,
      phoneNumber: phoneNumber!,
      deviceSystemId: deviceSystemId, 
      authToken: authToken,
      email: email, 
      authPlatformID: authPlatformID,
    );

    return result.when(
      fail: (fail) => Fail(fail),
      success: (success) => Success(success),
    );
  }
}
