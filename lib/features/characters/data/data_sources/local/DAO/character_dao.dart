import 'package:adhitya/features/characters/data/models/character.dart';
import 'package:floor/floor.dart';

@dao
abstract class CharacterDao {
  @Insert()
  Future<void> insertCharacter(CharacterModel character);

  @Query('SELECT * FROM characters')
  Future<List<CharacterModel>> getAllCharacters();

  @Query('SELECT * FROM characters WHERE id = :id')
  Future<CharacterModel?> getCharacterById(int id);

  @delete
  Future<void> deleteCharacter(CharacterModel character);
}
