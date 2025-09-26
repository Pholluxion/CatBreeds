part of 'cat_breed_bloc.dart';

sealed class CatBreedEvent {
  const CatBreedEvent();
}

final class LoadBreedsEvent extends CatBreedEvent {
  const LoadBreedsEvent();
}

final class SearchBreedsEvent extends CatBreedEvent {
  final String query;

  const SearchBreedsEvent(this.query);
}
