part of 'breed_bloc.dart';

sealed class BreedEvent extends Equatable {
  const BreedEvent();

  @override
  List<Object> get props => [];
}

final class LoadBreeds extends BreedEvent {}
