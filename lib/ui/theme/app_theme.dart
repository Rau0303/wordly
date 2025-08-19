import 'package:flutter/material.dart';
import 'package:wordly/ui/ui.dart';



final darkTheme = ThemeData(
  useMaterial3: true,
  primaryColor: AppColors.primary,
  fontFamily: 'Montserrat',
  scaffoldBackgroundColor: Colors.black,
  colorScheme: ColorScheme.fromSeed(
    seedColor: AppColors.primary,
    brightness: Brightness.dark,
  ),
);

final lightTheme = ThemeData(
  useMaterial3: true,
  primaryColor: AppColors.primary,
  fontFamily: 'Montserrat',
  scaffoldBackgroundColor: Colors.white,
  dividerTheme: DividerThemeData(
    color: Colors.grey.withValues(alpha: 0.1),
  ),
  colorScheme: ColorScheme.fromSeed(
    seedColor: AppColors.primary,
    brightness: Brightness.light,
    surface: Colors.white,
  ),
);


