import 'package:flutter/widgets.dart';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';

// Classe abstraite pour les localisations.
// C'est une version manuelle de ce que `flutter gen-l10n` produirait.
abstract class AppLocalizations {
  AppLocalizations(this.localeName);

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('fr'),
  ];

  String get appTitle;
  String get dailyKhatma;
  String get navigationMenu;
  String get hizbList;
  String get khatmaDates;
  String get quranRecitation;
  String get aboutKhatma;
  String get aboutUs;
  String quranReadingTitle(int id);
  String get next;
  String get previous;
  String get dataNotAvailable;
  String get error;
  String get noDates;
  String get version;
  String get aboutAppText;
  String khatmaDateTitle(int index);
  String quranSectionError(int id);
  String get unimplementedNavigation;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => AppLocalizations.supportedLocales.contains(locale);

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(getTranslation(locale));
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;

  AppLocalizations getTranslation(Locale locale) {
    switch (locale.languageCode) {
      case 'ar':
        return AppLocalizationsAr();
      case 'fr':
        return AppLocalizationsFr();
      default:
        return AppLocalizationsAr(); // Langue par défaut
    }
  }
}

// Implémentation pour l'Arabe
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr() : super('ar');

  @override
  String get appTitle => 'ختمة فلاتر';
  @override
  String get dailyKhatma => 'الختمة اليومية';
  @override
  String get navigationMenu => 'قائمة التنقل';
  @override
  String get hizbList => 'قائمة الأحزاب';
  @override
  String get khatmaDates => 'تواريخ الختمات القادمة';
  @override
  String get quranRecitation => 'دعاء ختم القرآن';
  @override
  String get aboutKhatma => 'عن الختمة';
  @override
  String get aboutUs => 'عنا';
  @override
  String quranReadingTitle(int id) => 'قراءة القرآن (الجزء $id)';
  @override
  String get next => 'التالي';
  @override
  String get previous => 'السابق';
  @override
  String get dataNotAvailable => 'البيانات غير متوفرة.';
  @override
  String get error => 'خطأ';
  @override
  String get noDates => 'لا تواريخ لعرضها.';
  @override
  String get version => 'الإصدار';
  @override
  String get aboutAppText => 'هذا التطبيق هو إعادة تنفيذ لتطبيق ختمة الأصلي باستخدام فلاتر.';
  @override
  String khatmaDateTitle(int index) => 'ختمة $index';
  @override
  String quranSectionError(int id) => 'تعذر تحميل الصور للجزء $id. يتضمن هذا المثال الصور للجزء 1 فقط.';
  @override
  String get unimplementedNavigation => 'التنقل لهذا القسم لم يتم تنفيذه بعد.';
}

// Implémentation pour le Français
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr() : super('fr');

  @override
  String get appTitle => 'Khatma Flutter';
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
  String quranReadingTitle(int id) => 'Lecture du Coran (Section $id)';
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
  String khatmaDateTitle(int index) => 'Khatma $index';
  @override
  String quranSectionError(int id) => 'Les images pour la section $id n\'ont pas pu être chargées. Seules les images pour la section 1 sont incluses dans cet exemple.';
  @override
  String get unimplementedNavigation => 'La navigation pour cette section n\'est pas encore implémentée.';
}
