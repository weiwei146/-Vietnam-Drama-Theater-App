import 'package:flutter/material.dart';

import 'text_theme.dart';

class TheaterAppTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    textTheme: TheaterTextTheme.lightTextTheme,
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    textTheme: TheaterTextTheme.darkTextTheme,
  );
}
