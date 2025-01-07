import 'package:adhitya/core/resources/data_state.dart';
import 'package:adhitya/features/characters/domain/entities/character.dart';
import 'package:adhitya/features/characters/domain/entities/character_list.dart';
import 'package:adhitya/features/characters/domain/usecases/get_characters.dart';
import 'package:adhitya/features/characters/domain/usecases/get_favorite_characters.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

part 'remote_character_event.dart';
part 'remote_character_state.dart';

class RemoteCharacterBloc
    extends Bloc<RemoteCharacterEvent, RemoteCharacterState> {
  final GetCharactersUseCase getCharactersUseCase;
  final GetFavoriteCharactersUseCase getFavoriteCharactersUseCase;
  RemoteCharacterBloc(
      this.getCharactersUseCase, this.getFavoriteCharactersUseCase)
      : super(RemoteCharacterInitial()) {
    on<GetRemoteCharacters>(onGetRemoteCharacters);
  }

  void onGetRemoteCharacters(
      GetRemoteCharacters event, Emitter<RemoteCharacterState> emit) async {
    emit(RemoteCharacterLoading());
    final result = await getCharactersUseCase(
        params: GetCharactersParams(
            name: event.name,
            status: event.status,
            species: event.species,
            type: event.type,
            gender: event.gender,
            page: event.page));

    if (result is DataSuccess) {
      final favoriteCharacters = await getFavoriteCharactersUseCase();

      final updatedCharacters = result.data!.characters.map((character) {
        final isFavorite =
            favoriteCharacters.any((favChar) => favChar.id == character.id);
        return CharacterEntity(
          id: character.id,
          name: character.name,
          status: character.status,
          species: character.species,
          type: character.type,
          gender: character.gender,
          locationName: character.locationName,
          locationUrl: character.locationUrl,
          originName: character.originName,
          originUrl: character.originUrl,
          image: character.image,
          episode: character.episode,
          url: character.url,
          created: character.created,
          isFavorite: isFavorite,
        );
      }).toList();
      CharacterListEntity updatedCharacterList = CharacterListEntity(
          characters: updatedCharacters, pagination: result.data!.pagination);
      emit(RemoteCharacterLoaded(updatedCharacterList));
    } else if (result is DataFailed) {
      emit(RemoteCharacterError(result.error!));
    }
  }
}
