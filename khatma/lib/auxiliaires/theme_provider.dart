import 'package:flutter/material.dart';
import '../theme/theme.dart';

/// Fournisseur d'état pour le thème de l'application.
/// Permet de basculer entre le mode clair et sombre.
class ThemeProvider with ChangeNotifier {
  bool _isDarkMode = false;

  /// Indique si le mode sombre est activé.
  bool get isDarkMode => _isDarkMode;

  /// Le thème actuel de l'application.
  ThemeData get theme => _isDarkMode ? AppTheme.themeSombre : AppTheme.themeClair;

  /// Bascule entre le mode clair et sombre.
  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }

  /// Définit le mode sombre.
  void setDarkMode(bool isDark) {
    _isDarkMode = isDark;
    notifyListeners();
  }
} 