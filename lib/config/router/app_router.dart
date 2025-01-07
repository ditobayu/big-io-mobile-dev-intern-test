import 'package:adhitya/features/characters/presentation/pages/character_detail_page.dart';
import 'package:adhitya/features/characters/presentation/pages/character_list_page.dart';
import 'package:adhitya/features/characters/presentation/pages/favorite_characters_page.dart';
import 'package:adhitya/features/characters/presentation/pages/search_character_page.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/characters',
    routes: [
      GoRoute(
        name: 'home',
        path: '/',
        builder: (context, state) => const CharacterListPage(),
      ),
      GoRoute(
        name: 'characters',
        path: '/characters',
        builder: (context, state) => const CharacterListPage(),
      ),
      GoRoute(
        name: 'character',
        path: '/characters/:id',
        builder: (context, state) {
          final id = state.pathParameters['id']!;
          final isFromFavorite = state.extra as bool;
          return CharacterDetailPage(
            characterId: int.parse(id),
            isFromFavorite: isFromFavorite,
          );
        },
      ),
      GoRoute(
          name: 'favorites',
          path: '/favorites',
          builder: (context, state) => const FavoriteCharactersPage()),
      GoRoute(
          name: 'search-character',
          path: '/search-character',
          builder: (context, state) => const SearchCharacterPage()),
    ],
  );
}
