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
  String get aboutKhatma => 'À propos de l\'application';

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
  String get hizb60Completed => 'Hizb 60 terminé';

  @override
  String get hizb60CompletionMessage => 'Félicitations ! Vous avez terminé le dernier hizb du Coran.';

  @override
  String get continueToDuaa => 'Voulez-vous continuer vers le Duaa de Khatm Al-Quran ?';

  @override
  String get yes => 'Oui';

  @override
  String get no => 'Non';

  @override
  String get dayMarkedCompleted => 'Journée marquée comme terminée !';

  @override
  String get khatmaCompleted => 'Khatma terminée';

  @override
  String get khatmaCompletionMessage => 'Félicitations ! Vous avez terminé la Khatma complète.';

  @override
  String get continueToNewKhatma => 'Voulez-vous commencer une nouvelle Khatma ?';

  @override
  String get aboutAppTitle => 'À propos de cette application';

  @override
  String get aboutAppDescription => 'Khatma Flutter est une application moderne développée pour faciliter la lecture quotidienne du Coran selon le programme traditionnel \"ختمة الإدارة\" (Khatma de l\'Administration).';

  @override
  String get aboutAppObjectives => 'Objectifs de l\'application';

  @override
  String get aboutAppQuranReading => 'Lecture du Coran : Afficher les pages du Coran avec zoom et navigation fluide';

  @override
  String get aboutAppDailyTracking => 'Suivi quotidien : Calculer automatiquement les hizb à lire chaque jour';

  @override
  String get aboutAppTemporalNavigation => 'Navigation temporelle : Permettre de naviguer entre les jours passés et futurs';

  @override
  String get aboutAppCompleteList => 'Liste complète : Afficher tous les 60 hizb avec leurs détails';

  @override
  String get aboutAppCompletionDuaa => 'Dua\'a de fin : Inclure le dua\'a complet de Khatm Al-Quran';

  @override
  String get aboutAppKhatmaDates => 'Dates des Khatmas : Calculer et afficher les prochaines dates';

  @override
  String get aboutAppMultilingual => 'Fonctionnalités multilingues';

  @override
  String get aboutAppMultilingualDesc => 'Support complet en français, arabe et anglais';

  @override
  String get aboutAppLanguageChange => 'Changement dynamique de langue';

  @override
  String get aboutAppInterfaceAdapted => 'Interface adaptée à chaque culture';

  @override
  String get aboutAppPersonalization => 'Personnalisation';

  @override
  String get aboutAppLightDarkMode => 'Mode clair et mode sombre';

  @override
  String get aboutAppAdaptiveThemes => 'Thèmes adaptatifs';

  @override
  String get aboutAppModernInterface => 'Interface moderne et intuitive';

  @override
  String get aboutAppCompatibility => 'Compatibilité';

  @override
  String get aboutAppAndroid => 'Android (téléphones et tablettes)';

  @override
  String get aboutAppIOS => 'iOS (iPhone et iPad)';

  @override
  String get aboutAppWindows => 'Windows (ordinateurs)';

  @override
  String get aboutAppMacOS => 'macOS (Mac)';

  @override
  String get aboutAppLinux => 'Linux (ordinateurs)';

  @override
  String get aboutAppTechnicalFeatures => 'Fonctionnalités techniques';

  @override
  String get aboutAppSQLite => 'Base de données locale SQLite';

  @override
  String get aboutAppOfflineMode => 'Mode hors ligne complet';

  @override
  String get aboutAppImageSharing => 'Partage d\'images et de documents';

  @override
  String get aboutAppPDFExport => 'Export PDF du dua\'a';

  @override
  String get aboutAppAutoBackup => 'Sauvegarde automatique des préférences';

  @override
  String get aboutAppPerformance => 'Performance';

  @override
  String get aboutAppFastLoading => 'Chargement rapide des images';

  @override
  String get aboutAppSmoothNavigation => 'Navigation fluide';

  @override
  String get aboutAppMemoryOptimization => 'Optimisation mémoire';

  @override
  String get aboutAppResponsiveInterface => 'Interface réactive';

  @override
  String get aboutAppDevelopment => 'Développement';

  @override
  String get aboutAppFlutterFramework => 'Framework Flutter moderne';

  @override
  String get aboutAppModularArchitecture => 'Architecture modulaire';

  @override
  String get aboutAppMaintainableCode => 'Code maintenable et extensible';

  @override
  String get aboutAppTestsDocumentation => 'Tests et documentation';

  @override
  String get aboutAppSupport => 'Support';

  @override
  String get aboutAppIntuitiveInterface => 'Interface intuitive';

  @override
  String get aboutAppErrorHandling => 'Gestion d\'erreurs gracieuse';

  @override
  String get aboutAppHelpMessages => 'Messages d\'aide contextuels';

  @override
  String get aboutAppRegularUpdates => 'Mises à jour régulières';
}
