import 'package:cat_breed/features/cat_breeds/domain/domain.dart';

class PictureModel extends PictureDTO {
  PictureModel({required super.url, required super.id});

  factory PictureModel.fromJson(Map<String, dynamic> json) {
    return PictureModel(
      url: json['url'] as String? ?? '',
      id: json['id'] as String? ?? '',
    );
  }
}
