import 'package:flutter/material.dart';
import 'package:nasapic/design_system/themes/custom_colors.dart';

class Themes {
  static ThemeData lightTheme() {
    return ThemeData(
      primaryColor: Colors.black,
      scaffoldBackgroundColor: CustomColors.khaki,
      buttonTheme: const ButtonThemeData(
        buttonColor: CustomColors.khaki,
      ),
      inputDecorationTheme: const InputDecorationTheme(
        fillColor: Colors.white,
      ),
      primaryTextTheme: const TextTheme(
        titleLarge: TextStyle(
          color: CustomColors.eggPlantTextColor,
          fontSize: 28,
        ),
        titleMedium: TextStyle(
          color: CustomColors.eggPlantTextColor,
          fontSize: 18,
        ),
        titleSmall: TextStyle(
          color: CustomColors.mindaroSubtitle,
          fontSize: 15,
        ),
      ),
    );
  }
}
