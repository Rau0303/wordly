import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            surfaceTintColor: Colors.transparent,
            backgroundColor: theme.scaffoldBackgroundColor,
            elevation: 0,
            title: Text('Главная', style: theme.textTheme.headlineMedium),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(70),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: theme.hintColor.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: TextFormField(
                      controller: _searchController,
                      decoration: InputDecoration(
                        hintText: 'Поиск синонимов...',
                        border: OutlineInputBorder(borderSide: BorderSide.none),
                        suffixIcon: Icon(CupertinoIcons.search),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),


        ],
      ),
    );
  }
}
