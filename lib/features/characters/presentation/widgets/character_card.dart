import 'package:adhitya/core/theme/app_colors.dart';
import 'package:adhitya/core/theme/app_font.dart';
import 'package:adhitya/core/util/truncate_string.dart';
import 'package:adhitya/features/characters/domain/entities/character.dart';
import 'package:flutter/material.dart';

class CharacterCard extends StatelessWidget {
  const CharacterCard({
    super.key,
    required this.character,
  });

  final CharacterEntity character;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppColors.primary200,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  truncateString(character.name, length: 20),
                  style: AppTextStyles.smallNoneBold,
                ),
                Text(character.status ?? ''),
              ],
            ),
          ),
          const SizedBox(
            width: 4,
          ),
          SizedBox(
            width: (MediaQuery.of(context).size.width - 48) * 0.25 - 8,
            child: AspectRatio(
              aspectRatio: 1,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  character.image ?? '',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
