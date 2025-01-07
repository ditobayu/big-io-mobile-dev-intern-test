import 'package:adhitya/core/usecases/usecase.dart';
import 'package:adhitya/features/characters/domain/entities/character.dart';
import 'package:adhitya/features/characters/domain/repository/character_repository.dart';

class GetFavoriteCharacterDetailUseCase
    implements Usecase<CharacterEntity?, int> {
  final CharacterRepository _characterRepository;

  GetFavoriteCharacterDetailUseCase(this._characterRepository);
  @override
  Future<CharacterEntity?> call({int? params}) {
    return _characterRepository.getFavoriteCharacterDetail(
      id: params!,
    );
  }
}
