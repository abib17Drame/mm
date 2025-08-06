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
  String get aboutKhatma => 'About Khatma';

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
  String get hizbCompleted => 'Hizb Completed';

  @override
  String get hizbCompletionMessage => 'Congratulations! You have completed this hizb.';

  @override
  String get continueToNextHizb => 'Would you like to continue to the next hizb?';

  @override
  String get markDayCompleted => 'Mark Day as Completed';

  @override
  String get continueReading => 'Continue';

  @override
  String get stayHere => 'Stay Here';

  @override
  String get dayMarkedCompleted => 'Day marked as completed!';

  @override
  String get yes => 'Yes';

  @override
  String get no => 'No';

  @override
  String get hizb60Completed => 'Hizb 60 Completed';

  @override
  String get hizb60CompletionMessage => 'Congratulations! You have completed the last hizb of the Quran.';

  @override
  String get continueToDuaa => 'Would you like to continue to the Duaa of Khatm Al-Quran?';

  @override
  String get khatmaCompleted => 'Khatma Completed';

  @override
  String get khatmaCompletionMessage => 'Congratulations! You have completed the full Khatma.';

  @override
  String get continueToNewKhatma => 'Would you like to start a new Khatma?';
}
