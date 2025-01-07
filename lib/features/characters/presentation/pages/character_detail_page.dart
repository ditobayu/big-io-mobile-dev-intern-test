import 'package:adhitya/core/constants/constants.dart';
import 'package:adhitya/core/theme/app_colors.dart';
import 'package:adhitya/features/characters/domain/entities/character.dart';
import 'package:adhitya/features/characters/presentation/bloc/character/local/local_character_bloc.dart';
import 'package:adhitya/features/characters/presentation/bloc/character_detail/local/local_character_detail_bloc.dart';
import 'package:adhitya/features/characters/presentation/bloc/character_detail/remote/remote_character_detail_bloc.dart';
import 'package:adhitya/features/characters/presentation/widgets/body_character_detail_content.dart';
import 'package:adhitya/features/characters/presentation/widgets/detail_character_button.dart';
import 'package:adhitya/features/characters/presentation/widgets/head_character_detail_content.dart';
import 'package:adhitya/features/characters/presentation/widgets/image_character_detail_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CharacterDetailPage extends StatefulWidget {
  final int characterId;
  final bool isFromFavorite;
  const CharacterDetailPage(
      {super.key, required this.characterId, required this.isFromFavorite});

  @override
  State<CharacterDetailPage> createState() => _CharacterDetailPageState();
}

class _CharacterDetailPageState extends State<CharacterDetailPage>
    with TickerProviderStateMixin {
  bool isDetailOpened = false;
  late AnimationController _controller;
  late Animation<double> _animation;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    if (widget.isFromFavorite) {
      BlocProvider.of<LocalCharacterDetailBloc>(context)
          .add(GetFavoriteCharacterDetail(widget.characterId));
    } else {
      BlocProvider.of<RemoteCharacterDetailBloc>(context)
          .add(GetRemoteCharacterDetail(widget.characterId));
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    _animation =
        Tween<double>(begin: screenWidth * 0.8, end: screenWidth * 0.5).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_rounded,
            color: AppColors.primary950,
          ),
        ),
        backgroundColor: AppColors.secondary100,
        actions: [
          widget.isFromFavorite
              ? BlocBuilder<LocalCharacterDetailBloc,
                  LocalCharacterDetailState>(
                  builder: (context, state) {
                    if (state is LocalCharacterDetailLoaded) {
                      return IconButton(
                        onPressed: () {
                          BlocProvider.of<LocalCharacterBloc>(context)
                              .add(RemoveFavoriteCharacter(state.character));
                          context.pop(context);
                        },
                        icon: const Icon(
                          Icons.favorite,
                          color: AppColors.secondary700,
                        ),
                      );
                    }
                    return IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.favorite_border_rounded,
                      ),
                    );
                  },
                )
              : Container()
        ],
      ),
      body: widget.isFromFavorite
          ? _buildLocalCharacterDetail()
          : _buildRemoteCharacterDetail(),
    );
  }

  BlocConsumer<RemoteCharacterDetailBloc, RemoteCharacterDetailState>
      _buildRemoteCharacterDetail() {
    return BlocConsumer<RemoteCharacterDetailBloc, RemoteCharacterDetailState>(
      listener: (context, state) {
        if (state is RemoteCharacterDetailLoaded) {
          _showDetailCharacter(
            context,
            state.character,
          );
        }
      },
      builder: (context, state) {
        if (state is RemoteCharacterDetailLoading) {
          CharacterEntity character = dummyCharacter;
          return Skeletonizer(
            child: Stack(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    color: AppColors.secondary100,
                  ),
                  child: _showHeadDetailCharacter(character),
                ),
                _showDetailCharacterButton(context, character),
              ],
            ),
          );
        } else if (state is RemoteCharacterDetailFailed) {
          return Center(child: Text(state.error.message!));
        } else if (state is RemoteCharacterDetailLoaded) {
          CharacterEntity character = state.character;
          return Stack(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  color: AppColors.secondary100,
                ),
                child: _showHeadDetailCharacter(character),
              ),
              _showDetailCharacterButton(context, character),
            ],
          );
        }
        return Container();
      },
    );
  }

  BlocConsumer<LocalCharacterDetailBloc, LocalCharacterDetailState>
      _buildLocalCharacterDetail() {
    return BlocConsumer<LocalCharacterDetailBloc, LocalCharacterDetailState>(
      listener: (context, state) {
        if (state is LocalCharacterDetailLoaded) {
          _showDetailCharacter(
            context,
            state.character,
          );
        }
      },
      builder: (context, state) {
        if (state is LocalCharacterDetailLoading) {
          CharacterEntity character = dummyCharacter;
          return Skeletonizer(
            child: Stack(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    color: AppColors.secondary100,
                  ),
                  child: _showHeadDetailCharacter(character),
                ),
                _showDetailCharacterButton(context, character),
              ],
            ),
          );
        } else if (state is LocalCharacterDetailError) {
          return Center(child: Text(state.message));
        } else if (state is LocalCharacterDetailLoaded) {
          CharacterEntity character = state.character;
          return Stack(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  color: AppColors.secondary100,
                ),
                child: _showHeadDetailCharacter(character),
              ),
              _showDetailCharacterButton(context, character),
            ],
          );
        }
        return Container();
      },
    );
  }

  Column _showHeadDetailCharacter(CharacterEntity character) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HeadCharacterDetailContent(character: character),
        const SizedBox(
          height: 16,
        ),
        ImageCharacterDetailContent(
            animation: _animation, character: character),
      ],
    );
  }

  Widget _showDetailCharacterButton(
      BuildContext context, CharacterEntity character) {
    return Positioned(
      bottom: 20,
      right: 20,
      child: DetailCharacterButton(
        showDetailCharacter: _showDetailCharacter,
        character: character,
      ),
    );
  }

  void _showDetailCharacter(BuildContext context, CharacterEntity character) {
    setState(() {
      isDetailOpened = true;
    });

    _controller.forward();
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      barrierColor: Colors.transparent,
      builder: (context) => Wrap(children: [
        SingleChildScrollView(
          child: BodyCharacterDetailContent(
            character: character,
          ),
        ),
      ]),
    ).whenComplete(() {
      setState(() {
        isDetailOpened = false;
      });

      _controller.reverse();
    });
  }
}
