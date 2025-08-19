import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wordly/router/router.dart';
import 'package:wordly/ui/ui.dart';

@RoutePage()
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  MainScreenState createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      homeIndex: 2,
      routes: const [
        HomeRoute(),
        FavoritesRoute(),
        SettingsRoute()
      ],
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          backgroundColor: Colors.transparent,
          extendBody: true,
          body: child,
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomBottomNavigationBar(
              icons: _getIcons(tabsRouter.activeIndex),
              labels: _getLabels(tabsRouter.activeIndex),
              currentIndex: _getBottomNavIndex(tabsRouter.activeIndex),
              onTap: (index) => _handleBottomNavTap(index, tabsRouter),
            ),
          ),
        );
      },
    );
  }

  List<IconData> _getIcons(int activeIndex) {
    return [CupertinoIcons.home, CupertinoIcons.heart, Icons.settings];
  }

  List<String> _getLabels(int activeIndex) {
    return ['Главная', 'Избранное', 'Настройки'];
  }

  int _getBottomNavIndex(int activeIndex) {
    // Преобразуем индекс AutoTabsRouter в индекс BottomNavigationBar
    if (activeIndex == 3) return 2; // ShopsRoute -> индекс 2 в BottomNavBar
    if (activeIndex == 4) return 3; // AdditionalRoute -> индекс 3
    return activeIndex;
  }

  void _handleBottomNavTap(int index, TabsRouter tabsRouter) {
    // Преобразуем индекс BottomNavigationBar в индекс AutoTabsRouter
    int newActiveIndex;
    switch (index) {
      case 0:
        newActiveIndex = 0;
        break;
      case 1:
        newActiveIndex = 1;
        break;
      case 2:
        // Переключаем между Map (2) и Shops (3)
        newActiveIndex = tabsRouter.activeIndex == 2 ? 3 : 2;
        break;
      case 3:
        newActiveIndex = 4;
        break;
      default:
        newActiveIndex = index;
    }
    tabsRouter.setActiveIndex(newActiveIndex);
  }
}

class CustomBottomNavigationBar extends StatelessWidget {
  final List<IconData> icons;
  final List<String> labels;
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavigationBar({
    super.key,
    required this.icons,
    required this.labels,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    final labelFontSize = screenWidth * 0.035;
    final theme = Theme.of(context);
    final isDarkTheme = theme.brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Container(
        decoration: BoxDecoration(
          color: isDarkTheme
              ? AppColors.darkGray
              : Colors.white, // Background color
          borderRadius: BorderRadius.circular(
            screenWidth * 0.1,
          ), // Border radius depends on screen width
          boxShadow: [
            BoxShadow(
              color: isDarkTheme
                  ? Colors.black.withValues(alpha: 0.0)
                  : Colors.grey.withValues(alpha: 0.5),
              spreadRadius: 5,
              blurRadius: 10,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(icons.length, (index) {
            final isSelected = currentIndex == index;

            return GestureDetector(
              onTap: () {
                onTap(index); // Вызываем внешний обработчик onTap
              },
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.03,
                  vertical: screenWidth * 0.02,
                ), 
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    screenWidth * 0.05,
                  ), // Радиус углов зависит от ширины экрана
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      icons[index],
                      color: isSelected ? theme.primaryColor : Colors.grey,
                    ),
                    if (isSelected) // Показываем текст только для выбранного индекса
                      Text(
                        labels[index],
                        style: TextStyle(
                          color: theme.primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: labelFontSize,
                        ),
                      ),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
