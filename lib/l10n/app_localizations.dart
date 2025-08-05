import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';
import 'app_localizations_fr.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en'),
    Locale('fr')
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'Khatma Flutter'**
  String get appTitle;

  /// No description provided for @dailyKhatma.
  ///
  /// In en, this message translates to:
  /// **'Daily Khatma'**
  String get dailyKhatma;

  /// No description provided for @navigationMenu.
  ///
  /// In en, this message translates to:
  /// **'Navigation Menu'**
  String get navigationMenu;

  /// No description provided for @hizbList.
  ///
  /// In en, this message translates to:
  /// **'Hizb List'**
  String get hizbList;

  /// No description provided for @khatmaDates.
  ///
  /// In en, this message translates to:
  /// **'Next Khatma Dates'**
  String get khatmaDates;

  /// No description provided for @quranRecitation.
  ///
  /// In en, this message translates to:
  /// **'Quran Completion Duaa'**
  String get quranRecitation;

  /// No description provided for @aboutKhatma.
  ///
  /// In en, this message translates to:
  /// **'About Khatma'**
  String get aboutKhatma;

  /// No description provided for @aboutUs.
  ///
  /// In en, this message translates to:
  /// **'About Us'**
  String get aboutUs;

  /// Title for the Quran reading screen, with a placeholder for the section ID
  ///
  /// In en, this message translates to:
  /// **'Quran Reading (Section {id})'**
  String quranReadingTitle(int id);

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// No description provided for @previous.
  ///
  /// In en, this message translates to:
  /// **'Previous'**
  String get previous;

  /// No description provided for @dataNotAvailable.
  ///
  /// In en, this message translates to:
  /// **'Data not available.'**
  String get dataNotAvailable;

  /// No description provided for @error.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get error;

  /// No description provided for @noDates.
  ///
  /// In en, this message translates to:
  /// **'No dates to display.'**
  String get noDates;

  /// No description provided for @version.
  ///
  /// In en, this message translates to:
  /// **'Version'**
  String get version;

  /// No description provided for @aboutAppText.
  ///
  /// In en, this message translates to:
  /// **'This application is a Flutter reimplementation of the original Khatma App.'**
  String get aboutAppText;

  /// No description provided for @khatmaDateTitle.
  ///
  /// In en, this message translates to:
  /// **'Khatma {index}'**
  String khatmaDateTitle(int index);

  /// No description provided for @quranSectionError.
  ///
  /// In en, this message translates to:
  /// **'Images for section {id} could not be loaded. Only images for section 1 are included in this example.'**
  String quranSectionError(int id);

  /// No description provided for @unimplementedNavigation.
  ///
  /// In en, this message translates to:
  /// **'Navigation for this section is not yet implemented.'**
  String get unimplementedNavigation;

  /// Message displayed when a Quran section is not available
  ///
  /// In en, this message translates to:
  /// **'Section {id} not available'**
  String quranSectionNotAvailable(int id);

  /// No description provided for @quranSectionInfo.
  ///
  /// In en, this message translates to:
  /// **'This section of the Quran is not yet available in this version of the application.'**
  String get quranSectionInfo;

  /// No description provided for @goBack.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get goBack;

  /// No description provided for @imageNotAvailable.
  ///
  /// In en, this message translates to:
  /// **'Image not available'**
  String get imageNotAvailable;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @currentLanguage.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get currentLanguage;

  /// No description provided for @pageNavigation.
  ///
  /// In en, this message translates to:
  /// **'Page Navigation'**
  String get pageNavigation;

  /// Information about the current page
  ///
  /// In en, this message translates to:
  /// **'Page {current} of {total}'**
  String pageInfo(int current, int total);

  /// No description provided for @hizbCompleted.
  ///
  /// In en, this message translates to:
  /// **'Hizb Completed'**
  String get hizbCompleted;

  /// No description provided for @hizbCompletionMessage.
  ///
  /// In en, this message translates to:
  /// **'Congratulations! You have completed this hizb.'**
  String get hizbCompletionMessage;

  /// No description provided for @continueToNextHizb.
  ///
  /// In en, this message translates to:
  /// **'Would you like to continue to the next hizb?'**
  String get continueToNextHizb;

  /// No description provided for @markDayCompleted.
  ///
  /// In en, this message translates to:
  /// **'Mark Day as Completed'**
  String get markDayCompleted;

  /// No description provided for @continueReading.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continueReading;

  /// No description provided for @stayHere.
  ///
  /// In en, this message translates to:
  /// **'Stay Here'**
  String get stayHere;

  /// No description provided for @dayMarkedCompleted.
  ///
  /// In en, this message translates to:
  /// **'Day marked as completed!'**
  String get dayMarkedCompleted;

  /// No description provided for @yes.
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get yes;

  /// No description provided for @no.
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get no;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['ar', 'en', 'fr'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar': return AppLocalizationsAr();
    case 'en': return AppLocalizationsEn();
    case 'fr': return AppLocalizationsFr();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
