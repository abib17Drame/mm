import 'package:flutter/material.dart';
import 'package:khatma_flutter/ecrans/ecran_principal.dart';
import 'package:khatma_flutter/theme/theme.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:khatma_flutter/l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:khatma_flutter/auxiliaires/locale_provider.dart';
import 'package:khatma_flutter/auxiliaires/theme_provider.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
  // Assure que les bindings Flutter sont initialisés avant de lancer l'app.
  // C'est nécessaire pour les opérations asynchrones avant runApp, comme l'accès à la base de données.
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialise sqflite_common_ffi pour la base de données
  // sqfliteFfiInit();
  // databaseFactory = databaseFactoryFfi;
  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  }
  
  runApp(const MyApp());
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
            title: 'Khatma Flutter',
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
