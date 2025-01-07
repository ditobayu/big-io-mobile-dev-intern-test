import 'dart:async';
import 'package:adhitya/core/constants/constants.dart';
import 'package:adhitya/features/characters/domain/entities/character.dart';
import 'package:adhitya/features/characters/presentation/bloc/character/remote/remote_character_bloc.dart';
import 'package:adhitya/features/characters/presentation/widgets/character_list.dart';
import 'package:adhitya/ui/widgets/custom_app_bar.dart';
import 'package:adhitya/ui/widgets/forms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SearchCharacterPage extends StatefulWidget {
  const SearchCharacterPage({super.key});

  @override
  State<SearchCharacterPage> createState() => _SearchCharacterPageState();
}

class _SearchCharacterPageState extends State<SearchCharacterPage> {
  Timer? _debounce;

  final Duration _debouceDuration = const Duration(milliseconds: 2000);

  _onSearchChanged(String query) async {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(_debouceDuration, () async {
      BlocProvider.of<RemoteCharacterBloc>(context).add(GetRemoteCharacters(
          name: query.isEmpty ? null : query.trim().toLowerCase()));
    });
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) {
          return;
        }
        context.go('/characters');
      },
      child: Scaffold(
        appBar: CustomAppBar(
          title: 'Search Character',
          onBackButtonPressed: () {
            context.go('/characters');
          },
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 20),
          child: Column(
            children: [
              CustomInputForms(
                label: 'Search Character',
                icon: const Icon(Icons.search),
                hintText: 'Search Character',
                onChange: _onSearchChanged,
              ),
              const SizedBox(height: 16),
              BlocBuilder<RemoteCharacterBloc, RemoteCharacterState>(
                builder: (context, state) {
                  if (state is RemoteCharacterLoaded) {
                    return CharaterList(
                      isFromFavoritePage: false,
                      isLoading: false,
                      isNeedFavoriteButton: true,
                      characters: state.characterList.characters,
                    );
                  } else if (state is RemoteCharacterLoading) {
                    List<CharacterEntity> dummyCharacters =
                        List.filled(16, dummyCharacter);
                    return CharaterList(
                      isFromFavoritePage: false,
                      isNeedFavoriteButton: true,
                      isLoading: true,
                      characters: dummyCharacters,
                    );
                  } else if (state is RemoteCharacterError) {
                    return Center(child: Text(state.error.message!));
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
