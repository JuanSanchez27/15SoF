import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fsof/core/data_sources/fsof_data_source.dart';
import 'package:fsof/core/dependencies/apis_provider.dart';
import 'package:fsof/core/repositories/fsof/fsof_repository.dart';
import 'package:fsof/core/use_cases/login/post_phone_number_use_case.dart';
import 'package:fsof/core/use_cases/login/post_verification_number_user_case.dart';
import 'package:fsof/core/use_cases/login/validate_account_exist.dart';

final fsofDataSourceProvider = Provider((ref) => FsofDataSource(
      apiUtils: ref.watch(fsofApiProvider),
    ));

final fsofRepositoryProvider = Provider((ref) => FsofRepository(
      fsofDataSource: ref.watch(fsofDataSourceProvider),
    ));

final postPhoneNumberUseCaseProvider = Provider((ref) => PostPhoneNumberUseCase(
  fsofRepository: ref.watch(fsofRepositoryProvider),
));

final postValidateCodeUseCaseProvider = Provider((ref) => PostCodeValidateUseCase(
  fsofRepository: ref.watch(fsofRepositoryProvider),
));

final validateAccountExistence = Provider((ref) => PostValidateAccountExistence(
  fsofRepository: ref.watch(fsofRepositoryProvider),
));

 