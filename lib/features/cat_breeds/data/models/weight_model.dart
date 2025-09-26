class WeightModel {
  WeightModel({required this.imperial, required this.metric});

  final String imperial;
  final String metric;

  factory WeightModel.fromJson(Map<String, dynamic> json) {
    return WeightModel(
      imperial: json['imperial'] as String,
      metric: json['metric'] as String,
    );
  }
}
