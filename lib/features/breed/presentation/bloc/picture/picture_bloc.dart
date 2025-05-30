import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:cat_breed/features/breed/breed.dart';

part 'picture_event.dart';
part 'picture_state.dart';

class PictureBloc extends Bloc<PictureEvent, PictureState> {
  final GetPictureById _getPictureById;

  PictureBloc(this._getPictureById) : super(PictureState()) {
    on<LoadPicture>(_onLoadPicture);
  }

  void _onLoadPicture(LoadPicture event, Emitter<PictureState> emit) async {
    if (state.imageUrls.containsKey(event.imageId)) {
      emit(state.copyWith(status: PictureStatus.success));
      return;
    }

    final picture = await _getPictureById(event.imageId);
    picture.fold(
      (failure) => emit(state.copyWith(status: PictureStatus.failure)),
      (fetchedPicture) {
        final updatedImageUrls = Map<String, Picture>.from(state.imageUrls)
          ..[event.imageId] = fetchedPicture;
        emit(
          state.copyWith(
            status: PictureStatus.success,
            imageUrls: updatedImageUrls,
          ),
        );
      },
    );
  }
}
