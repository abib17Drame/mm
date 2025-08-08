// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get appTitle => 'حزب الإدارة';

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
  String get aboutKhatma => 'عن التطبيق';

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
    return 'الصفحة $current من $total';
  }

  @override
  String get hizbCompleted => 'تم إكمال الحزب';

  @override
  String get hizbCompletionMessage => 'تهانينا! لقد أكملت هذا الحزب.';

  @override
  String get continueToNextHizb => 'هل تريد المتابعة إلى الحزب التالي؟';

  @override
  String get hizb60Completed => 'تم إكمال الحزب 60';

  @override
  String get hizb60CompletionMessage => 'تهانينا! لقد أكملت آخر حزب من القرآن.';

  @override
  String get continueToDuaa => 'هل تريد المتابعة إلى دعاء ختم القرآن؟';

  @override
  String get yes => 'نعم';

  @override
  String get no => 'لا';

  @override
  String get dayMarkedCompleted => 'تم تحديد اليوم كمكتمل!';

  @override
  String get khatmaCompleted => 'تم إكمال الختمة';

  @override
  String get khatmaCompletionMessage => 'تهانينا! لقد أكملت الختمة الكاملة.';

  @override
  String get continueToNewKhatma => 'هل تريد بدء ختمة جديدة؟';

  @override
  String get aboutAppTitle => 'عن هذا التطبيق';

  @override
  String get aboutAppDescription => 'ختمة فلاتر هو تطبيق حديث تم تطويره لتسهيل القراءة اليومية للقرآن الكريم حسب البرنامج التقليدي \"ختمة الإدارة\".';

  @override
  String get aboutAppObjectives => 'أهداف التطبيق';

  @override
  String get aboutAppQuranReading => 'قراءة القرآن : عرض صفحات القرآن مع التكبير والتنقل السلس';

  @override
  String get aboutAppDailyTracking => 'المتابعة اليومية : حساب الأحزاب التي يجب قراءتها كل يوم تلقائياً';

  @override
  String get aboutAppTemporalNavigation => 'التنقل الزمني : السماح بالتنقل بين الأيام الماضية والمستقبلية';

  @override
  String get aboutAppCompleteList => 'القائمة الكاملة : عرض جميع الأحزاب الستين مع تفاصيلها';

  @override
  String get aboutAppCompletionDuaa => 'دعاء الختم : تضمين دعاء ختم القرآن الكريم الكامل';

  @override
  String get aboutAppKhatmaDates => 'تواريخ الختمات : حساب وعرض التواريخ القادمة';

  @override
  String get aboutAppMultilingual => 'الميزات متعددة اللغات';

  @override
  String get aboutAppMultilingualDesc => 'دعم كامل بالفرنسية والعربية والإنجليزية';

  @override
  String get aboutAppLanguageChange => 'تغيير اللغة ديناميكياً';

  @override
  String get aboutAppInterfaceAdapted => 'واجهة متكيفة مع كل ثقافة';

  @override
  String get aboutAppPersonalization => 'التخصيص';

  @override
  String get aboutAppLightDarkMode => 'الوضع الفاتح والوضع المظلم';

  @override
  String get aboutAppAdaptiveThemes => 'السمات المتكيفة';

  @override
  String get aboutAppModernInterface => 'واجهة حديثة وبديهية';

  @override
  String get aboutAppCompatibility => 'التوافق';

  @override
  String get aboutAppAndroid => 'أندرويد (الهواتف والأجهزة اللوحية)';

  @override
  String get aboutAppIOS => 'آي أو إس (آيفون وآيباد)';

  @override
  String get aboutAppWindows => 'ويندوز (أجهزة الكمبيوتر)';

  @override
  String get aboutAppMacOS => 'ماك أو إس (ماك)';

  @override
  String get aboutAppLinux => 'لينكس (أجهزة الكمبيوتر)';

  @override
  String get aboutAppTechnicalFeatures => 'الميزات التقنية';

  @override
  String get aboutAppSQLite => 'قاعدة بيانات محلية SQLite';

  @override
  String get aboutAppOfflineMode => 'وضع عدم الاتصال الكامل';

  @override
  String get aboutAppImageSharing => 'مشاركة الصور والمستندات';

  @override
  String get aboutAppPDFExport => 'تصدير PDF للدعاء';

  @override
  String get aboutAppAutoBackup => 'النسخ الاحتياطي التلقائي للتفضيلات';

  @override
  String get aboutAppPerformance => 'الأداء';

  @override
  String get aboutAppFastLoading => 'تحميل سريع للصور';

  @override
  String get aboutAppSmoothNavigation => 'تنقل سلس';

  @override
  String get aboutAppMemoryOptimization => 'تحسين الذاكرة';

  @override
  String get aboutAppResponsiveInterface => 'واجهة مستجيبة';

  @override
  String get aboutAppDevelopment => 'التطوير';

  @override
  String get aboutAppFlutterFramework => 'إطار عمل فلاتر الحديث';

  @override
  String get aboutAppModularArchitecture => 'هندسة معيارية';

  @override
  String get aboutAppMaintainableCode => 'كود قابل للصيانة والتوسيع';

  @override
  String get aboutAppTestsDocumentation => 'الاختبارات والتوثيق';

  @override
  String get aboutAppSupport => 'الدعم';

  @override
  String get aboutAppIntuitiveInterface => 'واجهة بديهية';

  @override
  String get aboutAppErrorHandling => 'معالجة الأخطاء بأمان';

  @override
  String get aboutAppHelpMessages => 'رسائل المساعدة السياقية';

  @override
  String get aboutAppRegularUpdates => 'التحديثات المنتظمة';
}
