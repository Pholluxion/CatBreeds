import 'package:dio/dio.dart' hide Response;

import 'package:cat_breed/core/utils/constants.dart';
import 'package:cat_breed/features/cat_breeds/data/data.dart';
import 'package:cat_breed/features/cat_breeds/domain/domain.dart';

class CatDatasourceImpl implements CatDatasource {
  final Dio dio;

  CatDatasourceImpl({required this.dio});

  @override
  Future<List<CatBreedEntity>> getBreeds(int page, int limit) async {
    final response = await dio.get(
      Constants.catBreedsEndpoint,
      queryParameters: {'page': page, 'limit': limit},
    );

    final List<dynamic> data = response.data;
    return data.map((item) => CatBreedModel.fromJson(item)).toList();
  }

  @override
  Future<List<CatBreedEntity>> getBreedsByQuery(String query) async {
    final response = await dio.get(
      Constants.catBreedsSearchEndpoint,
      queryParameters: {'q': query},
    );

    final List<dynamic> data = response.data;
    return data.map((item) => CatBreedModel.fromJson(item)).toList();
  }
}
