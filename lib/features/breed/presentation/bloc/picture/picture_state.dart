part of 'picture_bloc.dart';

enum PictureStatus { initial, loading, success, failure }

final class PictureState extends Equatable {
  const PictureState({
    this.imageUrls = const {},
    this.status = PictureStatus.initial,
  });

  final Map<String, Picture> imageUrls;
  final PictureStatus status;

  PictureState copyWith({
    Map<String, Picture>? imageUrls,
    PictureStatus? status,
  }) {
    return PictureState(
      imageUrls: imageUrls ?? this.imageUrls,
      status: status ?? PictureStatus.initial,
    );
  }

  @override
  List<Object> get props => [imageUrls];
}
