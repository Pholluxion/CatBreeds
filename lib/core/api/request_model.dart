// coverage:ignore-file

abstract class RequestModel {}

class GetRequestModel extends RequestModel {
  final String baseUrl;
  final String path;
  final Map<String, dynamic>? queryParameters;

  GetRequestModel({
    required this.baseUrl,
    required this.path,
    this.queryParameters,
  });
}
