import 'package:fpdart/fpdart.dart';

import 'package:cat_breed/core/core.dart';
import 'package:cat_breed/features/cat_breeds/data/datasources/cat_datasource.dart';
import 'package:cat_breed/features/cat_breeds/data/mappers/cat_breed_mapper.dart';
import 'package:cat_breed/features/cat_breeds/domain/domain.dart';

class CatRepositoryImpl implements CatRepository {
  final CatDatasource dataSource;
  CatRepositoryImpl({required this.dataSource});

  @override
  Future<Result<List<CatBreedEntity>>> getBreeds({
    required int page,
    required int limit,
  }) async {
    try {
      final breeds = await dataSource.getBreeds(page: page, limit: limit);

      final entities =
          breeds.map((model) => CatBreedMapper.toEntity(model: model)).toList();

      return Right(entities);
    } catch (e) {
      return Left(Failure('Error fetching breeds: $e'));
    }
  }

  @override
  Future<Result<List<CatBreedEntity>>> getBreedsByQuery({
    required String query,
  }) async {
    try {
      final breeds = await dataSource.getBreedsByQuery(query: query);
      final entities =
          breeds.map((model) => CatBreedMapper.toEntity(model: model)).toList();
      return Right(entities);
    } catch (e) {
      return Left(Failure('Error fetching breeds by query: $e'));
    }
  }
}
