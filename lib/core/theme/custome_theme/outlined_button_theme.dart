import 'package:flutter/material.dart';

class AppOutlinedButtonTheme{

  AppOutlinedButtonTheme._();

  // lightTheme

  static final lightOutLinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      foregroundColor: Colors.black,
      side: const BorderSide(color: Colors.blue),
      textStyle: TextStyle(fontSize: 16, color: Colors.black,fontWeight: FontWeight.w600),
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
    )
  );

  // darkTheme
  static final darkOutLinedButtonTheme = OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        elevation: 0,
        foregroundColor: Colors.white,
        side: const BorderSide(color: Colors.blueAccent),
        textStyle: TextStyle(fontSize: 16, color: Colors.white,fontWeight: FontWeight.w600),
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      )
  );
}