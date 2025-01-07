import 'package:adhitya/core/resources/data_state.dart';
import 'package:adhitya/features/characters/domain/entities/character.dart';
import 'package:adhitya/features/characters/domain/entities/character_list.dart';
import 'package:adhitya/features/characters/domain/entities/page_info.dart';
import 'package:adhitya/features/characters/domain/usecases/get_characters.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late GetCharactersUseCase getCharactersUseCase;
  late MockCharacterRepository mockCharacterRepository;

  setUp(() {
    mockCharacterRepository = MockCharacterRepository();
    getCharactersUseCase = GetCharactersUseCase(mockCharacterRepository);
  });

  const characterList = CharacterListEntity(
    pagination: PageInfoEntity(
      count: 1,
      pages: 1,
      next: "",
      prev: "",
    ),
    characters: [
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
    ],
  );

  const name = "character.name";
  const status = "character.status";
  const species = "character.species";
  const type = "character.type";
  const gender = "character.gender";
  const page = 1;

  test('should get characters from the repository', () async {
    // arrange
    when(
      mockCharacterRepository.getCharacters(
        name: name,
        status: status,
        species: species,
        type: type,
        gender: gender,
        page: page,
      ),
    ).thenAnswer((_) async => const DataSuccess(characterList));

    // act
    final result = await getCharactersUseCase.call(
        params: GetCharactersParams(
      name: name,
      status: status,
      species: species,
      type: type,
      gender: gender,
      page: page,
    ));

    // assert
    expect(result, const DataSuccess(characterList));
  });
}
