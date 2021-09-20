import 'package:dash_kit_network/dash_kit_network.dart';

class FsofRefreshTokensDelegate extends BaseRefreshTokensDelegate {
  FsofRefreshTokensDelegate({
    required TokenStorage tokenStorage,
  }) : super(tokenStorage);

  @override
  // TODO(developer): implement this
  void onTokensRefreshingFailed() {}

  @override
  Future<TokenPair> refreshTokens(Dio dio, TokenPair tokenPair) {
    return dio.put('refresh', data: {
      'refresh_token': tokenPair.refreshToken
    }).then((value) => TokenPair(
          accessToken: value.data['access_token'],
          refreshToken: value.data['refresh_token'],
        ));
  }
}
