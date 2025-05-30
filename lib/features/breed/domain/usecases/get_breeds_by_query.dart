import 'package:fpdart/fpdart.dart';

import 'package:cat_breed/core/core.dart';
import 'package:cat_breed/features/breed/domain/domain.dart';

class GetBreedsByQuery implements Usecase<List<Breed>, String> {
  final CatRepository repository;
  GetBreedsByQuery(this.repository);
  @override
  Future<Either<Failure, List<Breed>>> call(String params) {
    return repository.getBreedsByQuery(params);
  }
}
