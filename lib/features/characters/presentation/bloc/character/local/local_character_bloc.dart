import 'package:adhitya/features/characters/domain/entities/character.dart';
import 'package:adhitya/features/characters/domain/usecases/delete_favorite_character.dart';
import 'package:adhitya/features/characters/domain/usecases/get_favorite_characters.dart';
import 'package:adhitya/features/characters/domain/usecases/save_favorite_character.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'local_character_event.dart';
part 'local_character_state.dart';

class LocalCharacterBloc
    extends Bloc<LocalCharacterEvent, LocalCharacterState> {
  final GetFavoriteCharactersUseCase getFavoriteCharactersUseCase;
  final SaveFavoriteCharactersUseCase saveFavoriteCharactersUseCase;
  final DeleteFavoriteCharactersUseCase deleteFavoriteCharactersUseCase;
  LocalCharacterBloc(
    this.getFavoriteCharactersUseCase,
    this.saveFavoriteCharactersUseCase,
    this.deleteFavoriteCharactersUseCase,
  ) : super(LocalCharacterInitial()) {
    on<GetFavoriteCharacters>(onGetFavoriteCharacters);
    on<SaveFavoriteCharacter>(onSaveFavoriteCharacter);
    on<RemoveFavoriteCharacter>(onRemoveFavoriteCharacter);
  }

  void onGetFavoriteCharacters(
      GetFavoriteCharacters event, Emitter<LocalCharacterState> emit) async {
    emit(LocalCharacterLoading());
    final characters = await getFavoriteCharactersUseCase();
    emit(LocalCharacterLoaded(characters));
  }

  void onSaveFavoriteCharacter(
      SaveFavoriteCharacter event, Emitter<LocalCharacterState> emit) async {
    emit(LocalCharacterLoading());
    await saveFavoriteCharactersUseCase(params: event.character);
    final characters = await getFavoriteCharactersUseCase();
    emit(LocalCharacterLoaded(characters));
  }

  void onRemoveFavoriteCharacter(
      RemoveFavoriteCharacter event, Emitter<LocalCharacterState> emit) async {
    emit(LocalCharacterLoading());
    await deleteFavoriteCharactersUseCase(params: event.character);
    final characters = await getFavoriteCharactersUseCase();
    emit(LocalCharacterLoaded(characters));
  }
}
