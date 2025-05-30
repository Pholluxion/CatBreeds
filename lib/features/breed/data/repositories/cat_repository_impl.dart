import 'package:fpdart/fpdart.dart';

import 'package:cat_breed/core/core.dart';
import 'package:cat_breed/features/breed/domain/domain.dart';

class CatRepositoryImpl implements CatRepository {
  final CatDatasource catApiDatasource;
  CatRepositoryImpl(this.catApiDatasource);

  @override
  Future<Either<Failure, List<Breed>>> getPaginatedBreeds(
    int page,
    int limit,
  ) async {
    return await catApiDatasource.getPaginatedBreeds(page, limit);
  }

  @override
  Future<Either<Failure, Picture>> getPictureById(String id) async {
    return await catApiDatasource.getPictureById(id);
  }

  @override
  Future<Either<Failure, List<Breed>>> getBreedsByQuery(String query) async {
    return await catApiDatasource.getBreedsByQuery(query);
  }
}
