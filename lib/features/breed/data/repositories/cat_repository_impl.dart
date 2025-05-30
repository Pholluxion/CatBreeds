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
    final result = await catApiDatasource.getPaginatedBreeds(page, limit);
    return result.fold((error) => Left(error), (breeds) => Right(breeds));
  }

  @override
  Future<Either<Failure, Picture>> getPictureById(String id) async {
    final result = await catApiDatasource.getPictureById(id);
    return result.fold((error) => Left(error), (picture) => Right(picture));
  }

  @override
  Future<Either<Failure, List<Breed>>> getBreedsByQuery(String query) async {
    final result = await catApiDatasource.getBreedsByQuery(query);
    return result.fold((error) => Left(error), (breeds) => Right(breeds));
  }
}
