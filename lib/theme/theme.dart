import 'package:flutter/material.dart';

/// Classe contenant la configuration du thème pour l'application.
/// Définit les couleurs et les styles de police avec support du mode sombre.
class AppTheme {
  // Définition des couleurs principales de l'application.
  static final Color couleurPrincipale = Colors.green[800]!;
  static final Color couleurPrincipaleSombre = Colors.green[600]!;
  static const Color couleurBlanche = Colors.white;
  static const Color couleurTexte = Colors.black;
  static const Color couleurTexteSombre = Colors.white;
  static const Color couleurFondSombre = Color(0xFF121212);

  /// Thème clair de l'application.
  static final ThemeData themeClair = ThemeData(
    brightness: Brightness.light,
    primaryColor: couleurPrincipale,
    scaffoldBackgroundColor: couleurBlanche,

    // Thème de la barre d'applications (AppBar).
    appBarTheme: AppBarTheme(
      backgroundColor: couleurPrincipale,
      foregroundColor: couleurBlanche,
      centerTitle: true,
      elevation: 2,
    ),

    // Thème pour les cartes (Card).
    cardTheme: CardThemeData(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      color: couleurBlanche,
    ),

    // Thème pour les dialogues (AlertDialog).
    dialogTheme: DialogThemeData(
      backgroundColor: couleurBlanche,
      surfaceTintColor: couleurBlanche,
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      titleTextStyle: const TextStyle(
        color: couleurTexte,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      contentTextStyle: const TextStyle(
        color: couleurTexte,
        fontSize: 16,
      ),
    ),

    // Thème pour les boutons élevés (ElevatedButton).
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: couleurPrincipale,
        foregroundColor: couleurBlanche,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
        elevation: 3,
      ),
    ),

    // Thème du texte.
    textTheme: const TextTheme(
      headlineSmall: TextStyle(color: couleurTexte, fontWeight: FontWeight.bold),
      bodyLarge: TextStyle(color: couleurTexte, fontSize: 16, height: 1.5),
      bodyMedium: TextStyle(color: Colors.black87),
    ),

    // Schéma de couleurs général.
    colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.green).copyWith(
      secondary: Colors.lightGreen,
      brightness: Brightness.light,
    ),
  );

  /// Thème sombre de l'application.
  static final ThemeData themeSombre = ThemeData(
    brightness: Brightness.dark,
    primaryColor: couleurPrincipaleSombre,
    scaffoldBackgroundColor: couleurFondSombre,

    // Thème de la barre d'applications (AppBar).
    appBarTheme: AppBarTheme(
      backgroundColor: couleurFondSombre,
      foregroundColor: couleurTexteSombre,
      centerTitle: true,
      elevation: 0,
    ),

    // Thème pour les cartes (Card).
    cardTheme: CardThemeData(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      color: const Color(0xFF1E1E1E),
    ),

    // Thème pour les dialogues (AlertDialog).
    dialogTheme: DialogThemeData(
      backgroundColor: const Color(0xFF2D2D2D),
      surfaceTintColor: const Color(0xFF2D2D2D),
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      titleTextStyle: const TextStyle(
        color: couleurTexteSombre,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      contentTextStyle: const TextStyle(
        color: couleurTexteSombre,
        fontSize: 16,
      ),
    ),

    // Thème pour les boutons élevés (ElevatedButton).
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: couleurPrincipaleSombre,
        foregroundColor: couleurTexteSombre,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
        elevation: 2,
      ),
    ),

    // Thème du texte.
    textTheme: const TextTheme(
      headlineSmall: TextStyle(color: couleurTexteSombre, fontWeight: FontWeight.bold),
      bodyLarge: TextStyle(color: couleurTexteSombre, fontSize: 16, height: 1.5),
      bodyMedium: TextStyle(color: Colors.white70),
    ),

    // Schéma de couleurs général.
    colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.green).copyWith(
      secondary: Colors.lightGreen,
      brightness: Brightness.dark,
      surface: const Color(0xFF1E1E1E),
      background: couleurFondSombre,
      onSurface: couleurTexteSombre,
      onBackground: couleurTexteSombre,
    ),
  );

  /// Thème par défaut (clair).
  static final ThemeData themeData = themeClair;
}
