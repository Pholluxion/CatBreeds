part of 'cat_breed_bloc.dart';

sealed class CatBreedState {
  final List<CatBreedEntity> breeds;
  final bool hasReachedMax;

  const CatBreedState({this.breeds = const [], this.hasReachedMax = false});
}

final class CatBreedLoadingState extends CatBreedState {
  const CatBreedLoadingState();
}

final class CatBreedLoadedState extends CatBreedState {
  const CatBreedLoadedState({super.breeds, super.hasReachedMax});
}

final class CatBreedLoadError extends CatBreedState {
  const CatBreedLoadError();
}
