import 'package:cat_breed/features/cat_breeds/domain/domain.dart';

class CatBreedEntity {
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
  final WeightDTO weight;
  final PictureDTO picture;

  const CatBreedEntity({
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
}
