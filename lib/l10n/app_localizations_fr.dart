// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get appTitle => 'حزب الإدارة';

  @override
  String get dailyKhatma => 'Khatma Quotidienne';

  @override
  String get navigationMenu => 'Menu de navigation';

  @override
  String get hizbList => 'Liste des Ahzab';

  @override
  String get khatmaDates => 'Dates des prochaines Khatmas';

  @override
  String get quranRecitation => 'Duaa Khatm Al-Quran';

  @override
  String get aboutKhatma => 'À propos de la Khatma';

  @override
  String get aboutUs => 'À propos de nous';

  @override
  String quranReadingTitle(int id) {
    return 'Lecture du Coran (Section $id)';
  }

  @override
  String get next => 'Suivant';

  @override
  String get previous => 'Précédent';

  @override
  String get dataNotAvailable => 'Données non disponibles.';

  @override
  String get error => 'Erreur';

  @override
  String get noDates => 'Aucune date à afficher.';

  @override
  String get version => 'Version';

  @override
  String get aboutAppText => 'Cette application est une réimplémentation en Flutter de l\'application originale Khatma App.';

  @override
  String khatmaDateTitle(int index) {
    return 'Khatma $index';
  }

  @override
  String quranSectionError(int id) {
    return 'Les images pour la section $id n\'ont pas pu être chargées. Seules les images pour la section 1 sont incluses dans cet exemple.';
  }

  @override
  String get unimplementedNavigation => 'La navigation pour cette section n\'est pas encore implémentée.';

  @override
  String quranSectionNotAvailable(int id) {
    return 'Section $id non disponible';
  }

  @override
  String get quranSectionInfo => 'Cette section du Coran n\'est pas encore disponible dans cette version de l\'application.';

  @override
  String get goBack => 'Retour';

  @override
  String get imageNotAvailable => 'Image non disponible';

  @override
  String get language => 'Langue';

  @override
  String get currentLanguage => 'Français';

  @override
  String get pageNavigation => 'Navigation des pages';

  @override
  String pageInfo(int current, int total) {
    return 'Page $current sur $total';
  }

  @override
  String get hizbCompleted => 'Hizb terminé';

  @override
  String get hizbCompletionMessage => 'Félicitations ! Vous avez terminé ce hizb.';

  @override
  String get continueToNextHizb => 'Voulez-vous continuer vers le hizb suivant ?';

  @override
  String get markDayCompleted => 'Marquer la journée terminée';

  @override
  String get continueReading => 'Continuer';

  @override
  String get stayHere => 'Rester ici';

  @override
  String get dayMarkedCompleted => 'Journée marquée comme terminée !';

  @override
  String get yes => 'Oui';

  @override
  String get no => 'Non';

  @override
  String get hizb60Completed => 'Hizb 60 terminé';

  @override
  String get hizb60CompletionMessage => 'Félicitations ! Vous avez terminé le dernier hizb du Coran.';

  @override
  String get continueToDuaa => 'Voulez-vous continuer vers le Duaa de Khatm Al-Quran ?';

  @override
  String get khatmaCompleted => 'Khatma terminée';

  @override
  String get khatmaCompletionMessage => 'Félicitations ! Vous avez terminé la Khatma complète.';

  @override
  String get continueToNewKhatma => 'Voulez-vous commencer une nouvelle Khatma ?';
}
