part of 'local_character_detail_bloc.dart';

sealed class LocalCharacterDetailState extends Equatable {
  const LocalCharacterDetailState();

  @override
  List<Object> get props => [];
}

final class LocalCharacterDetailInitial extends LocalCharacterDetailState {}

final class LocalCharacterDetailLoading extends LocalCharacterDetailState {}

final class LocalCharacterDetailLoaded extends LocalCharacterDetailState {
  final CharacterEntity character;

  const LocalCharacterDetailLoaded(this.character);

  @override
  List<Object> get props => [character];
}

final class LocalCharacterDetailError extends LocalCharacterDetailState {
  final String message;

  const LocalCharacterDetailError(this.message);

  @override
  List<Object> get props => [message];
}
