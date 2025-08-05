import 'package:flutter/material.dart';
import 'package:khatma_flutter/l10n/l10n.dart';

/// Fournisseur d'état pour la locale (langue) de l'application.
/// Utilise ChangeNotifier pour notifier les widgets lorsque la langue change.
class LocaleProvider with ChangeNotifier {
  // La langue par défaut est l'arabe.
  Locale _locale = const Locale('ar');

  /// La locale actuelle.
  Locale get locale => _locale;

  /// Définit la nouvelle locale de l'application.
  void setLocale(Locale locale) {
    // Vérifie si la langue demandée est supportée.
    if (!L10n.all.contains(locale)) return;

    // Met à jour la locale et notifie les écouteurs.
    _locale = locale;
    notifyListeners();
  }
}
