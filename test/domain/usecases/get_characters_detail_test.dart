import 'package:adhitya/core/resources/data_state.dart';
import 'package:adhitya/features/characters/domain/entities/character.dart';
import 'package:adhitya/features/characters/domain/usecases/get_character_detail.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late GetCharacterDetailUseCase getCharacterDetailUseCase;
  late MockCharacterRepository mockCharacterRepository;

  setUp(() {
    mockCharacterRepository = MockCharacterRepository();
    getCharacterDetailUseCase =
        GetCharacterDetailUseCase(mockCharacterRepository);
  });

  const characterDetail = CharacterEntity(
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
    isFavorite: false,
  );

  const id = 0;

  test('should get character detail from the repository', () async {
    // arrange
    when(
      mockCharacterRepository.getCharacterDetail(
        id: id,
      ),
    ).thenAnswer((_) async => const DataSuccess(characterDetail));

    // act
    final result = await getCharacterDetailUseCase.call(
      params: id,
    );

    // assert
    expect(result, const DataSuccess(characterDetail));
  });
}
