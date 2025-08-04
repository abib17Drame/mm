import 'package:flutter/material.dart';
import 'package:khatma_flutter/ecrans/ecran_principal.dart';
import 'package:khatma_flutter/theme/theme.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  // Assure que les bindings Flutter sont initialisés avant de lancer l'app.
  // C'est nécessaire pour les opérations asynchrones avant runApp, comme l'accès à la base de données.
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Khatma Flutter',
      theme: AppTheme.themeData,

      // Configuration pour la localisation en français (et arabe implicitement par la direction du texte).
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('fr', ''), // Français
        Locale('ar', ''), // Arabe
      ],

      // La direction du texte par défaut pour l'application est de droite à gauche (RTL),
      // ce qui est approprié pour l'arabe.
      builder: (context, child) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: child!,
        );
      },

      home: const EcranPrincipal(),
      debugShowCheckedModeBanner: false,
    );
  }
}
