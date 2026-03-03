import 'package:flutter/material.dart';

class AppChipTheme{

  AppChipTheme._();


  // lightTheme
  static ChipThemeData lightChipThemeData = ChipThemeData(
    checkmarkColor: Colors.white,
    disabledColor: Colors.grey.withOpacity(0.4),
    labelStyle: TextStyle(color: Colors.black),
    selectedColor: Colors.blue,
    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
  );

  // darkTheme
  static ChipThemeData darkChipThemeData = ChipThemeData(
    checkmarkColor: Colors.white,
    disabledColor: Colors.grey.withOpacity(0.4),
    labelStyle: TextStyle(color: Colors.white),
    selectedColor: Colors.blue,
    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
  );
}