import 'package:cat_breed/features/breed/data/data.dart';
import 'package:cat_breed/features/breed/domain/domain.dart';

class BreedModel extends Breed {
  const BreedModel({
    required super.id,
    required super.name,
    required super.description,
    required super.origin,
    required super.temperament,
    required super.lifeSpan,
    required super.weight,
    required super.imageRef,
    required super.affectionLevel,
    required super.intelligence,
    required super.energyLevel,
    required super.childFriendly,
    required super.dogFriendly,
    required super.hypoallergenic,
    required super.isLapCat,
    required super.wikipediaUrl,
    required super.adaptability,
  });

  factory BreedModel.fromJson(Map<String, dynamic> json) {
    return BreedModel(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      origin: json['origin'] as String,
      temperament: json['temperament'] as String,
      lifeSpan: json['life_span'] as String,
      weight: WeightModel.fromJson(json['weight'] as Map<String, dynamic>),
      imageRef: json['reference_image_id'] as String? ?? '',
      affectionLevel: (json['affection_level'] as num).toInt(),
      intelligence: (json['intelligence'] as num).toInt(),
      energyLevel: (json['energy_level'] as num).toInt(),
      childFriendly: (json['child_friendly'] as num).toInt(),
      dogFriendly: (json['dog_friendly'] as num).toInt(),
      hypoallergenic: (json['hypoallergenic'] as num).toInt(),
      isLapCat: (json['lap'] as int?) ?? 0,
      wikipediaUrl: json['wikipedia_url'] as String? ?? '',
      adaptability: (json['adaptability'] as num).toInt(),
    );
  }
}
