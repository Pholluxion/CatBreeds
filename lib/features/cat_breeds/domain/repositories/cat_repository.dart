import 'package:cat_breed/core/core.dart';
import 'package:cat_breed/features/cat_breeds/domain/domain.dart';

abstract class CatRepository {
  Future<Result<List<CatBreedEntity>>> getBreeds(int page, int limit);
  Future<Result<List<CatBreedEntity>>> getBreedsByQuery(String query);
}
