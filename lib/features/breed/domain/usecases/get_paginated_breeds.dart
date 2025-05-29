import 'package:fpdart/fpdart.dart';

import 'package:cat_breed/core/core.dart';
import 'package:cat_breed/features/breed/domain/domain.dart';

class GetPaginatedBreeds implements Usecase<List<Breed>, Map<String, dynamic>> {
  final CatRepository repository;

  GetPaginatedBreeds(this.repository);

  @override
  Future<Either<Failure, List<Breed>>> call(Map<String, dynamic> params) async {
    final page = params['page'] ?? 1;
    final limit = params['limit'] ?? 10;
    return await repository.getPaginatedBreeds(page, limit);
  }
}
