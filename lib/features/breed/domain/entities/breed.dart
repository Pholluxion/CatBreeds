import 'package:equatable/equatable.dart';

import 'package:cat_breed/features/breed/domain/domain.dart';

class Breed extends Equatable {
  final String id;
  final String name;
  final String description;
  final String origin;
  final String temperament;
  final String lifeSpan;
  final Weight weight;
  final String imageRef;
  final String wikipediaUrl;
  final int isLapCat;
  final int affectionLevel;
  final int intelligence;
  final int energyLevel;
  final int childFriendly;
  final int dogFriendly;
  final int hypoallergenic;

  const Breed({
    required this.id,
    required this.name,
    required this.description,
    required this.origin,
    required this.temperament,
    required this.lifeSpan,
    required this.weight,
    required this.imageRef,
    required this.affectionLevel,
    required this.intelligence,
    required this.energyLevel,
    required this.childFriendly,
    required this.dogFriendly,
    required this.hypoallergenic,
    required this.isLapCat,
    required this.wikipediaUrl,
  });

  @override
  List<Object?> get props => [
    id,
    name,
    description,
    origin,
    temperament,
    lifeSpan,
    weight,
    imageRef,
    affectionLevel,
    intelligence,
    energyLevel,
    childFriendly,
    dogFriendly,
    hypoallergenic,
    isLapCat,
    wikipediaUrl,
  ];
}
