import 'package:flutter/material.dart';
import '../auxiliaires/donnees_statiques.dart';

/// Écran affichant le Duaa (prière) de la ختم القرآن.
class EcranDuaa extends StatelessWidget {
  const EcranDuaa({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String duaa = DonneesStatiques.getDuaa();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Duaa Khatm Al-Quran'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          duaa,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            fontFamily: 'Amiri', // Une police qui rend bien l'arabe est recommandée
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
