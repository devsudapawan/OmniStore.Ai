import 'package:flutter/material.dart';

import '../../design/colors.dart';

class AppTabBarTheme {

  AppTabBarTheme._();

  static TabBarTheme lightTabBarTheme = TabBarTheme(
    labelColor: AppColors.white, // Replace with your primary color
    unselectedLabelColor: Colors.grey,
    labelStyle: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 15,
    ),
    unselectedLabelStyle: TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 14,
    ),
    indicatorSize: TabBarIndicatorSize.tab, // Use TabBarIndicatorSize.tab for full width
    indicator: BoxDecoration(
      color: AppColors.primary, // Replace with your primary color
      borderRadius: BorderRadius.circular(12),
    ),
  );

  static TabBarTheme darkTabBarTheme =  TabBarTheme(
    labelColor: AppColors.white, // Replace with your primary color
    unselectedLabelColor: Colors.white,
    labelStyle: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 15,
    ),
    unselectedLabelStyle: TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 14,
    ),
    indicatorSize: TabBarIndicatorSize.tab, // Use TabBarIndicatorSize.tab for full width
    indicator: BoxDecoration(
      color: AppColors.primary, // Replace with your primary color
      borderRadius: BorderRadius.circular(12),
    ),
  );
}