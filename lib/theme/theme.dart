import 'package:flutter/material.dart';

/// Classe contenant la configuration du thème pour l'application.
/// Définit les couleurs et les styles de police.
class AppTheme {
  // Définition des couleurs principales de l'application.
  static final Color couleurPrincipale = Colors.green[800]!;
  static const Color couleurBlanche = Colors.white;
  static const Color couleurTexte = Colors.black;

  /// Thème global de l'application.
  static final ThemeData themeData = ThemeData(
    primaryColor: couleurPrincipale,
    scaffoldBackgroundColor: couleurBlanche,

    // Thème de la barre d'applications (AppBar).
    appBarTheme: AppBarTheme(
      backgroundColor: couleurPrincipale,
      foregroundColor: couleurBlanche, // Couleur du titre et des icônes.
      centerTitle: true,
    ),

    // Thème pour les cartes (Card).
    cardTheme: CardTheme(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
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
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
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
    ),
  );
}
