part of 'remote_character_bloc.dart';

sealed class RemoteCharacterEvent extends Equatable {
  const RemoteCharacterEvent();

  @override
  List<Object> get props => [];
}

final class GetRemoteCharacters extends RemoteCharacterEvent {
  final String? name;
  final String? status;
  final String? species;
  final String? type;
  final String? gender;
  final int? page;
  const GetRemoteCharacters(
      {this.name,
      this.status,
      this.species,
      this.type,
      this.gender,
      this.page});
}
