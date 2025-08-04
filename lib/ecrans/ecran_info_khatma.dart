import 'package:flutter/material.dart';
import '../auxiliaires/donnees_statiques.dart';

/// Écran affichant les informations sur le programme de la Khatma.
class EcranInfoKhatma extends StatelessWidget {
  const EcranInfoKhatma({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String info = DonneesStatiques.getInfoKhatma();

    return Scaffold(
      appBar: AppBar(
        title: const Text('À propos de la Khatma'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          info,
          style: Theme.of(context).textTheme.bodyLarge,
          textAlign: TextAlign.right,
        ),
      ),
    );
  }
}
