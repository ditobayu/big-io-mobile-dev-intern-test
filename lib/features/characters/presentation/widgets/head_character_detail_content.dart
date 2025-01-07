import 'package:adhitya/core/theme/app_colors.dart';
import 'package:adhitya/core/theme/app_font.dart';
import 'package:adhitya/features/characters/domain/entities/character.dart';
import 'package:flutter/material.dart';

class HeadCharacterDetailContent extends StatelessWidget {
  const HeadCharacterDetailContent({
    super.key,
    required this.character,
  });

  final CharacterEntity character;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                character.name ?? '',
                style: AppTextStyles.title2,
              ),
              Row(
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: AppColors.primary200,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      character.gender ?? '',
                      style: AppTextStyles.smallNoneMedium,
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: AppColors.primary200,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      character.species ?? '',
                      style: AppTextStyles.smallNoneMedium,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        Text(
          "#${character.id}",
          style: AppTextStyles.title3,
        )
      ],
    );
  }
}
