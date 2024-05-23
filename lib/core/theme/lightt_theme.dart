import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: Colors.grey.shade200,
  appBarTheme: const AppBarTheme(
    surfaceTintColor: Colors.green,
    iconTheme: IconThemeData(
      color: Colors.black,
    ),
  ),
  iconTheme: const IconThemeData(
    color: Colors.black,
  ),
  textTheme: const TextTheme(
    bodyText2: TextStyle(
      color: Colors.white,
    ),
  ),
);
