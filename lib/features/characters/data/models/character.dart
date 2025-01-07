import 'package:adhitya/core/util/string_list_converter.dart';
import 'package:adhitya/features/characters/domain/entities/character.dart';
import 'package:floor/floor.dart';

@Entity(tableName: 'characters', primaryKeys: ['id'])
@TypeConverters([StringListConverter])
class CharacterModel extends CharacterEntity {
  const CharacterModel({
    super.id,
    super.name,
    super.status,
    super.species,
    super.type,
    super.gender,
    super.locationName,
    super.locationUrl,
    super.originName,
    super.originUrl,
    super.image,
    super.episode,
    super.url,
    super.created,
  });

  factory CharacterModel.fromJson(Map<String, dynamic> json) {
    return CharacterModel(
      id: json['id'],
      name: json['name'],
      status: json['status'],
      species: json['species'],
      type: json['type'],
      gender: json['gender'],
      locationName: json['location']['name'],
      locationUrl: json['location']['url'],
      originName: json['origin']['name'],
      originUrl: json['origin']['url'],
      image: json['image'],
      episode: List<String>.from(json['episode']),
      url: json['url'],
      created: json['created'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'status': status,
      'species': species,
      'type': type,
      'gender': gender,
      'location': {
        'name': locationName,
        'url': locationUrl,
      },
      'origin': {
        'name': originName,
        'url': originUrl,
      },
      'image': image,
      'episode': episode,
      'url': url,
      'created': created,
    };
  }

  factory CharacterModel.fromEntity(CharacterEntity entity) {
    return CharacterModel(
      id: entity.id,
      name: entity.name,
      status: entity.status,
      species: entity.species,
      type: entity.type,
      gender: entity.gender,
      locationName: entity.locationName,
      locationUrl: entity.locationUrl,
      originName: entity.originName,
      originUrl: entity.originUrl,
      image: entity.image,
      episode: entity.episode,
      url: entity.url,
      created: entity.created,
    );
  }
}
