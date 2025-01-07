import 'package:adhitya/features/characters/domain/entities/character.dart';
import 'package:adhitya/features/characters/presentation/widgets/character_card.dart';
import 'package:adhitya/features/characters/presentation/widgets/save_favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CharaterList extends StatelessWidget {
  final List<CharacterEntity> characters;
  final bool isLoading;
  final bool isNeedFavoriteButton;
  final bool isFromFavoritePage;
  const CharaterList({
    super.key,
    required this.characters,
    required this.isLoading,
    required this.isNeedFavoriteButton,
    required this.isFromFavoritePage,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            childAspectRatio: 2),
        itemCount: characters.length,
        itemBuilder: (context, index) {
          CharacterEntity character = characters[index];
          return isLoading
              ? Skeletonizer(
                  child: GestureDetector(
                    onTap: () {
                      context.push('/characters/${character.id}',
                          extra: isFromFavoritePage);
                    },
                    child: Stack(
                      children: [
                        CharacterCard(character: character),
                        if (isNeedFavoriteButton)
                          SaveFavoriteButton(character: character)
                      ],
                    ),
                  ),
                )
              : GestureDetector(
                  onTap: () {
                    context.push('/characters/${character.id}',
                        extra: isFromFavoritePage);
                  },
                  child: Stack(
                    children: [
                      CharacterCard(character: character),
                      if (isNeedFavoriteButton)
                        SaveFavoriteButton(character: character)
                    ],
                  ),
                );
        },
      ),
    );
  }
}
