import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../auxiliaires/logique_date.dart';
import '../auxiliaires/aideur_base_de_donnees.dart';

/// Écran affichant les dates des 10 prochaines Khatmas.
class EcranDatesKhatma extends StatefulWidget {
  const EcranDatesKhatma({Key? key}) : super(key: key);

  @override
  _EcranDatesKhatmaState createState() => _EcranDatesKhatmaState();
}

class _EcranDatesKhatmaState extends State<EcranDatesKhatma> {
  Future<List<DateTime>>? _futureDates;

  @override
  void initState() {
    super.initState();
    _futureDates = _chargerDates();
  }

  /// Charge la date de session initiale et calcule les 10 prochaines dates.
  Future<List<DateTime>> _chargerDates() async {
    final dbHelper = AideurBaseDeDonnees.instance;
    DateTime? session = await dbHelper.getDernierSession();
    // Si la session n'est pas trouvée, on utilise une date par défaut.
    session ??= DateTime(2016, 2, 17);
    return LogiqueDate.liste10khatma(session);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dates des prochaines Khatmas'),
      ),
      body: FutureBuilder<List<DateTime>>(
        future: _futureDates,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erreur: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('Aucune date à afficher.'));
          }

          final dates = snapshot.data!;
          final format = DateFormat('EEEE d MMMM yyyy', 'fr_FR');

          return ListView.builder(
            itemCount: dates.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  title: Text('Khatma ${index + 1}'),
                  subtitle: Text(format.format(dates[index])),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
