import 'package:flutter/material.dart';

import '../../design/colors.dart';

class AppElevatedButtonTheme{

  AppElevatedButtonTheme._();

  // lightTheme
  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: AppColors.primary,
      backgroundColor: AppColors.primary,
      disabledBackgroundColor: Colors.grey,
      disabledForegroundColor: Colors.grey,
      side: const BorderSide(color: AppColors.primary),
      padding: const EdgeInsets.symmetric(vertical: 12),
      textStyle: TextStyle(fontWeight: FontWeight.w600,fontSize: 16, color: Colors.white),
      shape:  RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))
    )
  );

  // darkTheme
  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          elevation: 0,
          foregroundColor: Colors.white,
          backgroundColor: Colors.blue,
          disabledBackgroundColor: Colors.grey,
          disabledForegroundColor: Colors.grey,
          side: const BorderSide(color: Colors.blue),
          padding: const EdgeInsets.symmetric(vertical: 18),
          textStyle: TextStyle(fontWeight: FontWeight.w600,fontSize: 16, color: Colors.white),
          shape:  RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))
      )
  );
}