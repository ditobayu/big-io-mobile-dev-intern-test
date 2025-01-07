import 'package:adhitya/features/characters/data/models/character.dart';
import 'package:adhitya/features/characters/data/models/page_info.dart';
import 'package:adhitya/features/characters/domain/entities/character_list.dart';

class CharacterListModel extends CharacterListEntity {
  const CharacterListModel({
    required super.characters,
    required super.pagination,
  });

  factory CharacterListModel.fromJson(Map<String, dynamic> json) {
    return CharacterListModel(
      characters: List<CharacterModel>.from(
          json['results'].map((x) => CharacterModel.fromJson(x))),
      pagination: PageInfoModel.fromJson(json['info']),
    );
  }
}
