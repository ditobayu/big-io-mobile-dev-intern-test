import 'package:adhitya/core/theme/app_colors.dart';
import 'package:adhitya/features/characters/domain/entities/character.dart';
import 'package:adhitya/features/characters/presentation/bloc/character/local/local_character_bloc.dart';
import 'package:adhitya/features/characters/presentation/bloc/character/remote/remote_character_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SaveFavoriteButton extends StatelessWidget {
  const SaveFavoriteButton({
    super.key,
    required this.character,
  });

  final CharacterEntity character;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 0,
      bottom: 0,
      child: IconButton(
          onPressed: () {
            if (character.isFavorite != null && character.isFavorite!) {
              BlocProvider.of<LocalCharacterBloc>(context)
                  .add(RemoveFavoriteCharacter(character));
            } else {
              BlocProvider.of<LocalCharacterBloc>(context)
                  .add(SaveFavoriteCharacter(character));
            }

            BlocProvider.of<RemoteCharacterBloc>(context)
                .add(const GetRemoteCharacters());
          },
          icon: Icon(
            character.isFavorite != null && character.isFavorite!
                ? Icons.favorite
                : Icons.favorite_border,
            color: character.isFavorite != null && character.isFavorite!
                ? AppColors.secondary400
                : AppColors.primary300,
            size: 32,
          )),
    );
  }
}
