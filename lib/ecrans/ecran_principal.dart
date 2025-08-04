import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:khatma_flutter/ecrans/ecran_a_propos.dart';
import 'package:khatma_flutter/ecrans/ecran_dates_khatma.dart';
import 'package:khatma_flutter/ecrans/ecran_duaa.dart';
import 'package:khatma_flutter/ecrans/ecran_info_khatma.dart';
import 'package:khatma_flutter/ecrans/ecran_liste_ahzab.dart';
import 'package:khatma_flutter/ecrans/ecran_quran.dart';
import '../auxiliaires/aideur_base_de_donnees.dart';
import '../auxiliaires/logique_date.dart';
import '../modeles/khatma.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class EcranPrincipal extends StatefulWidget {
  const EcranPrincipal({Key? key}) : super(key: key);

  @override
  _EcranPrincipalState createState() => _EcranPrincipalState();
}

class _EcranPrincipalState extends State<EcranPrincipal> {
  late AideurBaseDeDonnees _dbHelper;
  DateTime _dateAffichee = DateTime.now();
  DateTime _session = DateTime(2016, 2, 17); // Date de session initiale comme dans l'app originale
  Khatma? _khatmaDuJour;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    // Initialise les données de localisation pour le formatage des dates en français.
    initializeDateFormatting('fr_FR', null).then((_) {
      _dbHelper = AideurBaseDeDonnees.instance;
      _initialiser();
    });
  }

  /// Prépare la base de données et charge les données pour la date initiale.
  Future<void> _initialiser() async {
    // S'assure que la base de données est prête.
    await _dbHelper.database;

    // Récupère la dernière session de la base de données.
    DateTime? sessionBd = await _dbHelper.getDernierSession();

    if (sessionBd != null) {
      _session = LogiqueDate.majSession(sessionBd);
      // Si la session a été mise à jour, on la sauvegarde en BD.
      if (_session.millisecondsSinceEpoch != sessionBd.millisecondsSinceEpoch) {
        await _dbHelper.updateSession(_session);
      }
    } else {
      // Si aucune session n'est en BD (premier lancement), on initialise la première.
      _session = LogiqueDate.majSession(_session);
      // La date de la première ligne est mise à jour pour marquer le début de la session.
      await _dbHelper.updateSession(_session);
    }

    // Charge les données pour la date actuelle.
    _chargerDonneesPourDate(_dateAffichee);
  }

  /// Charge les données de la Khatma pour une date donnée.
  void _chargerDonneesPourDate(DateTime date) async {
    setState(() {
      _isLoading = true;
    });
    int idJour = LogiqueDate.rechercheIdJour(_session, date);
    _khatmaDuJour = await _dbHelper.getLigneById(idJour);
    setState(() {
      _isLoading = false;
    });
  }

  // Fonctions de navigation entre les jours.
  void _jourPrecedent() {
    setState(() {
      _dateAffichee = _dateAffichee.subtract(const Duration(days: 1));
    });
    _chargerDonneesPourDate(_dateAffichee);
  }

  void _jourSuivant() {
    setState(() {
      _dateAffichee = _dateAffichee.add(const Duration(days: 1));
    });
    _chargerDonneesPourDate(_dateAffichee);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Khatma Quotidienne'),
      ),
      drawer: _buildDrawer(context),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _khatmaDuJour == null
              ? const Center(child: Text("Données non disponibles."))
              : Column(
                  children: [
                    _buildEnteteDate(context),
                    Expanded(
                      child: ListView(
                        padding: const EdgeInsets.all(8.0),
                        children: [
                          _buildCarteLecture(context, _khatmaDuJour!.verser1, 1),
                          _buildCarteLecture(context, _khatmaDuJour!.verser2, 2),
                          _buildCarteLecture(context, _khatmaDuJour!.verser3, 3),
                        ],
                      ),
                    ),
                    _buildBarreNavigation(context),
                  ],
                ),
    );
  }

  /// Widget pour l'en-tête affichant la date.
  Widget _buildEnteteDate(BuildContext context) {
    // Formateur de date en français.
    final format = DateFormat('EEEE d MMMM yyyy', 'fr_FR');
    return Container(
      padding: const EdgeInsets.all(12.0),
      width: double.infinity,
      color: Theme.of(context).primaryColor.withOpacity(0.1),
      child: Text(
        '${_khatmaDuJour!.jour} - ${format.format(_dateAffichee)}',
        style: Theme.of(context).textTheme.headlineSmall,
        textAlign: TextAlign.center,
      ),
    );
  }

  /// Widget pour une carte de lecture cliquable.
  Widget _buildCarteLecture(BuildContext context, String titre, int position) {
    return Card(
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        title: Text(
          titre,
          style: Theme.of(context).textTheme.bodyLarge,
          textAlign: TextAlign.center,
          textDirection: TextDirection.rtl, // Assure que le texte arabe est bien aligné.
        ),
        onTap: () {
          int idJour = LogiqueDate.rechercheIdJour(_session, _dateAffichee);
          int idCoran = _calculerIdCoran(idJour, position);

          if(idCoran > 0) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => EcranQuran(idCoran: idCoran),
              ),
            );
          } else {
            // Affiche un message si la logique de calcul de l'ID n'est pas implémentée pour ce cas
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("La navigation pour cette section n'est pas encore implémentée."))
            );
          }
        },
      ),
    );
  }

  /// Widget pour la barre de navigation "Précédent" / "Suivant".
  Widget _buildBarreNavigation(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ElevatedButton.icon(
            onPressed: _jourSuivant, // La logique est inversée car RTL
            icon: const Icon(Icons.arrow_back),
            label: const Text('Suivant'),
          ),
          ElevatedButton.icon(
            onPressed: _jourPrecedent, // La logique est inversée car RTL
            icon: const Icon(Icons.arrow_forward),
            label: const Text('Précédent'),
          ),
        ],
      ),
    );
  }

  /// Calcule l'ID de la section du Coran à afficher.
  /// La logique est une reconstruction basée sur `visualisationQuran` du code Java.
  int _calculerIdCoran(int idJour, int positionDansListe) {
    // La logique originale est un grand switch-case. On la reproduit ici.
    // C'est verbeux mais fidèle à l'original.
    switch (idJour) {
      case 1:
        if (positionDansListe == 1) return 59;
        if (positionDansListe == 2) return 60;
        if (positionDansListe == 3) return 1;
        break;
      case 2:
        if (positionDansListe == 1) return 2;
        if (positionDansListe == 2) return 3;
        if (positionDansListe == 3) return 4;
        break;
      // ... et ainsi de suite pour les 21 jours.
      // Pour la démo, on ne complète pas tout, mais on montre le principe.
      default:
        // Retourne 0 ou un ID invalide si non trouvé.
        return 0;
    }
    return 0;
  }

  /// Construit le menu de navigation latéral (Drawer).
  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
            child: const Text(
              'Menu de navigation',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.list_alt),
            title: const Text('Liste des Ahzab'),
            onTap: () {
              Navigator.pop(context); // Ferme le drawer
              Navigator.push(context, MaterialPageRoute(builder: (context) => const EcranListeAhzab()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.calendar_today),
            title: const Text('Dates des Khatmas'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context) => const EcranDatesKhatma()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.book),
            title: const Text('Duaa Khatm Al-Quran'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context) => const EcranDuaa()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.info_outline),
            title: const Text('À propos de la Khatma'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context) => const EcranInfoKhatma()));
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.person_outline),
            title: const Text('À propos de nous'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context) => const EcranAPropos()));
            },
          ),
        ],
      ),
    );
  }
}
