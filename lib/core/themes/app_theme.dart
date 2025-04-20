import 'package:flutter/material.dart';

class AppTheme {
  // Weather-themed colors
  static const Color _primaryColor = Color(0xFF4A90E2); // Sky blue
  static const Color _secondaryColor = Color(0xFFF5B041); // Sunny orange
  static const Color _backgroundColor = Color(0xFFF2F6FF); // Light sky blue
  static const Color _darkBackgroundColor =
      Color(0xFF1E2D40); // Dark night blue
  static const Color _cardColorLight = Color(0xFFFFFFFF);
  static const Color _cardColorDark = Color(0xFF2C3E50);

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: _backgroundColor,
      colorScheme: ColorScheme.fromSeed(
        seedColor: _primaryColor,
        brightness: Brightness.light,
        primary: _primaryColor,
        secondary: _secondaryColor,
        surfaceContainer: _backgroundColor,
        surface: _cardColorLight,
      ),
      appBarTheme: AppBarTheme(
        elevation: 0,
        centerTitle: true,
        backgroundColor: _primaryColor,
        foregroundColor: Colors.white,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          padding: const EdgeInsets.symmetric(vertical: 16),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
      ),
      cardTheme: CardTheme(
        elevation: 3,
        color: _cardColorLight,
        shadowColor: _primaryColor.withAlpha(75),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
      ),
      textTheme: ThemeData.light().textTheme.copyWith(
            headlineMedium: TextStyle(
              color: _primaryColor,
              fontWeight: FontWeight.bold,
            ),
            titleLarge: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: _darkBackgroundColor,
      colorScheme: ColorScheme.fromSeed(
        seedColor: _primaryColor,
        brightness: Brightness.dark,
        primary: _primaryColor,
        secondary: _secondaryColor,
        surfaceContainer: _darkBackgroundColor,
        surface: _cardColorDark,
      ),
      appBarTheme: const AppBarTheme(
        elevation: 0,
        centerTitle: true,
        backgroundColor: _darkBackgroundColor,
        foregroundColor: Colors.white,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          padding: const EdgeInsets.symmetric(vertical: 16),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
      ),
      cardTheme: CardTheme(
        elevation: 4,
        color: _cardColorDark,
        shadowColor: Colors.black45,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
      ),
      textTheme: ThemeData.dark().textTheme.copyWith(
            headlineMedium: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            titleLarge: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
    );
  }
}
