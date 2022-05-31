import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fsof/core/entities/result_state.dart';
import 'package:fsof/core/models/result.dart';
import 'package:fsof/core/use_cases/login/post_verification_number_user_case.dart';

class PostCodeValidateNotifier
    extends StateNotifier<ResultState<String, BackendError>> {
  PostCodeValidateNotifier({
    required PostCodeValidateUseCase postCodeValidateUseCase,
  })  : _postCodeValidateUseCase = postCodeValidateUseCase,
        super(ResultState.initial());
  final PostCodeValidateUseCase _postCodeValidateUseCase;

  Future<void> validateCode({
    required String phoneNumber,
    required String deviceUniqueIdentifier,
    required String phoneNumberCountryCode,
    required String verificationCode,
  }) async {
    state = ResultState.loading();
    final int devideSistemId = Platform.isAndroid ? 2 : 1;
    final response = await _postCodeValidateUseCase.call(
        deviceUniqueIdentifier: deviceUniqueIdentifier,
        phoneNumber: phoneNumber,
        phoneNumberCountryCode: phoneNumberCountryCode, 
        verificationCode: verificationCode,
        deviceSystemId: devideSistemId,
      );

    state = response.when(
      fail: (fail) => ResultState.error(fail),
      success: (success) => ResultState.data(success),
    );
  }
}
