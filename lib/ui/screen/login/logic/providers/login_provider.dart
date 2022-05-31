import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fsof/core/dependencies/fsof_providers.dart';
import 'package:fsof/core/entities/result_state.dart';
import 'package:fsof/core/models/result.dart';
import 'package:fsof/ui/screen/login/logic/providers/post_code_validation_notifier.dart';
import 'package:fsof/ui/screen/login/logic/providers/post_phone_number_notifier.dart';
import 'package:fsof/ui/screen/login/logic/providers/post_validate_account_existence_notifier.dart';

final postPhoneNumberNotifierProvider = StateNotifierProvider<
        PostPhoneNumberNotifier, ResultState<bool, BackendError>>(
    (ref) => PostPhoneNumberNotifier(
          postPhoneNumerUseCase: ref.watch(postPhoneNumberUseCaseProvider),
        ));


final postValidateCodeNotifierProvider = StateNotifierProvider.autoDispose<
        PostCodeValidateNotifier, ResultState<String, BackendError>>(
    (ref) => PostCodeValidateNotifier(
          postCodeValidateUseCase: ref.watch(postValidateCodeUseCaseProvider),
        ));

final postValidateAccountExistenceProvider = StateNotifierProvider<
        PostValidateAccountExistenceNotifier, ResultState<bool, BackendError>>(
    (ref) => PostValidateAccountExistenceNotifier(
      postValidateAccountExistenceUsesCase: ref.watch(validateAccountExistence),
));
