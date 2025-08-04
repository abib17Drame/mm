import 'package:flutter/material.dart';
import 'package:khatma_flutter/l10n/app_localizations.dart';
import '../auxiliaires/donnees_statiques.dart';

/// Écran affichant la liste complète des 60 Ahzab du Coran.
class EcranListeAhzab extends StatelessWidget {
  const EcranListeAhzab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    final List<String> ahzab = DonneesStatiques.getListeAhzab();

    return Scaffold(
      appBar: AppBar(
        title: Text(localizations.hizbList),
      ),
      body: ListView.builder(
        itemCount: ahzab.length,
        itemBuilder: (context, index) {
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                ahzab[index],
                style: Theme.of(context).textTheme.bodyLarge,
                textAlign: TextAlign.right, // Alignement pour l'arabe.
              ),
            ),
          );
        },
      ),
    );
  }
}
