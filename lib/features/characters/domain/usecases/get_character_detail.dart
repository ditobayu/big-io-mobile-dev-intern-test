import 'package:adhitya/core/resources/data_state.dart';
import 'package:adhitya/core/usecases/usecase.dart';
import 'package:adhitya/features/characters/domain/entities/character.dart';
import 'package:adhitya/features/characters/domain/repository/character_repository.dart';

class GetCharacterDetailUseCase
    implements Usecase<DataState<CharacterEntity>, int> {
  final CharacterRepository _characterRepository;

  GetCharacterDetailUseCase(this._characterRepository);
  @override
  Future<DataState<CharacterEntity>> call({int? params}) {
    return _characterRepository.getCharacterDetail(
      id: params!,
    );
  }
}
