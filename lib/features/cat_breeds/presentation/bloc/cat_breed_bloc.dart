import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:stream_transform/stream_transform.dart';

import 'package:cat_breed/features/cat_breeds/domain/domain.dart';

part 'cat_breed_event.dart';
part 'cat_breed_state.dart';

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

class CatBreedBloc extends Bloc<CatBreedEvent, CatBreedState> {
  final GetAllCatBreeds _getPaginatedBreeds;
  final SearchCatBreeds _getBreedsByQuery;

  CatBreedBloc(this._getPaginatedBreeds, this._getBreedsByQuery)
    : super(CatBreedLoadedState()) {
    on<LoadBreedsEvent>(
      _onLoadBreeds,
      transformer: throttleDroppable(throttleDuration),
    );
    on<SearchBreedsEvent>(
      _onSearchBreeds,
      transformer: debounceDroppable(debounceDuration),
    );
  }

  void _onLoadBreeds(LoadBreedsEvent event, Emitter<CatBreedState> emit) async {
    if (state.breeds.isNotEmpty) {
      if (state.hasReachedMax) return;
    }

    if (state.breeds.isEmpty) emit(CatBreedLoadingState());

    const limit = 10;
    final count = state.breeds.length;
    final page = (count / limit).ceil();

    final breeds = await _getPaginatedBreeds((page: page, limit: limit));

    breeds.fold((failure) => emit(CatBreedLoadError()), (fetchedBreeds) {
      if (fetchedBreeds.isEmpty) {
        return emit(
          CatBreedLoadedState(breeds: state.breeds, hasReachedMax: true),
        );
      }

      final updatedBreeds = [...state.breeds, ...fetchedBreeds];

      emit(CatBreedLoadedState(breeds: updatedBreeds, hasReachedMax: false));
    });
  }

  void _onSearchBreeds(
    SearchBreedsEvent event,
    Emitter<CatBreedState> emit,
  ) async {
    final query = event.query.trim();

    if (query.isEmpty) {
      emit(CatBreedLoadedState());
      add(LoadBreedsEvent());
      return;
    }

    emit(CatBreedLoadingState());

    final result = await _getBreedsByQuery(query);

    result.fold((failure) => emit(CatBreedLoadError()), (breeds) {
      emit(CatBreedLoadedState(breeds: breeds));
    });
  }
}
