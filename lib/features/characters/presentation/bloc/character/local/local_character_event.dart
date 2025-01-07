part of 'local_character_bloc.dart';

sealed class LocalCharacterEvent extends Equatable {
  const LocalCharacterEvent();

  @override
  List<Object> get props => [];
}

final class GetFavoriteCharacters extends LocalCharacterEvent {}

final class SaveFavoriteCharacter extends LocalCharacterEvent {
  final CharacterEntity character;

  const SaveFavoriteCharacter(this.character);

  @override
  List<Object> get props => [character];
}

final class RemoveFavoriteCharacter extends LocalCharacterEvent {
  final CharacterEntity character;

  const RemoveFavoriteCharacter(this.character);

  @override
  List<Object> get props => [character];
}
