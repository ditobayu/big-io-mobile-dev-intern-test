import 'package:adhitya/core/theme/app_font.dart';
import 'package:adhitya/core/util/episode_formatter.dart';
import 'package:adhitya/features/characters/domain/entities/character.dart';
import 'package:adhitya/features/characters/presentation/widgets/character_info_row.dart';
import 'package:flutter/material.dart';

class BodyCharacterDetailContent extends StatelessWidget {
  final CharacterEntity character;
  const BodyCharacterDetailContent({
    super.key,
    required this.character,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      width: double.infinity,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Container(
              width: 80,
              height: 5,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          CharacterInfoRow(
            label: "Name",
            value: character.name,
          ),
          const SizedBox(
            height: 8,
          ),
          CharacterInfoRow(
            label: "Status",
            value: character.status,
          ),
          const SizedBox(
            height: 8,
          ),
          CharacterInfoRow(
            label: "Species",
            value: character.species,
          ),
          const SizedBox(
            height: 8,
          ),
          CharacterInfoRow(
            label: "Type",
            value: character.type,
          ),
          const SizedBox(
            height: 8,
          ),
          CharacterInfoRow(
            label: "Location",
            value: character.locationName,
          ),
          const SizedBox(
            height: 8,
          ),
          CharacterInfoRow(
            label: "Origin",
            value: character.originName,
          ),
          const SizedBox(
            height: 8,
          ),
          CharacterInfoRow(
            label: "Episodes",
            valueAsWidget: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ...character.episode!.take(10).map(
                      (episode) => Padding(
                        padding: const EdgeInsets.only(bottom: 4.0),
                        child: Text(
                          formatEpisode(episode),
                          style: AppTextStyles.smallNoneBold,
                        ),
                      ),
                    ),
                if (character.episode!.length > 10)
                  Text(
                    "...",
                    style: AppTextStyles.smallNoneBold,
                  ),
              ],
            ),
          ),
          const SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }
}
