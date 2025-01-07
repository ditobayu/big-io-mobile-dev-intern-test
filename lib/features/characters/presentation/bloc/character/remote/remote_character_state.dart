part of 'remote_character_bloc.dart';

sealed class RemoteCharacterState extends Equatable {
  const RemoteCharacterState();

  @override
  List<Object> get props => [];
}

final class RemoteCharacterInitial extends RemoteCharacterState {}

final class RemoteCharacterLoading extends RemoteCharacterState {}

final class RemoteCharacterLoaded extends RemoteCharacterState {
  final CharacterListEntity characterList;

  const RemoteCharacterLoaded(this.characterList);

  @override
  List<Object> get props => [characterList];
}

final class RemoteCharacterError extends RemoteCharacterState {
  final DioException error;

  const RemoteCharacterError(this.error);

  @override
  List<Object> get props => [error];
}
