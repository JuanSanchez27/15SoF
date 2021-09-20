import 'package:dash_kit_network/dash_kit_network.dart';

class FsofApiEnvironment extends ApiEnvironment {
  const FsofApiEnvironment({
    required String baseUrl,
    bool validateRequestsByDefault = true,
    bool isRequestsAuthorisedByDefault = false,
  }) : super(
          baseUrl: baseUrl,
          validateRequestsByDefault: validateRequestsByDefault,
          isRequestsAuthorisedByDefault: isRequestsAuthorisedByDefault,
        );

  static const production = FsofApiEnvironment(
    baseUrl: 'https://api.15secondsoffame.com/',
    validateRequestsByDefault: true,
    isRequestsAuthorisedByDefault: false,
  );

  static const staging = FsofApiEnvironment(
    baseUrl: 'https://15sof-api-qa03.azurewebsites.net/v4/',
    validateRequestsByDefault: true,
    isRequestsAuthorisedByDefault: false,
  );
}
