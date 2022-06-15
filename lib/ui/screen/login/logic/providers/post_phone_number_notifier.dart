import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fsof/core/entities/result_state.dart';
import 'package:fsof/core/models/result.dart';
import 'package:fsof/core/use_cases/login/post_phone_number_use_case.dart';

class PostPhoneNumberNotifier
    extends StateNotifier<ResultState<bool, BackendError>> {
  PostPhoneNumberNotifier({
    required PostPhoneNumberUseCase postPhoneNumerUseCase,
  })  : _postPhoneNumberUseCase = postPhoneNumerUseCase,
        super(ResultState.initial());
  final PostPhoneNumberUseCase _postPhoneNumberUseCase;

  Future<void> getPhoneCode({
    required String phoneNumber,
    required String deviceUniqueIdentifier,
    required String phoneNumberCountryCode,
  }) async {
    state = ResultState.loading();
    final response = await _postPhoneNumberUseCase.call(
        deviceUniqueIdentifier: deviceUniqueIdentifier,
        phoneNumber: phoneNumber,
        phoneNumberCountryCode: phoneNumberCountryCode);

    state = response.when(
      fail: (fail) => ResultState.error(fail),
      success: (success) => ResultState.data(success),
    );
  }
}
