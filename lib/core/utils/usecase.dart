import 'package:fpdart/fpdart.dart';

import 'package:cat_breed/core/core.dart';

abstract interface class Usecase<SuccessType, Params> {
  Future<Either<Failure, SuccessType>> call(Params params);
}

class NoParams {}
