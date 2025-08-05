// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

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
  String quranReadingTitle(int id) {
    return 'قراءة القرآن (الجزء $id)';
  }

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
  String khatmaDateTitle(int index) {
    return 'ختمة $index';
  }

  @override
  String quranSectionError(int id) {
    return 'تعذر تحميل الصور للجزء $id. يتضمن هذا المثال الصور للجزء 1 فقط.';
  }

  @override
  String get unimplementedNavigation => 'التنقل لهذا القسم لم يتم تنفيذه بعد.';

  @override
  String quranSectionNotAvailable(int id) {
    return 'الجزء $id غير متوفر';
  }

  @override
  String get quranSectionInfo => 'هذا الجزء من القرآن غير متوفر في هذه النسخة من التطبيق.';

  @override
  String get goBack => 'رجوع';

  @override
  String get imageNotAvailable => 'الصورة غير متوفرة';

  @override
  String get language => 'اللغة';

  @override
  String get currentLanguage => 'العربية';

  @override
  String get pageNavigation => 'تنقل الصفحات';

  @override
  String pageInfo(int current, int total) {
    return 'صفحة $current من $total';
  }

  @override
  String get hizbCompleted => 'الحزب مكتمل';

  @override
  String get hizbCompletionMessage => 'تهانينا ! لقد أكملت هذا الحزب.';

  @override
  String get continueToNextHizb => 'هل تريد المتابعة إلى الحزب التالي؟';

  @override
  String get markDayCompleted => 'تحديد اليوم كمكتمل';

  @override
  String get continueReading => 'متابعة';

  @override
  String get stayHere => 'البقاء هنا';

  @override
  String get dayMarkedCompleted => 'تم تحديد اليوم كمكتمل !';

  @override
  String get yes => 'نعم';

  @override
  String get no => 'لا';
}
