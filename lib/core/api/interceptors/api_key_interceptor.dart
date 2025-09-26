// coverage:ignore-file

import 'package:dio/dio.dart';

import 'package:cat_breed/core/utils/constants.dart';

class ApiKeyInterceptor extends Interceptor {
  ApiKeyInterceptor();

  static const String _apiKeyHeader = 'x-api-key';

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers[_apiKeyHeader] = Constants.apiKey;
    super.onRequest(options, handler);
  }
}
