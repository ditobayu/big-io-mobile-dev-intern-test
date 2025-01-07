import 'package:adhitya/core/usecases/usecase.dart';
import 'package:adhitya/features/characters/domain/entities/character.dart';
import 'package:adhitya/features/characters/domain/repository/character_repository.dart';

class GetFavoriteCharactersUseCase
    implements Usecase<List<CharacterEntity>, void> {
  final CharacterRepository _characterRepository;

  GetFavoriteCharactersUseCase(this._characterRepository);
  @override
  Future<List<CharacterEntity>> call({void params}) {
    return _characterRepository.getFavoriteCharacters();
  }
}
