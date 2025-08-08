// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'حزب الإدارة';

  @override
  String get dailyKhatma => 'Daily Khatma';

  @override
  String get navigationMenu => 'Navigation Menu';

  @override
  String get hizbList => 'Hizb List';

  @override
  String get khatmaDates => 'Next Khatma Dates';

  @override
  String get quranRecitation => 'Quran Completion Duaa';

  @override
  String get aboutKhatma => 'About the application';

  @override
  String get aboutUs => 'About Us';

  @override
  String quranReadingTitle(int id) {
    return 'Quran Reading (Section $id)';
  }

  @override
  String get next => 'Next';

  @override
  String get previous => 'Previous';

  @override
  String get dataNotAvailable => 'Data not available.';

  @override
  String get error => 'Error';

  @override
  String get noDates => 'No dates to display.';

  @override
  String get version => 'Version';

  @override
  String get aboutAppText => 'This application is a Flutter reimplementation of the original Khatma App.';

  @override
  String khatmaDateTitle(int index) {
    return 'Khatma $index';
  }

  @override
  String quranSectionError(int id) {
    return 'Images for section $id could not be loaded. Only images for section 1 are included in this example.';
  }

  @override
  String get unimplementedNavigation => 'Navigation for this section is not yet implemented.';

  @override
  String quranSectionNotAvailable(int id) {
    return 'Section $id not available';
  }

  @override
  String get quranSectionInfo => 'This section of the Quran is not yet available in this version of the application.';

  @override
  String get goBack => 'Back';

  @override
  String get imageNotAvailable => 'Image not available';

  @override
  String get language => 'Language';

  @override
  String get currentLanguage => 'English';

  @override
  String get pageNavigation => 'Page Navigation';

  @override
  String pageInfo(int current, int total) {
    return 'Page $current of $total';
  }

  @override
  String get hizbCompleted => 'Hizb completed';

  @override
  String get hizbCompletionMessage => 'Congratulations! You have completed this hizb.';

  @override
  String get continueToNextHizb => 'Do you want to continue to the next hizb?';

  @override
  String get hizb60Completed => 'Hizb 60 completed';

  @override
  String get hizb60CompletionMessage => 'Congratulations! You have completed the last hizb of the Quran.';

  @override
  String get continueToDuaa => 'Do you want to continue to the Khatm Al-Quran Duaa?';

  @override
  String get yes => 'Yes';

  @override
  String get no => 'No';

  @override
  String get dayMarkedCompleted => 'Day marked as completed!';

  @override
  String get khatmaCompleted => 'Khatma completed';

  @override
  String get khatmaCompletionMessage => 'Congratulations! You have completed the complete Khatma.';

  @override
  String get continueToNewKhatma => 'Do you want to start a new Khatma?';

  @override
  String get aboutAppTitle => 'About this application';

  @override
  String get aboutAppDescription => 'Khatma Flutter is a modern application developed to facilitate daily Quran reading according to the traditional \"ختمة الإدارة\" (Administration Khatma) program.';

  @override
  String get aboutAppObjectives => 'Application objectives';

  @override
  String get aboutAppQuranReading => 'Quran Reading : Display Quran pages with zoom and smooth navigation';

  @override
  String get aboutAppDailyTracking => 'Daily tracking : Automatically calculate hizb to read each day';

  @override
  String get aboutAppTemporalNavigation => 'Temporal navigation : Allow navigation between past and future days';

  @override
  String get aboutAppCompleteList => 'Complete list : Display all 60 hizb with their details';

  @override
  String get aboutAppCompletionDuaa => 'Completion dua\'a : Include the complete Khatm Al-Quran dua\'a';

  @override
  String get aboutAppKhatmaDates => 'Khatma dates : Calculate and display upcoming dates';

  @override
  String get aboutAppMultilingual => 'Multilingual features';

  @override
  String get aboutAppMultilingualDesc => 'Complete support in French, Arabic and English';

  @override
  String get aboutAppLanguageChange => 'Dynamic language switching';

  @override
  String get aboutAppInterfaceAdapted => 'Interface adapted to each culture';

  @override
  String get aboutAppPersonalization => 'Personalization';

  @override
  String get aboutAppLightDarkMode => 'Light and dark mode';

  @override
  String get aboutAppAdaptiveThemes => 'Adaptive themes';

  @override
  String get aboutAppModernInterface => 'Modern and intuitive interface';

  @override
  String get aboutAppCompatibility => 'Compatibility';

  @override
  String get aboutAppAndroid => 'Android (phones and tablets)';

  @override
  String get aboutAppIOS => 'iOS (iPhone and iPad)';

  @override
  String get aboutAppWindows => 'Windows (computers)';

  @override
  String get aboutAppMacOS => 'macOS (Mac)';

  @override
  String get aboutAppLinux => 'Linux (computers)';

  @override
  String get aboutAppTechnicalFeatures => 'Technical features';

  @override
  String get aboutAppSQLite => 'Local SQLite database';

  @override
  String get aboutAppOfflineMode => 'Complete offline mode';

  @override
  String get aboutAppImageSharing => 'Image and document sharing';

  @override
  String get aboutAppPDFExport => 'PDF export of dua\'a';

  @override
  String get aboutAppAutoBackup => 'Automatic preference backup';

  @override
  String get aboutAppPerformance => 'Performance';

  @override
  String get aboutAppFastLoading => 'Fast image loading';

  @override
  String get aboutAppSmoothNavigation => 'Smooth navigation';

  @override
  String get aboutAppMemoryOptimization => 'Memory optimization';

  @override
  String get aboutAppResponsiveInterface => 'Responsive interface';

  @override
  String get aboutAppDevelopment => 'Development';

  @override
  String get aboutAppFlutterFramework => 'Modern Flutter framework';

  @override
  String get aboutAppModularArchitecture => 'Modular architecture';

  @override
  String get aboutAppMaintainableCode => 'Maintainable and extensible code';

  @override
  String get aboutAppTestsDocumentation => 'Tests and documentation';

  @override
  String get aboutAppSupport => 'Support';

  @override
  String get aboutAppIntuitiveInterface => 'Intuitive interface';

  @override
  String get aboutAppErrorHandling => 'Graceful error handling';

  @override
  String get aboutAppHelpMessages => 'Contextual help messages';

  @override
  String get aboutAppRegularUpdates => 'Regular updates';
}
