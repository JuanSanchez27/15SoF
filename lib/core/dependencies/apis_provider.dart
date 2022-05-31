import 'package:dio/dio.dart';
import 'package:fsof/core/api/api_utils.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fsof/ui/utils/constants/constants.dart';

final clientProvider = Provider((ref) => Dio());

final fsofApiProvider = Provider(
  (ref) => ApiUtils(
    client: ref.watch(clientProvider),
    host: basePath,
    tokenAuthorization: '',
  ),
);
