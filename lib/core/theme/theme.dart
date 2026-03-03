import 'package:flutter/material.dart';

import '../design/colors.dart';
import 'custome_theme/appBar_Theme.dart';
import 'custome_theme/bottom_sheet_theme.dart';
import 'custome_theme/checkbox_theme.dart';
import 'custome_theme/chip_theme.dart';
import 'custome_theme/elevated_button_theme.dart';
import 'custome_theme/outlined_button_theme.dart';
import 'custome_theme/text_field_theme.dart';
import 'custome_theme/text_theme.dart';

class AppTheme{

  AppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: "Poppins",
    scaffoldBackgroundColor: Colors.white,
    brightness: Brightness.light,
    primaryColor: AppColors.primary,
    textTheme: AppTextTheme.lightTextTheme,
    chipTheme: AppChipTheme.lightChipThemeData,
appBarTheme: GAppBarTheme.lightAppBarTheme,
    checkboxTheme: AppCheckBoxTheme.lightCheckboxTheme,
    bottomSheetTheme: AppBottomSheetTheme.lightBottomSheetThemeData,
    elevatedButtonTheme: AppElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: AppOutlinedButtonTheme.lightOutLinedButtonTheme,
    inputDecorationTheme: AppTextFieldTheme.lightInputDecorationTheme,
    indicatorColor: AppColors.primary,
    // tabBarTheme: AppTabBarTheme.lightTabBarTheme
  );
  static ThemeData darkTheme = ThemeData(
      useMaterial3: true,
      fontFamily: "Poppins",
      scaffoldBackgroundColor: Colors.black,
      brightness: Brightness.dark,
      primaryColor: AppColors.primary,
      textTheme: AppTextTheme.darkTextTheme,
      chipTheme: AppChipTheme.darkChipThemeData,
      appBarTheme: GAppBarTheme.darkAppBarTheme,
      checkboxTheme: AppCheckBoxTheme.darkCheckboxTheme,
      bottomSheetTheme: AppBottomSheetTheme.darkBottomSheetThemeData,
      elevatedButtonTheme: AppElevatedButtonTheme.darkElevatedButtonTheme,
      outlinedButtonTheme: AppOutlinedButtonTheme.darkOutLinedButtonTheme,
      inputDecorationTheme: AppTextFieldTheme.darkInputDecorationTheme,
    // tabBarTheme: AppTabBarTheme.darkTabBarTheme,
  );

}