import 'package:cat_breed/features/cat_breeds/data/models/cat_breed_model.dart';
import 'package:cat_breed/features/cat_breeds/data/models/picture_model.dart';
import 'package:cat_breed/features/cat_breeds/data/models/weight_model.dart';
import 'package:cat_breed/features/cat_breeds/domain/entities/cat_breed_entity.dart';
import 'package:cat_breed/features/cat_breeds/domain/entities/dto/picture_dto.dart';
import 'package:cat_breed/features/cat_breeds/domain/entities/dto/weight_dto.dart';

abstract class CatBreedMapper {
  static CatBreedEntity toEntity(CatBreedModel model) {
    return CatBreedEntity(
      id: model.id,
      name: model.name,
      description: model.description,
      origin: model.origin,
      temperament: model.temperament,
      lifeSpan: model.lifeSpan,
      weight: WeightMapper.toDTO(model.weight),
      affectionLevel: model.affectionLevel,
      intelligence: model.intelligence,
      energyLevel: model.energyLevel,
      childFriendly: model.childFriendly,
      dogFriendly: model.dogFriendly,
      hypoallergenic: model.hypoallergenic,
      isLapCat: model.isLapCat,
      wikipediaUrl: model.wikipediaUrl,
      adaptability: model.adaptability,
      picture: PictureMapper.toDTO(model.picture),
    );
  }
}

abstract class WeightMapper {
  static WeightDTO toDTO(WeightModel model) {
    return WeightDTO(imperial: model.imperial, metric: model.metric);
  }
}

abstract class PictureMapper {
  static PictureDTO toDTO(PictureModel model) {
    return PictureDTO(id: model.id, url: model.url);
  }
}
