import 'package:auto_route/auto_route.dart';
import 'package:wordly/features/favorites/favorites.dart';
import 'package:wordly/features/home/home.dart';
import 'package:wordly/features/main/main.dart';
import 'package:wordly/features/settings/settings.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(
      page: MainRoute.page,
      initial: true,
      children: [
        AutoRoute(page: HomeRoute.page),
        AutoRoute(page: FavoritesRoute.page),
        AutoRoute(page: SettingsRoute.page),
      ],
    ),
  ];
}
