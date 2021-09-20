import 'package:dash_kit_network/dash_kit_network.dart';

class RequestCommonErrorException implements Exception {
  const RequestCommonErrorException(this.response);

  final Response response;

  @override
  String toString() {
    return 'Request error: ${response.toString()}';
  }
}
