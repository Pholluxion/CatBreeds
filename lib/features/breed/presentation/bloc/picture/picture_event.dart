part of 'picture_bloc.dart';

sealed class PictureEvent extends Equatable {
  const PictureEvent();

  @override
  List<Object> get props => [];
}

final class LoadPicture extends PictureEvent {
  final String imageId;

  const LoadPicture(this.imageId);

  @override
  List<Object> get props => [imageId];
}
