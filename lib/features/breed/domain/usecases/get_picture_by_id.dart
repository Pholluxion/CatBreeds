import 'package:cat_breed/core/core.dart';
import 'package:cat_breed/features/breed/domain/domain.dart';

class GetPictureById implements Usecase<Picture, String> {
  final CatRepository repository;

  GetPictureById(this.repository);

  @override
  Future<Result<Picture>> call(String params) {
    return repository.getPictureById(params);
  }
}
