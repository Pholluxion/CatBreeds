import 'package:cat_breed/features/cat_breeds/data/data.dart';

abstract class CatDatasource {
  Future<List<CatBreedModel>> getBreeds(int page, int limit);
  Future<List<CatBreedModel>> getBreedsByQuery(String query);
}
