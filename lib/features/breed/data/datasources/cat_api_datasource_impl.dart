import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';

import 'package:cat_breed/core/core.dart';
import 'package:cat_breed/features/breed/data/data.dart';
import 'package:cat_breed/features/breed/domain/domain.dart';

class CatApiDatasourceImpl implements CatDatasource {
  final Dio dio;
  final Map<String, Picture> _pictureCache = {};
  final Map<int, List<Breed>> _breedCache = {};
  CatApiDatasourceImpl({required this.dio});

  @override
  Future<Either<Failure, Picture>> getPictureById(String id) async {
    if (_pictureCache.containsKey(id)) {
      return Right(_pictureCache[id]!);
    }

    try {
      final response = await dio.get('images/$id');

      if (response.statusCode == 200) {
        final data = response.data;
        final picture = PictureModel.fromJson(data);
        _pictureCache[id] = picture;
        return Right(picture);
      } else {
        return Left(
          Failure('Failed to fetch picture: ${response.statusMessage}'),
        );
      }
    } catch (e) {
      return Left(Failure('Error fetching picture: $e'));
    }
  }

  @override
  Future<Either<Failure, List<Breed>>> getPaginatedBreeds(
    int page,
    int limit,
  ) async {
    if (_breedCache.containsKey(page)) {
      return Right(_breedCache[page]!);
    }

    try {
      final response = await dio.get(
        'breeds',
        queryParameters: {'page': page, 'limit': limit},
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        final breeds = data.map((item) => BreedModel.fromJson(item)).toList();
        _breedCache[page] = breeds;
        return Right(breeds);
      } else {
        return Left(
          Failure('Failed to fetch breeds: ${response.statusMessage}'),
        );
      }
    } catch (e) {
      return Left(Failure('Error fetching breeds: $e'));
    }
  }

  @override
  Future<Either<Failure, List<Breed>>> getBreedsByQuery(String query) async {
    try {
      final response = await dio.get(
        'breeds/search',
        queryParameters: {'q': query},
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        final breeds = data.map((item) => BreedModel.fromJson(item)).toList();
        return Right(breeds);
      } else {
        return Left(
          Failure('Failed to fetch breeds by query: ${response.statusMessage}'),
        );
      }
    } catch (e) {
      return Left(Failure('Error fetching breeds by query: $e'));
    }
  }
}
