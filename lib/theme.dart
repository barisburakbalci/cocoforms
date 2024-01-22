import 'package:flutter/material.dart';

Color primaryTextColor = const Color.fromARGB(255, 0, 31, 79);

ThemeData theme = ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
  scaffoldBackgroundColor: Colors.grey.shade100,
  appBarTheme: const AppBarTheme(
    color: Colors.white,
    elevation: 1.0,
    shadowColor: Colors.black,
    titleTextStyle: TextStyle(
      fontSize: 35.0,
      fontWeight: FontWeight.w800,
      color: Colors.black,
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      foregroundColor: MaterialStateProperty.all(Colors.blue.shade900),
    ),
  ),
  listTileTheme: ListTileThemeData(
    selectedColor: Colors.blue.shade200,
    selectedTileColor: Colors.blue.shade50,
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Colors.white,
  ),
  textTheme: TextTheme(
    bodyLarge: TextStyle(
      fontSize: 20.0,
      color: primaryTextColor,
      fontWeight: FontWeight.w500,
    ),
  ),
  inputDecorationTheme: const InputDecorationTheme(
    isDense: true,
    contentPadding: EdgeInsets.only(top: 10.0),
  ),
  useMaterial3: true,
);
