import 'package:cat_breed/features/cat_breeds/domain/domain.dart';

class WeightModel extends WeightDTO {
  WeightModel({required super.imperial, required super.metric});

  factory WeightModel.fromJson(Map<String, dynamic> json) {
    return WeightModel(
      imperial: json['imperial'] as String,
      metric: json['metric'] as String,
    );
  }
}
