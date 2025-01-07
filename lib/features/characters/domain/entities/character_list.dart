import 'package:adhitya/features/characters/domain/entities/character.dart';
import 'package:adhitya/features/characters/domain/entities/page_info.dart';
import 'package:equatable/equatable.dart';

class CharacterListEntity extends Equatable {
  final List<CharacterEntity> characters;
  final PageInfoEntity pagination;

  const CharacterListEntity({
    required this.characters,
    required this.pagination,
  });

  @override
  List<Object?> get props => [characters, pagination];
}
