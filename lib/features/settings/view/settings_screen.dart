import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
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
            title: Text('Настройки', style: theme.textTheme.headlineMedium),
          ),
        ],
      ),
    );
  }
}
