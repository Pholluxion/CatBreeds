import 'package:cat_breed/core/core.dart';
import 'package:cat_breed/features/breed/domain/domain.dart';

abstract class CatDatasource {
  Future<Result<List<Breed>>> getPaginatedBreeds(int page, int limit);
  Future<Result<Picture>> getPictureById(String id);
  Future<Result<List<Breed>>> getBreedsByQuery(String query);
}
