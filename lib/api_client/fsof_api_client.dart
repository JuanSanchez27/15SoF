library fsof_api;

import 'package:dash_kit_network/dash_kit_network.dart';
import 'package:fsof/api_client/fsof_refresh_tokens_delegate.dart';
import 'package:fsof/api_client/response_mappers.dart' as response_mappers;
import 'package:fsof/models/network/responses/title_response_model.dart';

class FsofApiClient extends ApiClient {
  FsofApiClient({
    required ApiEnvironment environment,
    required Dio dio,
    required FsofRefreshTokensDelegate delegate,
    ErrorHandlerDelegate? errorHandlerDelegate,
  }) : super(
          environment: environment,
          dio: dio,
          delegate: delegate,
          errorHandlerDelegate: errorHandlerDelegate,
        );

  Future<String> getTitle() {
    return get(
      path: '',
      responseMapper: response_mappers
          .standard((json) => TitleResponseModel.fromJson(json).title),
      isAuthorisedRequest: true,
    );
  }
}
