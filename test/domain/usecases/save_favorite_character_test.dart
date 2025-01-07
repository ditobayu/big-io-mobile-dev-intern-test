import 'package:adhitya/features/characters/domain/entities/character.dart';
import 'package:adhitya/features/characters/domain/usecases/save_favorite_character.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late SaveFavoriteCharactersUseCase saveFavoriteCharactersUseCase;
  late MockCharacterRepository mockCharacterRepository;
  late MockAppDatabase mockAppDatabase;
  late MockCharacterDao mockCharacterDao;

  setUp(() {
    mockCharacterRepository = MockCharacterRepository();
    saveFavoriteCharactersUseCase =
        SaveFavoriteCharactersUseCase(mockCharacterRepository);
    mockAppDatabase = MockAppDatabase();
    mockCharacterDao = MockCharacterDao();
    when(mockAppDatabase.characterDao).thenReturn(mockCharacterDao);
  });

  const character = CharacterEntity(
    id: 0,
    name: "character.name",
    status: "character.status",
    species: "character.species",
    type: "character.type",
    gender: "character.gender",
    locationName: "character.locationName",
    locationUrl: "character.locationUrl",
    originName: "character.originName",
    originUrl: "character.originUrl",
    image: "https://rickandmortyapi.com/api/character/avatar/2.jpeg",
    episode: ["character.episode"],
    url: "character.url",
    created: "character.created",
  );

  test('should save character to the local database', () async {
    // arrange
    when(mockCharacterRepository.saveFavoriteCharacter(
      character: character,
    )).thenAnswer((_) async => character);

    // act
    await saveFavoriteCharactersUseCase.call(params: character);

    // assert
    verify(mockCharacterRepository.saveFavoriteCharacter(
      character: character,
    )).called(1);
    verifyNoMoreInteractions(mockCharacterRepository);
  });
}
