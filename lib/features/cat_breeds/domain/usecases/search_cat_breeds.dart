import 'package:cat_breed/core/core.dart';
import 'package:cat_breed/features/cat_breeds/domain/domain.dart';

class SearchCatBreeds implements Usecase<List<CatBreedEntity>, String> {
  final CatRepository repository;
  SearchCatBreeds(this.repository);
  @override
  Future<Result<List<CatBreedEntity>>> call(String params) {
    return repository.getBreedsByQuery(query: params);
  }
}
