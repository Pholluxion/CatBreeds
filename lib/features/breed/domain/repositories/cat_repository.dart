import 'package:fpdart/fpdart.dart';

import 'package:cat_breed/core/core.dart';
import 'package:cat_breed/features/breed/domain/domain.dart';

abstract class CatRepository {
  Future<Either<Failure, List<Breed>>> getPaginatedBreeds(int page, int limit);
  Future<Either<Failure, Picture>> getPictureById(String id);
}
