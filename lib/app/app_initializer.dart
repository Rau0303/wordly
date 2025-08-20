import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wordly/app/app.dart';
import 'package:wordly/features/home/bloc/home_bloc.dart';
import 'package:wordly/repositories/wordly/wordly.dart';



class AppInitializer extends StatelessWidget {
  const AppInitializer({
    super.key,
    required this.child,
    required this.config,
    required this.repositoryContainer,
  });

  final AppConfig config;
  final Widget child;
  final RepositoryContainer repositoryContainer;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<WordlyRepositoryI>(
          create: (context) => repositoryContainer.wordlyRepository,
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<HomeBloc>(
            create: (context) =>
                HomeBloc(wordlyRepository: context.read<WordlyRepositoryI>()),
          ),
        ],
        child: child,
      ),
    );
  }
}
