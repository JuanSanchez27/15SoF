import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fsof/core/entities/result_state.dart';
import 'package:fsof/core/models/result.dart';
import 'package:fsof/core/use_cases/login/validate_account_exist.dart';

class PostValidateAccountExistenceNotifier
    extends StateNotifier<ResultState<bool, BackendError>> {
  PostValidateAccountExistenceNotifier({
    required PostValidateAccountExistence postValidateAccountExistenceUsesCase,
  })  : _postpostValidateAccountExistenceUsesCase = postValidateAccountExistenceUsesCase,
        super(ResultState.initial());
  final PostValidateAccountExistence _postpostValidateAccountExistenceUsesCase;

  Future<void> validateAccountExistence({
    required String deviceUniqueIdentifier,
    required int authPlatformID,
    required String authToken,
    required String deviceSystemId,
    String? email,
    String? phoneNumber,
  }) async {
    state = ResultState.loading();
    final response = await _postpostValidateAccountExistenceUsesCase.call(
        deviceUniqueIdentifier: deviceUniqueIdentifier,
        phoneNumber: phoneNumber,
        authToken:authToken, 
        deviceSystemId: deviceSystemId, 
        email: email, 
        authPlatformID: authPlatformID
      );

    state = response.when(
      fail: (fail) => ResultState.error(fail),
      success: (success) => ResultState.data(success),
    );
  }
}
