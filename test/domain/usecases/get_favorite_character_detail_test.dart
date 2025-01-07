import 'package:adhitya/features/characters/domain/entities/character.dart';
import 'package:adhitya/features/characters/domain/usecases/get_favorite_character_detail.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late GetFavoriteCharacterDetailUseCase getFavoriteCharacterDetailUseCase;
  late MockCharacterRepository mockCharacterRepository;
  late MockAppDatabase mockAppDatabase;
  late MockCharacterDao mockCharacterDao;

  setUp(() {
    mockCharacterRepository = MockCharacterRepository();
    getFavoriteCharacterDetailUseCase =
        GetFavoriteCharacterDetailUseCase(mockCharacterRepository);
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

  const id = 0;
  test('should get favorite character detail from the local database',
      () async {
    // arrange
    when(mockCharacterRepository.getFavoriteCharacterDetail(id: id))
        .thenAnswer((_) async => character);

    // act
    final result = await getFavoriteCharacterDetailUseCase.call(
      params: id,
    );

    // assert
    expect(result, equals(character));
    verify(mockCharacterRepository.getFavoriteCharacterDetail(id: id))
        .called(1);
    verifyNoMoreInteractions(mockCharacterRepository);
  });
}
