part of 'cat_breed_bloc.dart';

sealed class CatBreedState {
  final List<CatBreedEntity> breeds;
  final bool hasMore;

  const CatBreedState({this.breeds = const [], this.hasMore = true});
}

final class CatBreedLoadingState extends CatBreedState {
  const CatBreedLoadingState();
}

final class CatBreedLoadedState extends CatBreedState {
  const CatBreedLoadedState({super.breeds, super.hasMore = true});
}

final class CatBreedLoadError extends CatBreedState {
  const CatBreedLoadError();
}

final class CatBreedEmptyState extends CatBreedState {
  const CatBreedEmptyState();
}
