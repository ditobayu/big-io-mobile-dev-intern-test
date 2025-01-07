import 'package:adhitya/core/usecases/usecase.dart';
import 'package:adhitya/features/characters/domain/entities/character.dart';
import 'package:adhitya/features/characters/domain/repository/character_repository.dart';

class DeleteFavoriteCharactersUseCase
    implements Usecase<void, CharacterEntity> {
  final CharacterRepository _characterRepository;

  DeleteFavoriteCharactersUseCase(this._characterRepository);
  @override
  Future<void> call({CharacterEntity? params}) {
    return _characterRepository.deleteFavoriteCharacter(
      character: params!,
    );
  }
}
