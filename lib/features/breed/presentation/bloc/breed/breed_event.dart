part of 'breed_bloc.dart';

sealed class BreedEvent extends Equatable {
  const BreedEvent();

  @override
  List<Object> get props => [];
}

final class LoadBreeds extends BreedEvent {}

final class SearchBreeds extends BreedEvent {
  final String query;

  const SearchBreeds(this.query);

  @override
  List<Object> get props => [query];
}
