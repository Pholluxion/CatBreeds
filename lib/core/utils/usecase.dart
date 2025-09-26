// coverage:ignore-file

import 'package:cat_breed/core/core.dart';

abstract interface class Usecase<SuccessType, Params> {
  Future<Result<SuccessType>> call(Params params);
}

class NoParams {}
