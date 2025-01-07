import 'package:adhitya/features/characters/data/data_sources/local/app_database.dart';
import 'package:adhitya/features/characters/data/data_sources/remote/character_api_service.dart';
import 'package:adhitya/features/characters/domain/repository/character_repository.dart';
import 'package:adhitya/features/characters/domain/usecases/get_characters.dart';
import 'package:dio/dio.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks(
  [CharacterRepository, CharacterApiService, AppDatabase, GetCharactersUseCase],
  customMocks: [MockSpec<Dio>(as: #MockDioClient)],
)
void main() {}
