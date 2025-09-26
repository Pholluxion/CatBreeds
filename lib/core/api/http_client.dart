// coverage:ignore-file

import 'package:dio/dio.dart';

import 'package:cat_breed/core/api/request_model.dart';

abstract class HttpClient {
  Future<T> get<T>(
    GetRequestModel request, {
    required T Function(Response response) decoder,
  });
}

class DioHttpClient implements HttpClient {
  final Dio _dio;

  DioHttpClient({required Dio dio}) : _dio = dio;

  @override
  Future<T> get<T>(
    GetRequestModel request, {
    required T Function(Response response) decoder,
  }) {
    final uri = Uri.parse(request.baseUrl).resolve(request.path);

    return _dio
        .get(uri.toString(), queryParameters: request.queryParameters)
        .then((response) {
          return decoder(response);
        });
  }
}
