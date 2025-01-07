part of 'remote_character_detail_bloc.dart';

sealed class RemoteCharacterDetailState extends Equatable {
  const RemoteCharacterDetailState();

  @override
  List<Object> get props => [];
}

final class RemoteCharacterDetailInitial extends RemoteCharacterDetailState {}

final class RemoteCharacterDetailLoading extends RemoteCharacterDetailState {}

final class RemoteCharacterDetailLoaded extends RemoteCharacterDetailState {
  final CharacterEntity character;

  const RemoteCharacterDetailLoaded(this.character);

  @override
  List<Object> get props => [character];
}

final class RemoteCharacterDetailFailed extends RemoteCharacterDetailState {
  final DioException error;

  const RemoteCharacterDetailFailed(this.error);

  @override
  List<Object> get props => [error];
}
