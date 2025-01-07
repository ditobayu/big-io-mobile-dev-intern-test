part of 'remote_character_detail_bloc.dart';

sealed class RemoteCharacterDetailEvent extends Equatable {
  const RemoteCharacterDetailEvent();

  @override
  List<Object> get props => [];
}

final class GetRemoteCharacterDetail extends RemoteCharacterDetailEvent {
  final int id;

  const GetRemoteCharacterDetail(this.id);

  @override
  List<Object> get props => [id];
}
