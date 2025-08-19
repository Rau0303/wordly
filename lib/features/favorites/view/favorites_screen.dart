import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
@RoutePage()
class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            surfaceTintColor: theme.primaryColor,
            backgroundColor: theme.scaffoldBackgroundColor,
            elevation: 0,
            title: Text('Избранное', style: theme.textTheme.headlineMedium),
          )

          
        ],
      ),
    );
  }
}