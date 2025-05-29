part of 'breed_bloc.dart';

enum BreedStatus { initial, loading, success, failure }

final class BreedState extends Equatable {
  const BreedState({
    this.status = BreedStatus.initial,
    this.breeds = const <Breed>[],
    this.hasReachedMax = false,
  });

  final BreedStatus status;
  final List<Breed> breeds;
  final bool hasReachedMax;

  BreedState copyWith({
    BreedStatus? status,
    List<Breed>? breeds,
    bool? hasReachedMax,
  }) {
    return BreedState(
      status: status ?? this.status,
      breeds: breeds ?? this.breeds,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  List<Object> get props => [status, breeds, hasReachedMax];
}
