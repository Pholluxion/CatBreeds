import 'package:fpdart/fpdart.dart';

import 'package:cat_breed/core/core.dart';
import 'package:cat_breed/features/cat_breeds/data/datasources/cat_datasource.dart';
import 'package:cat_breed/features/cat_breeds/domain/domain.dart';

class CatRepositoryImpl implements CatRepository {
  final CatDatasource catDataSource;
  CatRepositoryImpl({required this.catDataSource});

  @override
  Future<Result<List<CatBreedEntity>>> getBreeds(int page, int limit) async {
    try {
      final breeds = await catDataSource.getBreeds(page, limit);
      return Right(breeds);
    } catch (e) {
      return Left(Failure('Error fetching breeds: $e'));
    }
  }

  @override
  Future<Result<List<CatBreedEntity>>> getBreedsByQuery(String query) async {
    try {
      final breeds = await catDataSource.getBreedsByQuery(query);
      return Right(breeds);
    } catch (e) {
      return Left(Failure('Error fetching breeds by query: $e'));
    }
  }
}
