import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FontsSizes {
  static const small = 12.0;
  static const standard = 14.0;
  static const standardUp = 16.0;
  static const medium = 20.0;
  static const large = 28.0;
}

class DefaultColors {
  // Core brand colors
  static const Color primaryGreen = Color(0xFF4CAF50);
  static const Color lightGreen = Color(0xFFA5D6A7);
  static const Color darkGreen = Color(0xFF2E7D32);
  static const Color white = Color(0xFFFFFFFF);

  // Text & background
  static const Color greyText = Color(0xFF5A5F6D);
  static const Color background = Color(0xFFF9FAF9);
  static const Color darkText = Color(0xFF1E1E1E);

  // Chat & UI elements
  static const Color senderMessage = lightGreen;
  static const Color receiverMessage = Color(0xFFE8F5E9);
  static const Color sentMessageInput = Color(0xFFE0E0E0);
  static const Color messageListPage = Color(0xFFF1F8E9);
  static const Color buttonColor = primaryGreen;

  static const Color accentGreen = Color(0xFF66BB6A);
  static const Color danger = Color(0xFFE53935);
  static const Color warning = Color(0xFFFFB300);
  static const Color info = Color(0xFF29B6F6);
}

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: DefaultColors.primaryGreen,
      scaffoldBackgroundColor: DefaultColors.background,
      colorScheme: const ColorScheme.light(
        primary: DefaultColors.primaryGreen,
        secondary: DefaultColors.darkGreen,
        background: DefaultColors.background,
        onPrimary: DefaultColors.white,
        onSecondary: DefaultColors.white,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: DefaultColors.primaryGreen,
        foregroundColor: DefaultColors.white,
        elevation: 0,
      ),
      textTheme: TextTheme(
        titleMedium: GoogleFonts.alegreyaSans(
          fontSize: FontsSizes.medium,
          color: DefaultColors.darkGreen,
          fontWeight: FontWeight.bold,
        ),
        titleLarge: GoogleFonts.alegreyaSans(
          fontSize: FontsSizes.large,
          color: DefaultColors.darkGreen,
          fontWeight: FontWeight.bold,
        ),
        bodySmall: GoogleFonts.alegreyaSans(fontSize: FontsSizes.standard, color: DefaultColors.greyText),
        bodyMedium: GoogleFonts.alegreyaSans(fontSize: FontsSizes.standard, color: Colors.black87),
        bodyLarge: GoogleFonts.alegreyaSans(fontSize: FontsSizes.standardUp, color: Colors.black87),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: DefaultColors.primaryGreen,
          foregroundColor: DefaultColors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: DefaultColors.white,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: DefaultColors.lightGreen),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: DefaultColors.primaryGreen, width: 2),
        ),
      ),
    );
  }
}
