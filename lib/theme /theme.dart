import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/constants.dart';

class AppTheme {
  static final ThemeData blueTheme = ThemeData(
    appBarTheme: const AppBarTheme(backgroundColor: Constants.primaryColorBlue),
    primaryColor: Constants.primaryColorBlue,
    scaffoldBackgroundColor: Constants.scaffoldBackgroundBlue,
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        fontSize: 48.0,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      headlineMedium: TextStyle(
        fontSize: 24,
        color: Colors.white,
      ),
      bodyLarge: TextStyle(
        fontSize: 18,
        color: Colors.white70,
      ),
      bodyMedium: TextStyle(fontSize: 16, color: Colors.white),
    ),
    iconTheme: const IconThemeData(
      color: Colors.white,
      size: 48,
    ),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: AppTheme.createWhiteTextStyle(
        25,
        color: Constants.primaryColorBlue,
      ),
      filled: true,
      fillColor: Colors.white,
      suffixIconColor: Constants.primaryColorBlue,
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(
            10.0,
          ),
        ),
        borderSide: BorderSide.none,
      ),
      prefixIconColor: Constants.primaryColorBlue,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        backgroundColor: WidgetStateProperty.all<Color>(
          Constants.additionalColorBlue,
        ),
      ),
    ),
  );

  static final ThemeData orangeTheme = ThemeData(
    appBarTheme:
        const AppBarTheme(backgroundColor: Constants.primaryColorOrange),
    primaryColor: Constants.primaryColorOrange,
    scaffoldBackgroundColor: Constants.scaffoldBackgroundOrange,
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        fontSize: 48.0,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      headlineMedium: TextStyle(
        fontSize: 24,
        color: Colors.white,
      ),
      bodyLarge: TextStyle(
        fontSize: 18,
        color: Colors.white70,
      ),
      bodyMedium: TextStyle(fontSize: 16, color: Colors.white),
    ),
    iconTheme: const IconThemeData(
      color: Colors.white,
      size: 48,
    ),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: AppTheme.createWhiteTextStyle(
        25,
        color: Constants.primaryColorOrange,
      ),
      filled: true,
      fillColor: Colors.white,
      suffixIconColor: Constants.primaryColorOrange,
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(
            10.0,
          ),
        ),
        borderSide: BorderSide.none,
      ),
      prefixIconColor: Constants.primaryColorOrange,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        backgroundColor: WidgetStateProperty.all<Color>(
          Constants.additionalColorOrange,
        ),
      ),
    ),
  );

  static TextStyle createWhiteTextStyle(
    double fontSize, {
    bool bold = false,
    Color color = Colors.white,
  }) {
    return GoogleFonts.mulish(
      color: color,
      fontWeight: bold ? FontWeight.bold : FontWeight.w300,
      fontSize: fontSize,
    );
  }
}
