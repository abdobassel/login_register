import 'package:flutter/material.dart';
import 'package:project/core/colors_app.dart';

ThemeData dark() {
  return ThemeData(
    hintColor: ColorApp.hint,
    scaffoldBackgroundColor: ColorApp.ScafflodColor,
    appBarTheme: const AppBarTheme(
      scrolledUnderElevation: 0.0,
      color: ColorApp.ScafflodColor,
      centerTitle: true,
      elevation: 0.0,
      titleTextStyle: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
