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
    : super(const CatBreedLoadedState()) {
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
    if (state is CatBreedLoadingState || !state.hasMore) return;

    if (state.breeds.isEmpty) emit(const CatBreedLoadingState());

    const limit = 10;
    final count = state.breeds.length;
    final page = (count / limit).ceil();

    final breeds = await _getPaginatedBreeds((page: page, limit: limit));

    breeds.fold(
      (failure) => _onFailure(emit),
      (fetchedBreeds) => _onSuccess(emit, fetchedBreeds),
    );
  }

  void _onSearchBreeds(
    SearchBreedsEvent event,
    Emitter<CatBreedState> emit,
  ) async {
    if (event.query.isEmpty) {
      emit(const CatBreedLoadedState());
      add(const LoadBreedsEvent());
      return;
    }

    emit(const CatBreedLoadingState());

    final result = await _getBreedsByQuery(event.query);

    result.fold(
      (failure) => _onFailure(emit),
      (breeds) => _onSearchSuccess(emit, breeds),
    );
  }

  void _onFailure(Emitter<CatBreedState> emit) =>
      emit(const CatBreedLoadError());

  void _onSearchSuccess(
    Emitter<CatBreedState> emit,
    List<CatBreedEntity> breeds,
  ) {
    if (breeds.isEmpty) {
      emit(const CatBreedEmptyState());
      return;
    }
    emit(CatBreedLoadedState(breeds: breeds));
  }

  void _onSuccess(Emitter<CatBreedState> emit, List<CatBreedEntity> breeds) {
    if (breeds.isEmpty) {
      emit(CatBreedLoadedState(breeds: state.breeds, hasMore: false));
      return;
    }
    emit(CatBreedLoadedState(breeds: [...state.breeds, ...breeds]));
  }
}
