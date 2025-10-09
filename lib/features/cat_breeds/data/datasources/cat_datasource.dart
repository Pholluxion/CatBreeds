import 'package:cat_breed/features/cat_breeds/data/data.dart';

abstract class CatDatasource {
  Future<List<CatBreedModel>> getBreeds({
    required int page,
    required int limit,
  });
  Future<List<CatBreedModel>> getBreedsByQuery({required String query});
}
