import 'package:adhitya/features/characters/data/data_sources/local/app_database.dart';
import 'package:adhitya/features/characters/data/data_sources/remote/character_api_service.dart';
import 'package:adhitya/features/characters/data/repository/character_repository_impl.dart';
import 'package:adhitya/features/characters/domain/repository/character_repository.dart';
import 'package:adhitya/features/characters/domain/usecases/delete_favorite_character.dart';
import 'package:adhitya/features/characters/domain/usecases/get_character_detail.dart';
import 'package:adhitya/features/characters/domain/usecases/get_characters.dart';
import 'package:adhitya/features/characters/domain/usecases/get_favorite_character_detail.dart';
import 'package:adhitya/features/characters/domain/usecases/get_favorite_characters.dart';
import 'package:adhitya/features/characters/domain/usecases/save_favorite_character.dart';
import 'package:adhitya/features/characters/presentation/bloc/character/local/local_character_bloc.dart';
import 'package:adhitya/features/characters/presentation/bloc/character/remote/remote_character_bloc.dart';
import 'package:adhitya/features/characters/presentation/bloc/character_detail/local/local_character_detail_bloc.dart';
import 'package:adhitya/features/characters/presentation/bloc/character_detail/remote/remote_character_detail_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  final database =
      await $FloorAppDatabase.databaseBuilder('app_database.db').build();
  sl.registerSingleton<AppDatabase>(database);

  sl.registerSingleton<Dio>(Dio());

  sl.registerSingleton<CharacterApiService>(CharacterApiService(sl()));

  sl.registerSingleton<CharacterRepository>(
      CharacterRepositoryImpl(sl(), sl()));

  sl.registerSingleton<GetCharactersUseCase>(GetCharactersUseCase(sl()));
  sl.registerSingleton<GetCharacterDetailUseCase>(
      GetCharacterDetailUseCase(sl()));
  sl.registerSingleton<GetFavoriteCharactersUseCase>(
      GetFavoriteCharactersUseCase(sl()));
  sl.registerSingleton<SaveFavoriteCharactersUseCase>(
      SaveFavoriteCharactersUseCase(sl()));
  sl.registerSingleton<DeleteFavoriteCharactersUseCase>(
      DeleteFavoriteCharactersUseCase(sl()));
  sl.registerSingleton<GetFavoriteCharacterDetailUseCase>(
      GetFavoriteCharacterDetailUseCase(sl()));

  sl.registerFactory<RemoteCharacterBloc>(
      () => RemoteCharacterBloc(sl(), sl()));
  sl.registerFactory<RemoteCharacterDetailBloc>(
      () => RemoteCharacterDetailBloc(sl()));
  sl.registerFactory<LocalCharacterBloc>(
      () => LocalCharacterBloc(sl(), sl(), sl()));
  sl.registerFactory<LocalCharacterDetailBloc>(
      () => LocalCharacterDetailBloc(sl()));
}
