import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:khatma_flutter/ecrans/ecran_principal.dart';
import 'package:khatma_flutter/theme/theme.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:khatma_flutter/l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:khatma_flutter/auxiliaires/locale_provider.dart';
import 'package:khatma_flutter/auxiliaires/theme_provider.dart';

// Import pour sqflite_common_ffi (nécessaire pour Windows)
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
  // Assure que les bindings Flutter sont initialisés avant de lancer l'app.
  // C'est nécessaire pour les opérations asynchrones avant runApp, comme l'accès à la base de données.
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialisation conditionnelle de sqflite_common_ffi seulement pour desktop
  if (!kIsWeb && defaultTargetPlatform != TargetPlatform.android) {
    try {
      // Import conditionnel pour éviter les problèmes sur Android
      _initializeDesktopDatabase();
    } catch (e) {
      print('Desktop database initialization failed: $e');
    }
  }
  
  runApp(const MyApp());
}

/// Initialise la base de données pour desktop (Windows/Linux/macOS)
void _initializeDesktopDatabase() {
  // Import dynamique pour éviter les problèmes de compilation sur Android
  try {
    // Cette fonction sera appelée seulement sur desktop
    // L'import de sqflite_common_ffi se fait ici pour éviter les problèmes sur Android
    _initFfiForDesktop();
  } catch (e) {
    print('FFI initialization error: $e');
  }
}

/// Initialisation sécurisée de FFI pour desktop
void _initFfiForDesktop() {
  // Import conditionnel - cette partie ne sera exécutée que sur desktop
  try {
    // Initialiser sqflite_common_ffi pour Windows/Linux/macOS
    _initializeSqfliteFfi();
  } catch (e) {
    print('Desktop database init error: $e');
  }
}

/// Initialise sqflite_common_ffi pour desktop
void _initializeSqfliteFfi() {
  try {
    // Import dynamique pour éviter les problèmes de compilation sur Android
    // Cette fonction sera appelée seulement sur desktop
    _initFfiSafely();
  } catch (e) {
    print('FFI initialization error: $e');
  }
}

/// Initialisation sécurisée de FFI
void _initFfiSafely() {
  // Cette méthode sera remplacée par une implémentation plus sûre
  // Pour l'instant, on utilise une approche simple
  if (!kIsWeb && defaultTargetPlatform != TargetPlatform.android) {
    // Import conditionnel - cette partie ne sera exécutée que sur desktop
    try {
      // Initialiser sqflite_common_ffi pour Windows/Linux/macOS
      sqfliteFfiInit();
      databaseFactory = databaseFactoryFfi;
      print('Desktop database initialization successful');
    } catch (e) {
      print('Desktop database init error: $e');
    }
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LocaleProvider()),
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ],
      child: Consumer2<LocaleProvider, ThemeProvider>(
        builder: (context, localeProvider, themeProvider, child) {
          return MaterialApp(
            title: 'حزب الإدارة',
            theme: themeProvider.theme,

            // Configuration pour la localisation en français (et arabe implicitement par la direction du texte).
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale('fr', ''), // Français
              Locale('ar', ''), // Arabe
            ],

            // Configuration de la locale dynamique
            locale: localeProvider.locale,

            // Forcer le TextDirection RTL pour toutes les langues
            builder: (context, child) {
              return Directionality(
                textDirection: TextDirection.rtl,
                child: child!,
              );
            },

            home: const EcranPrincipal(),
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}
