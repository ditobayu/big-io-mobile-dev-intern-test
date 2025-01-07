import 'package:adhitya/config/router/app_router.dart';
import 'package:adhitya/core/di/injection_container.dart';
import 'package:adhitya/features/characters/presentation/bloc/character/local/local_character_bloc.dart';
import 'package:adhitya/features/characters/presentation/bloc/character/remote/remote_character_bloc.dart';
import 'package:adhitya/features/characters/presentation/bloc/character_detail/local/local_character_detail_bloc.dart';
import 'package:adhitya/features/characters/presentation/bloc/character_detail/remote/remote_character_detail_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<RemoteCharacterBloc>(
          create: (context) => sl<RemoteCharacterBloc>(),
        ),
        BlocProvider<RemoteCharacterDetailBloc>(
          create: (context) => sl<RemoteCharacterDetailBloc>(),
        ),
        BlocProvider<LocalCharacterBloc>(
          create: (context) => sl<LocalCharacterBloc>(),
        ),
        BlocProvider<LocalCharacterDetailBloc>(
          create: (context) => sl<LocalCharacterDetailBloc>(),
        ),
      ],
      child: MaterialApp.router(
          title: 'Adhitya',
          debugShowCheckedModeBanner: false,
          routerConfig: AppRouter.router),
    );
  }
}
