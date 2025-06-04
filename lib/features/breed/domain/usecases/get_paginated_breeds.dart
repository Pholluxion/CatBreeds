import 'package:cat_breed/core/core.dart';
import 'package:cat_breed/features/breed/domain/domain.dart';

class GetPaginatedBreeds implements Usecase<List<Breed>, Paginated> {
  final CatRepository repository;

  GetPaginatedBreeds(this.repository);

  @override
  Future<Result<List<Breed>>> call(Paginated params) async {
    return await repository.getPaginatedBreeds(params.page, params.limit);
  }
}

class Paginated {
  final int page;
  final int limit;

  Paginated({required this.page, required this.limit});
}
