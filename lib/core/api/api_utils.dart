import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:fsof/core/models/result.dart';
import 'package:fsof/ui/utils/constants/general.dart';

enum Method {
  delete,
  get,
  patch,
  post,
  put,
}

class ApiUtils{

  final Dio _client;
  final String _host;
  final String _tokenAuthorization;


  ApiUtils({
    required Dio client,
    required String host,
    required String tokenAuthorization,
  }) : _client = client,
       _host = host,
       _tokenAuthorization = tokenAuthorization;

  /// If the backend is no already implement you can use [temporalHost] for make
  /// the request to a custom endpoint something like:
  /// _**myBranch/my/endpoint/**_ Remember don't use [https://] or similar the
  /// client already make this additions in the initialization and the route
  /// must be raw.
  ///
  /// In the other way if you need return a mock file you can specific the path
  /// with [mockResponseFile] and later of 2 seconds this will be return a
  /// response with the mock response.
  ///
  /// The mock files are loaded from `assets/mocks/` something like:
  /// _**assets/mocks/yourAwesomeMock.json**_
  Future<Result<dynamic, BackendError>> makeRequest({
    dynamic data,
    String? errorPath,
    String? errorDescriptionPath,
    Map<String, dynamic>? headers,
    required Method method,
    String? mockResponseFile,
    required String path,
    Map<String, dynamic>? queryParameters,
    bool onlyPath = false,

    /// Use only if need inject a temporal host with a custom deployment branch
    String? temporalHost,
  }) async {
    /// Return a mock response if the file is specified
    if (mockResponseFile?.isNotEmpty ?? false) {
      final response = await _getMockResponse(mockResponseFile!);
      return Success(response);
    }

    Map<String, dynamic> _headers = <String, dynamic>{};

    //Bearer authorization header
    ///TODO token api
    //_headers[kAuthorizationHeader] = '$kBearer $_tokenAuthorization';
    _headers[kApiSecretKey] = "dVBprfsHsIr8Z5aCoVua";
    _headers[kApiClientId] = "c789e448-1d21-48e9-a51a-d4c7b995af53";

    //Additional headers
    _headers.addAll(headers ?? {});

    Uri uri = Uri.https(temporalHost ?? _host, path, queryParameters);

    if(onlyPath){
      path = 'https://${temporalHost ?? _host}/$path';
    }

    final Response response;

    final Options options = Options(
      headers: _headers,
    );

    try {
      switch (method) {
        case Method.delete:
          response = await _client.deleteUri(
            uri,
            options: options,
          );
          break;
        case Method.get:
          response = await _client.getUri(
            uri,
            options: options,
          );
          break;
        case Method.patch:
          response = await _client.patchUri(
            uri,
            data: data,
            options: options,
          );
          break;
        case Method.post:
          response = await _client.postUri(
            uri,
            data: data,
            options: options,
          );
          break;
        case Method.put:
          response = await _client.putUri(
            uri,
            data: data,
            options: options,
          );
          break;
      }
      return Result.success(response.data);
    } on DioError catch (error) {
      switch (error.type) {
        case DioErrorType.connectTimeout:
        case DioErrorType.receiveTimeout:
        case DioErrorType.sendTimeout:
          return Result.fail(
            BackendError(
              statusCode: 408,
              description: error.error,
              err: 'TimeOut',
            ),
          );
        default:
          return Result.fail(
            BackendError(
              data: error.response?.data is String
                  ? {"message": ''}
                  : (error.response!.data as Map),
              description: error.message,
              err: error.error.toString(),
              statusCode: error.response?.statusCode ?? -1,
            ),
          );
      }
    }
  }

  Future<Map<String, dynamic>> _getMockResponse(String filePath) =>
      Future.delayed(
        const Duration(seconds: 2),
            () async {
          final file = await rootBundle.loadString('assets/mocks/$filePath');
          return jsonDecode(file);
        },
      );

}