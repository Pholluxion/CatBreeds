import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:stream_transform/stream_transform.dart';

import 'package:cat_breed/features/breed/domain/domain.dart';

part 'breed_event.dart';
part 'breed_state.dart';

const throttleDuration = Duration(milliseconds: 100);
const debounceDuration = Duration(milliseconds: 500);

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

EventTransformer<E> debounceDroppable<E>(Duration duration) {
  return (events, mapper) {
    return events.debounce(duration).switchMap(mapper);
  };
}

class BreedBloc extends Bloc<BreedEvent, BreedState> {
  final GetPaginatedBreeds _getPaginatedBreeds;
  final GetBreedsByQuery _getBreedsByQuery;

  BreedBloc(this._getPaginatedBreeds, this._getBreedsByQuery)
    : super(BreedState()) {
    on<LoadBreeds>(
      _onLoadBreeds,
      transformer: throttleDroppable(throttleDuration),
    );
    on<SearchBreeds>(
      _onSearchBreeds,
      transformer: debounceDroppable(debounceDuration),
    );
  }

  void _onLoadBreeds(LoadBreeds event, Emitter<BreedState> emit) async {
    if (state.hasReachedMax) return;

    if (state.status == BreedStatus.initial) {
      emit(state.copyWith(status: BreedStatus.loading));
    }

    final breeds = await _getPaginatedBreeds(
      Paginated(page: (state.breeds.length / 10).ceil(), limit: 10),
    );

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
  }

  void _onSearchBreeds(SearchBreeds event, Emitter<BreedState> emit) async {
    final query = event.query.trim();

    if (query.isEmpty) {
      emit(BreedState());
      add(LoadBreeds());
      return;
    }

    emit(state.copyWith(status: BreedStatus.loading));

    final result = await _getBreedsByQuery(query);

    result.fold(
      (failure) => emit(state.copyWith(status: BreedStatus.failure)),
      (breeds) {
        emit(state.copyWith(status: BreedStatus.success, breeds: breeds));
      },
    );
  }
}
