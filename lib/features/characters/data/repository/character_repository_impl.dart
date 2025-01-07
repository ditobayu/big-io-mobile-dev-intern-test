import 'package:adhitya/core/resources/data_state.dart';
import 'package:adhitya/features/characters/data/data_sources/local/app_database.dart';
import 'package:adhitya/features/characters/data/data_sources/remote/character_api_service.dart';
import 'package:adhitya/features/characters/data/models/character.dart';
import 'package:adhitya/features/characters/data/models/character_list.dart';
import 'package:adhitya/features/characters/domain/entities/character.dart';
import 'package:adhitya/features/characters/domain/repository/character_repository.dart';
import 'package:dio/dio.dart';

class CharacterRepositoryImpl extends CharacterRepository {
  final CharacterApiService _characterApiService;
  final AppDatabase _appDatabase;

  CharacterRepositoryImpl(this._characterApiService, this._appDatabase);

  @override
  Future<DataState<CharacterListModel>> getCharacters(
      {String? name,
      String? status,
      String? species,
      String? type,
      String? gender,
      int? page}) async {
    try {
      final response = await _characterApiService.getCharacters(
        name: name,
        status: status,
        species: species,
        type: type,
        gender: gender,
        page: page,
      );

      if (response.response.statusCode == 200) {
        return DataSuccess(response.data);
      } else {
        return DataFailed(DioException(
            response: response.response,
            requestOptions: response.response.requestOptions,
            error: response.response.statusMessage,
            type: DioExceptionType.badResponse));
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<DataState<CharacterEntity>> getCharacterDetail({required int id}) {
    try {
      return _characterApiService.getCharacterDetail(id: id).then((response) {
        if (response.response.statusCode == 200) {
          return DataSuccess(response.data);
        } else {
          return DataFailed(DioException(
              response: response.response,
              requestOptions: response.response.requestOptions,
              error: response.response.statusMessage,
              type: DioExceptionType.badResponse));
        }
      });
    } on DioException catch (e) {
      return Future.value(DataFailed(e));
    }
  }

  @override
  Future<List<CharacterModel>> getFavoriteCharacters() {
    return _appDatabase.characterDao.getAllCharacters();
  }

  @override
  Future<void> saveFavoriteCharacter({required CharacterEntity character}) {
    return _appDatabase.characterDao
        .insertCharacter(CharacterModel.fromEntity(character));
  }

  @override
  Future<void> deleteFavoriteCharacter({required CharacterEntity character}) {
    return _appDatabase.characterDao
        .deleteCharacter(CharacterModel.fromEntity(character));
  }

  @override
  Future<CharacterModel?> getFavoriteCharacterDetail({required int id}) {
    return _appDatabase.characterDao.getCharacterById(id);
  }
}
