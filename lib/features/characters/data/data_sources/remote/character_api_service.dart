import 'package:adhitya/core/constants/constants.dart';
import 'package:adhitya/features/characters/data/models/character.dart';
import 'package:adhitya/features/characters/data/models/character_list.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'character_api_service.g.dart';

@RestApi(baseUrl: rickAndMortyApiBaseUrl)
abstract interface class CharacterApiService {
  factory CharacterApiService(Dio dio) = _CharacterApiService;

  @GET('/character')
  Future<HttpResponse<CharacterListModel>> getCharacters({
    @Query('name') String? name,
    @Query('status') String? status,
    @Query('species') String? species,
    @Query('type') String? type,
    @Query('gender') String? gender,
    @Query('page') int? page,
  });

  @GET('/character/{id}')
  Future<HttpResponse<CharacterModel>> getCharacterDetail({
    @Path('id') required int id,
  });
}
