import 'package:alice_lightweight/alice.dart';
import 'package:dash_kit_network/dash_kit_network.dart';
import 'package:dio/dio.dart';
import 'package:fsof/api_client/fsof_api_client.dart';
import 'package:fsof/api_client/fsof_refresh_tokens_delegate.dart';
import 'package:fsof/configuration/fsof_api_environment.dart';
import 'package:fsof/utils/debug.dart';

FsofApiClient configureApiClient({
  required Alice alice,
  required TokenStorage tokenStorage,
  required FsofApiEnvironment environment,
}) {
  final apiDio = _createApiDio(alice);

  final refreshTokensDelegate = FsofRefreshTokensDelegate(
    tokenStorage: tokenStorage,
  );

  final client = FsofApiClient(
    environment: environment,
    dio: apiDio,
    delegate: refreshTokensDelegate,
  );

  return client;
}

Dio _createApiDio(Alice alice) {
  final apiDio = Dio();

  apiDio.options.connectTimeout = 30 * 1000;
  apiDio.options.receiveTimeout = 30 * 1000;
  apiDio.options.sendTimeout = 30 * 1000;

  apiDio.interceptors.add(alice.getDioInterceptor());

  debug(() {
    apiDio.interceptors.add(LogInterceptor(
      requestBody: true,
      responseBody: true,
    ));
  });

  return apiDio;
}
