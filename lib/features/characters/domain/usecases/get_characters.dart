import 'package:adhitya/core/resources/data_state.dart';
import 'package:adhitya/core/usecases/usecase.dart';
import 'package:adhitya/features/characters/domain/entities/character_list.dart';
import 'package:adhitya/features/characters/domain/repository/character_repository.dart';

class GetCharactersUseCase
    implements Usecase<DataState<CharacterListEntity>, GetCharactersParams> {
  final CharacterRepository _characterRepository;

  GetCharactersUseCase(this._characterRepository);
  @override
  Future<DataState<CharacterListEntity>> call({GetCharactersParams? params}) {
    return _characterRepository.getCharacters(
      gender: params!.gender,
      name: params.name,
      species: params.species,
      status: params.status,
      type: params.type,
      page: params.page,
    );
  }
}

class GetCharactersParams {
  final String? name;
  final String? status;
  final String? species;
  final String? type;
  final String? gender;
  final int? page;
  GetCharactersParams(
      {this.name,
      this.status,
      this.species,
      this.type,
      this.gender,
      this.page});
}
