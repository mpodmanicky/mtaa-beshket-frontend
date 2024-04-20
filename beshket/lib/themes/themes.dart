//<Martin Podmanicky>
import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    background: Colors.blue.shade50,
    primary: Colors.blue,
    secondary: Colors.blue.shade800,
    tertiary: Colors.blue.shade900,
  ),
);

ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    background: Colors.grey.shade500,
    primary: Colors.grey.shade900,
    secondary: Colors.grey.shade200,
    tertiary: Colors.grey.shade100,
  ),
);
