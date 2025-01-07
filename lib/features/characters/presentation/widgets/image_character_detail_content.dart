import 'package:adhitya/features/characters/domain/entities/character.dart';
import 'package:flutter/material.dart';

class ImageCharacterDetailContent extends StatelessWidget {
  const ImageCharacterDetailContent({
    super.key,
    required Animation<double> animation,
    required this.character,
  }) : _animation = animation;

  final Animation<double> _animation;
  final CharacterEntity character;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                character.image ?? '',
                fit: BoxFit.cover,
                width: _animation.value,
              ),
            );
          },
        ),
      ],
    );
  }
}
