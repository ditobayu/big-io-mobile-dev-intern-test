part of 'local_character_bloc.dart';

sealed class LocalCharacterState extends Equatable {
  const LocalCharacterState();

  @override
  List<Object> get props => [];
}

final class LocalCharacterInitial extends LocalCharacterState {}

final class LocalCharacterLoading extends LocalCharacterState {}

final class LocalCharacterLoaded extends LocalCharacterState {
  final List<CharacterEntity> characters;

  const LocalCharacterLoaded(this.characters);

  @override
  List<Object> get props => [characters];
}

final class LocalCharacterError extends LocalCharacterState {
  final String message;

  const LocalCharacterError(this.message);

  @override
  List<Object> get props => [message];
}
