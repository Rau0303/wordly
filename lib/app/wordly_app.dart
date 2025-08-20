import 'package:flutter/material.dart';
import 'package:wordly/app/app.dart';
import 'package:wordly/router/router.dart';
import 'package:wordly/ui/ui.dart';

class WordlyApp extends StatefulWidget {
  const WordlyApp({super.key, required this.config});
  final AppConfig config;


  @override
  State<WordlyApp> createState() => _WordlyAppState();
}

class _WordlyAppState extends State<WordlyApp> {
  final _appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    final repositoryContainer = RepositoryContainer.prod(config: widget.config);
    return AppInitializer(
      config: widget.config,
      repositoryContainer: repositoryContainer,
      child: MaterialApp.router(
        title: 'Wordly',
        theme: lightTheme,
        darkTheme: darkTheme,
        debugShowCheckedModeBanner: false,
        routerConfig: _appRouter.config(),
      ),
    );
  }
}
