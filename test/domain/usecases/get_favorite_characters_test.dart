import 'package:adhitya/features/characters/data/models/character.dart';
import 'package:adhitya/features/characters/domain/entities/character.dart';
import 'package:adhitya/features/characters/domain/usecases/get_favorite_characters.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late GetFavoriteCharactersUseCase getFavoriteCharactersUseCase;
  late MockCharacterRepository mockCharacterRepository;
  late MockAppDatabase mockAppDatabase;
  late MockCharacterDao mockCharacterDao;

  setUp(() {
    mockCharacterRepository = MockCharacterRepository();
    getFavoriteCharactersUseCase =
        GetFavoriteCharactersUseCase(mockCharacterRepository);
    mockAppDatabase = MockAppDatabase();
    mockCharacterDao = MockCharacterDao();
    when(mockAppDatabase.characterDao).thenReturn(mockCharacterDao);
  });

  const characterList = [
    CharacterEntity(
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
    )
  ];

  test('should get characters from the local database', () async {
    final tCharacters =
        characterList.map((e) => CharacterModel.fromEntity(e)).toList();
    // arrange
    when(mockCharacterRepository.getFavoriteCharacters())
        .thenAnswer((_) async => tCharacters);

    // act
    final result = await getFavoriteCharactersUseCase.call();

    // assert
    expect(result, equals(tCharacters));
    verify(mockCharacterRepository.getFavoriteCharacters()).called(1);
    verifyNoMoreInteractions(mockCharacterRepository);
  });
}
