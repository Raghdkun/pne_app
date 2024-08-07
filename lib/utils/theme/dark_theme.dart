// lib/dark_theme.dart
import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primarySwatch: Colors.blueGrey,
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.blueGrey[900],
    centerTitle: true,
  ),
  textTheme: TextTheme(
    bodyLarge: TextStyle(color: Colors.white),
    bodyMedium: TextStyle(color: Colors.white70),
  ),
  // Add more theme properties as needed
);
