import 'package:adhitya/features/characters/domain/entities/character.dart';
import 'package:adhitya/core/resources/data_state.dart';
import 'package:adhitya/features/characters/domain/entities/character_list.dart';

abstract class CharacterRepository {
  Future<DataState<CharacterListEntity>> getCharacters(
      {String? name,
      String? status,
      String? species,
      String? type,
      String? gender,
      int? page});
  Future<DataState<CharacterEntity>> getCharacterDetail({required int id});
  Future<List<CharacterEntity>> getFavoriteCharacters();
  Future<CharacterEntity?> getFavoriteCharacterDetail({required int id});
  Future<void> saveFavoriteCharacter({required CharacterEntity character});
  Future<void> deleteFavoriteCharacter({required CharacterEntity character});
}
