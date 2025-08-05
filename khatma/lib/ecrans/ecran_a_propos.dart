import 'package:flutter/material.dart';
import '../l10n/app_localizations.dart';

/// Écran simple "À propos".
class EcranAPropos extends StatelessWidget {
  const EcranAPropos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(localizations?.aboutUs ?? 'À propos de nous'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/icon/ic_launcher.png', height: 100),
              const SizedBox(height: 20),
              Text(
                localizations?.appTitle ?? 'Khatma Flutter',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 10),
              Text(
                '${localizations?.version ?? 'Version'} 1.0.0',
                style: const TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 20),
              Text(
                localizations?.aboutAppText ?? 'Cette application est une réimplémentation en Flutter '
                'de l\'application originale Khatma App.',
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
