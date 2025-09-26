import 'package:cat_breed/core/api/http_client.dart';
import 'package:cat_breed/core/api/request_model.dart';
import 'package:cat_breed/core/utils/constants.dart';
import 'package:cat_breed/features/cat_breeds/data/data.dart';

class CatDatasourceImpl implements CatDatasource {
  final HttpClient _httpClient;

  CatDatasourceImpl({required HttpClient httpClient})
    : _httpClient = httpClient;

  @override
  Future<List<CatBreedModel>> getBreeds(int page, int limit) async {
    final request = GetRequestModel(
      baseUrl: Constants.apiURL,
      path: Constants.catBreedsEndpoint,
      queryParameters: {'page': page, 'limit': limit},
    );

    return await _httpClient.get<List<CatBreedModel>>(
      request,
      decoder: (response) {
        return (response.data as List)
            .map((item) => CatBreedModel.fromJson(item))
            .toList();
      },
    );
  }

  @override
  Future<List<CatBreedModel>> getBreedsByQuery(String query) async {
    final request = GetRequestModel(
      baseUrl: Constants.apiURL,
      path: Constants.catBreedsSearchEndpoint,
      queryParameters: {'q': query},
    );

    return await _httpClient.get<List<CatBreedModel>>(
      request,
      decoder: (response) {
        return (response.data as List)
            .map((item) => CatBreedModel.fromJson(item))
            .toList();
      },
    );
  }
}
