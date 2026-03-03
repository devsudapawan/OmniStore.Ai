import 'package:flutter/material.dart';

class GAppBarTheme{

  GAppBarTheme._();

  // lightTheme
  static const lightAppBarTheme = AppBarTheme(
    elevation: 0,
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    scrolledUnderElevation: 0,
    centerTitle: false,
    iconTheme: IconThemeData(color: Colors.black, size: 24),
    actionsIconTheme: IconThemeData(color: Colors.black, size: 24),
    titleTextStyle: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,color: Colors.black)
  );

  // darkTheme
  static const darkAppBarTheme = AppBarTheme(
      elevation: 0,
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      scrolledUnderElevation: 0,
      centerTitle: false,
      iconTheme: IconThemeData(color: Colors.black, size: 24),
      actionsIconTheme: IconThemeData(color: Colors.black, size: 24),
      titleTextStyle: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,color: Colors.white)
  );
}