import 'package:adhitya/core/constants/constants.dart';
import 'package:adhitya/features/characters/domain/entities/character.dart';
import 'package:adhitya/features/characters/presentation/bloc/character/remote/remote_character_bloc.dart';
import 'package:adhitya/features/characters/presentation/widgets/character_list.dart';
import 'package:adhitya/features/characters/presentation/widgets/top_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class CharacterListPage extends StatefulWidget {
  const CharacterListPage({super.key});

  @override
  State<CharacterListPage> createState() => _CharacterListPageState();
}

class _CharacterListPageState extends State<CharacterListPage> {
  @override
  void initState() {
    super.initState();

    BlocProvider.of<RemoteCharacterBloc>(context)
        .add(const GetRemoteCharacters());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<RemoteCharacterBloc, RemoteCharacterState>(
        builder: (context, state) {
          if (state is RemoteCharacterLoading) {
            List<CharacterEntity> dummyCharacters =
                List.filled(16, dummyCharacter);
            return Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 40),
              child: Column(
                children: [
                  const TopBar(),
                  CharaterList(
                    isFromFavoritePage: false,
                    isNeedFavoriteButton: true,
                    isLoading: true,
                    characters: dummyCharacters,
                  ),
                ],
              ),
            );
          }

          if (state is RemoteCharacterLoaded) {
            return Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 40),
              child: Column(
                children: [
                  const TopBar(),
                  CharaterList(
                    isFromFavoritePage: false,
                    isNeedFavoriteButton: true,
                    isLoading: false,
                    characters: state.characterList.characters,
                  ),
                ],
              ),
            );
          }

          if (state is RemoteCharacterError) {
            return const Center(
              child: Text('Failed to load characters'),
            );
          }
          return const Center(
            child: Text('Characters List'),
          );
        },
      ),
    );
  }
}
