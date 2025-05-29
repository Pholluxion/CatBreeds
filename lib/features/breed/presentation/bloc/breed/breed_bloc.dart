import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:stream_transform/stream_transform.dart';

import 'package:cat_breed/features/breed/domain/domain.dart';

part 'breed_event.dart';
part 'breed_state.dart';

const throttleDuration = Duration(milliseconds: 100);

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

class BreedBloc extends Bloc<BreedEvent, BreedState> {
  final GetPaginatedBreeds _getPaginatedBreeds;

  BreedBloc(this._getPaginatedBreeds) : super(BreedState()) {
    on<LoadBreeds>(
      _onLoadBreeds,
      transformer: throttleDroppable(throttleDuration),
    );
  }

  void _onLoadBreeds(BreedEvent event, Emitter<BreedState> emit) async {
    if (state.hasReachedMax) return;

    try {
      if (state.status == BreedStatus.initial) {
        emit(state.copyWith(status: BreedStatus.loading));
      }

      final breeds = await _getPaginatedBreeds.call({
        'page': (state.breeds.length / 10).ceil(),
        'limit': 10,
      });

      breeds.fold(
        (failure) => emit(state.copyWith(status: BreedStatus.failure)),
        (fetchedBreeds) {
          if (fetchedBreeds.isEmpty) {
            return emit(state.copyWith(hasReachedMax: true));
          }

          final updatedBreeds = List<Breed>.from(state.breeds)
            ..addAll(fetchedBreeds);
          emit(
            state.copyWith(
              status: BreedStatus.success,
              breeds: updatedBreeds,
              hasReachedMax: fetchedBreeds.isEmpty,
            ),
          );
        },
      );
    } catch (_) {
      emit(state.copyWith(status: BreedStatus.failure));
    }
  }
}
