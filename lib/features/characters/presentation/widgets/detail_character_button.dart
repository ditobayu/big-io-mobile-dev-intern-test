import 'package:adhitya/core/theme/app_colors.dart';
import 'package:adhitya/features/characters/domain/entities/character.dart';
import 'package:flutter/material.dart';

class DetailCharacterButton extends StatelessWidget {
  final Function(BuildContext context, CharacterEntity character)
      showDetailCharacter;
  final CharacterEntity character;
  const DetailCharacterButton(
      {super.key, required this.showDetailCharacter, required this.character});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.secondary200,
        borderRadius: BorderRadius.circular(20),
      ),
      child: IconButton(
        onPressed: () {
          showDetailCharacter(context, character);
        },
        icon: const Icon(
          Icons.search_rounded,
          color: AppColors.primary950,
        ), // Add background color
      ),
    );
  }
}
