import 'package:cat_breed/features/cat_breeds/domain/domain.dart';

abstract class CatDatasource {
  Future<List<CatBreedEntity>> getBreeds(int page, int limit);
  Future<List<CatBreedEntity>> getBreedsByQuery(String query);
}
