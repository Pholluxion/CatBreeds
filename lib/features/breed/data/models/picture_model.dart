import 'package:cat_breed/features/breed/domain/domain.dart';

class PictureModel extends Picture {
  PictureModel({required super.url, required super.id});

  factory PictureModel.fromJson(Map<String, dynamic> json) {
    return PictureModel(url: json['url'] as String, id: json['id'] as String);
  }
}
