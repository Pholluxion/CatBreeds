// coverage:ignore-file

import 'package:dio/dio.dart';

import 'package:cat_breed/core/api/request_model.dart';

abstract class HttpClient {
  Future<Response> get(GetRequestModel request);
}

class DioHttpClient implements HttpClient {
  final Dio _dio;

  DioHttpClient({required Dio dio}) : _dio = dio;

  @override
  Future<Response> get(GetRequestModel request) {
    final uri = Uri.parse(request.baseUrl).resolve(request.path);
    return _dio.get(uri.toString(), queryParameters: request.queryParameters);
  }
}
