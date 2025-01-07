part of 'local_character_detail_bloc.dart';

sealed class LocalCharacterDetailEvent extends Equatable {
  const LocalCharacterDetailEvent();

  @override
  List<Object> get props => [];
}

final class GetFavoriteCharacterDetail extends LocalCharacterDetailEvent {
  final int id;

  const GetFavoriteCharacterDetail(this.id);

  @override
  List<Object> get props => [id];
}
