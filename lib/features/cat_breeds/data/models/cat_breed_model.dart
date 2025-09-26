import 'package:cat_breed/features/cat_breeds/data/data.dart';

class CatBreedModel {
  const CatBreedModel({
    required this.id,
    required this.name,
    required this.description,
    required this.origin,
    required this.temperament,
    required this.lifeSpan,
    required this.weight,
    required this.affectionLevel,
    required this.intelligence,
    required this.energyLevel,
    required this.childFriendly,
    required this.dogFriendly,
    required this.hypoallergenic,
    required this.isLapCat,
    required this.wikipediaUrl,
    required this.adaptability,
    required this.picture,
  });

  final String id;
  final String name;
  final String description;
  final String origin;
  final String temperament;
  final String lifeSpan;
  final String wikipediaUrl;
  final int isLapCat;
  final int affectionLevel;
  final int intelligence;
  final int energyLevel;
  final int childFriendly;
  final int dogFriendly;
  final int hypoallergenic;
  final int adaptability;
  final WeightModel weight;
  final PictureModel picture;

  factory CatBreedModel.fromJson(Map<String, dynamic> json) {
    return CatBreedModel(
      id: json[_idKey] ?? '',
      name: json[_nameKey] ?? '',
      description: json[_descriptionKey] ?? '',
      origin: json[_originKey] ?? '',
      temperament: json[_temperamentKey] ?? '',
      lifeSpan: json[_lifeSpanKey] ?? '',
      weight: WeightModel.fromJson(json[_weightKey] as Map<String, dynamic>),
      affectionLevel: json[_affectionLevelKey] ?? 0,
      intelligence: json[_intelligenceKey] ?? 0,
      energyLevel: json[_energyLevelKey] ?? 0,
      childFriendly: json[_childFriendlyKey] ?? 0,
      dogFriendly: json[_dogFriendlyKey] ?? 0,
      hypoallergenic: json[_hypoallergenicKey] ?? 0,
      isLapCat: json[_isLapCatKey] ?? 0,
      wikipediaUrl: json[_wikipediaUrlKey] ?? '',
      adaptability: json[_adaptabilityKey] ?? 0,
      picture: PictureModel.fromJson(
        json[_pictureKey] as Map<String, dynamic>? ?? <String, dynamic>{},
      ),
    );
  }

  static const _idKey = 'id';
  static const _nameKey = 'name';
  static const _descriptionKey = 'description';
  static const _originKey = 'origin';
  static const _temperamentKey = 'temperament';
  static const _lifeSpanKey = 'life_span';
  static const _weightKey = 'weight';
  static const _affectionLevelKey = 'affection_level';
  static const _intelligenceKey = 'intelligence';
  static const _energyLevelKey = 'energy_level';
  static const _childFriendlyKey = 'child_friendly';
  static const _dogFriendlyKey = 'dog_friendly';
  static const _hypoallergenicKey = 'hypoallergenic';
  static const _isLapCatKey = 'lap';
  static const _wikipediaUrlKey = 'wikipedia_url';
  static const _adaptabilityKey = 'adaptability';
  static const _pictureKey = 'image';
}
