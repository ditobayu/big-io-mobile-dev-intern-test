import 'package:adhitya/core/constants/constants.dart';
import 'package:adhitya/features/characters/domain/entities/character.dart';
import 'package:adhitya/features/characters/presentation/bloc/character/local/local_character_bloc.dart';
import 'package:adhitya/features/characters/presentation/widgets/character_list.dart';
import 'package:adhitya/ui/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class FavoriteCharactersPage extends StatefulWidget {
  const FavoriteCharactersPage({super.key});

  @override
  State<FavoriteCharactersPage> createState() => _FavoriteCharactersPageState();
}

class _FavoriteCharactersPageState extends State<FavoriteCharactersPage> {
  @override
  void initState() {
    super.initState();

    BlocProvider.of<LocalCharacterBloc>(context).add(GetFavoriteCharacters());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          title: "Favorite Character",
          onBackButtonPressed: () {
            context.pop();
          }),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 20),
        child: BlocBuilder<LocalCharacterBloc, LocalCharacterState>(
          builder: (context, state) {
            if (state is LocalCharacterLoading) {
              List<CharacterEntity> dummyCharacters =
                  List.filled(16, dummyCharacter);
              return CharaterList(
                isFromFavoritePage: true,
                isNeedFavoriteButton: false,
                isLoading: true,
                characters: dummyCharacters,
              );
            }
            if (state is LocalCharacterLoaded) {
              return CharaterList(
                isFromFavoritePage: true,
                isNeedFavoriteButton: false,
                isLoading: false,
                characters: state.characters,
              );
            }
            return const Center(
              child: Text('Favorite Characters Page'),
            );
          },
        ),
      ),
    );
  }
}
