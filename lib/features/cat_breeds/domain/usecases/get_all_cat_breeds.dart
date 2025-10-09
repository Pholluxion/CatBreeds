import 'package:cat_breed/core/core.dart';
import 'package:cat_breed/features/cat_breeds/domain/domain.dart';

typedef Paginated = ({int page, int limit});

class GetAllCatBreeds implements Usecase<List<CatBreedEntity>, Paginated> {
  final CatRepository repository;

  GetAllCatBreeds(this.repository);

  @override
  Future<Result<List<CatBreedEntity>>> call(Paginated params) async {
    return await repository.getBreeds(page: params.page, limit: params.limit);
  }
}
