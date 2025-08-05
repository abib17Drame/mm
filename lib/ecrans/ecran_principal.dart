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
import '../l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import '../auxiliaires/locale_provider.dart';
import '../auxiliaires/theme_provider.dart';

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
    final localizations = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(localizations?.dailyKhatma ?? 'Khatma Quotidienne'),
      ),
      drawer: _buildDrawer(context),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
                      : _khatmaDuJour == null
                ? Center(child: Text(localizations?.dataNotAvailable ?? "Données non disponibles."))
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
    final localizations = AppLocalizations.of(context);
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {
          int idJour = LogiqueDate.rechercheIdJour(_session, _dateAffichee);
          int idCoran = _calculerIdCoran(idJour, position);

          if(idCoran > 0) {
            // Déterminer le hizb suivant et si c'est le dernier de la journée
            int? nextHizbId = _getNextHizbId(idJour, position);
            bool isLastHizbOfDay = _isLastHizbOfDay(idJour, position);

            Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) => EcranQuran(
                  idCoran: idCoran,
                  nextHizbId: nextHizbId,
                  isLastHizbOfDay: isLastHizbOfDay,
                  onDayCompleted: _markDayAsCompleted,
                ),
                transitionsBuilder: (context, animation, secondaryAnimation, child) {
                  return SlideTransition(
                    position: Tween<Offset>(
                      begin: const Offset(1.0, 0.0),
                      end: Offset.zero,
                    ).animate(animation),
                    child: child,
                  );
                },
                transitionDuration: const Duration(milliseconds: 300),
              ),
            );
          } else {
            // Affiche un message si la logique de calcul de l'ID n'est pas implémentée pour ce cas
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(localizations?.unimplementedNavigation ?? "La navigation pour cette section n'est pas encore implémentée."),
                backgroundColor: Theme.of(context).colorScheme.error,
              ),
            );
          }
        },
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Icon(
                Icons.book,
                size: 48,
                color: Theme.of(context).primaryColor,
              ),
              const SizedBox(height: 12),
              Text(
                _getHizbTitle(titre),
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              
            ],
          ),
        ),
      ),
    );
  }

  /// Détermine le hizb suivant dans la séquence
  int? _getNextHizbId(int idJour, int position) {
    if (position < 3) {
      // Il y a un hizb suivant dans la même journée
      return _calculerIdCoran(idJour, position + 1);
    } else {
      // C'est le dernier hizb de la journée, pas de suivant
      return null;
    }
  }

  /// Détermine si c'est le dernier hizb de la journée
  bool _isLastHizbOfDay(int idJour, int position) {
    return position == 3; // Le troisième hizb est toujours le dernier
  }

  /// Nettoie le titre du hizb en enlevant "Hizb + numéro"
  String _getHizbTitle(String titre) {
    // Enlève "Hizb" et le numéro du titre
    if (titre.toLowerCase().contains('hizb')) {
      // Cherche le pattern "Hizb X" ou "Hizb X:" et l'enlève
      final regex = RegExp(r'hizb\s*\d+[:\s]*', caseSensitive: false);
      return titre.replaceAll(regex, '').trim();
    }
    return titre;
  }

  /// Marque la journée comme terminée
  void _markDayAsCompleted() {
    // Ici vous pouvez ajouter la logique pour marquer la journée comme terminée
    // Par exemple, sauvegarder dans la base de données, afficher une notification, etc.
    
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(AppLocalizations.of(context)?.dayMarkedCompleted ?? 
                     'Journée marquée comme terminée !'),
        backgroundColor: Colors.green,
        duration: const Duration(seconds: 3),
      ),
    );
  }

  /// Widget pour la barre de navigation "Précédent" / "Suivant".
  Widget _buildBarreNavigation(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ElevatedButton.icon(
            onPressed: _jourPrecedent,
            icon: const Icon(Icons.arrow_left),
            label: Text(localizations?.previous ?? 'Précédent'),
          ),
          ElevatedButton.icon(
            onPressed: _jourSuivant,
            icon: const Icon(Icons.arrow_right),
            label: Text(localizations?.next ?? 'Suivant'),
          ),
        ],
      ),
    );
  }

  /// Calcule l'ID de la section du Coran à afficher, en se basant sur le jour du cycle et la position dans la liste.
  /// Cette logique est une traduction directe de la méthode `visualisationQuran` de l'application Java originale.
  int _calculerIdCoran(int idJour, int positionDansListe) {
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
      case 3:
        // Le jour 3 (Vendredi) a une logique spéciale, le premier item est "Sourate Al-Kahf"
        // qui n'est pas une section numérotée de la même manière. On pourrait lui assigner un ID spécial si nécessaire.
        // Pour l'instant on ne retourne rien pour la sourate et on mappe les deux autres.
        if (positionDansListe == 1) return 0; // Pas d'ID pour sourate Al-Kahf dans ce contexte
        if (positionDansListe == 2) return 5;
        if (positionDansListe == 3) return 6;
        break;
      case 4:
        if (positionDansListe == 1) return 7;
        if (positionDansListe == 2) return 8;
        if (positionDansListe == 3) return 9;
        break;
      case 5:
        if (positionDansListe == 1) return 10;
        if (positionDansListe == 2) return 11;
        if (positionDansListe == 3) return 12;
        break;
      case 6:
        if (positionDansListe == 1) return 13;
        if (positionDansListe == 2) return 14;
        if (positionDansListe == 3) return 15;
        break;
      case 7:
        if (positionDansListe == 1) return 16;
        if (positionDansListe == 2) return 17;
        if (positionDansListe == 3) return 18;
        break;
      case 8:
        if (positionDansListe == 1) return 19;
        if (positionDansListe == 2) return 20;
        if (positionDansListe == 3) return 21;
        break;
      case 9:
        if (positionDansListe == 1) return 22;
        if (positionDansListe == 2) return 23;
        if (positionDansListe == 3) return 24;
        break;
      case 10:
         // Le jour 10 (Vendredi) a aussi la sourate Al-Kahf
        if (positionDansListe == 1) return 0;
        if (positionDansListe == 2) return 25;
        if (positionDansListe == 3) return 26;
        break;
      case 11:
        if (positionDansListe == 1) return 27;
        if (positionDansListe == 2) return 28;
        if (positionDansListe == 3) return 29;
        break;
      case 12:
        if (positionDansListe == 1) return 30;
        if (positionDansListe == 2) return 31;
        if (positionDansListe == 3) return 32;
        break;
      case 13:
        if (positionDansListe == 1) return 33;
        if (positionDansListe == 2) return 34;
        if (positionDansListe == 3) return 35;
        break;
      case 14:
        if (positionDansListe == 1) return 36;
        if (positionDansListe == 2) return 37;
        if (positionDansListe == 3) return 38;
        break;
      case 15:
        if (positionDansListe == 1) return 39;
        if (positionDansListe == 2) return 40;
        if (positionDansListe == 3) return 41;
        break;
      case 16:
        if (positionDansListe == 1) return 42;
        if (positionDansListe == 2) return 43;
        if (positionDansListe == 3) return 44;
        break;
      case 17:
        // Le jour 17 (Vendredi) a aussi la sourate Al-Kahf
        if (positionDansListe == 1) return 0;
        if (positionDansListe == 2) return 45;
        if (positionDansListe == 3) return 46;
        break;
      case 18:
        if (positionDansListe == 1) return 47;
        if (positionDansListe == 2) return 48;
        if (positionDansListe == 3) return 49;
        break;
      case 19:
        if (positionDansListe == 1) return 50;
        if (positionDansListe == 2) return 51;
        if (positionDansListe == 3) return 52;
        break;
      case 20:
        if (positionDansListe == 1) return 53;
        if (positionDansListe == 2) return 54;
        if (positionDansListe == 3) return 55;
        break;
      case 21:
        if (positionDansListe == 1) return 56;
        if (positionDansListe == 2) return 57;
        if (positionDansListe == 3) return 58;
        break;
      default:
        // Retourne 0 si le jour n'est pas dans le cycle de 1 à 21.
        return 0;
    }
    return 0; // Au cas où une condition n'est pas remplie.
  }

  /// Affiche un dialogue pour changer la langue.
  void _showLanguageDialog(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(localizations?.language ?? 'Langue'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: const Text('Français'),
                leading: Radio<String>(
                  value: 'fr',
                  groupValue: context.read<LocaleProvider>().locale.languageCode,
                  onChanged: (value) {
                    context.read<LocaleProvider>().setLocale(const Locale('fr', ''));
                    Navigator.pop(context);
                  },
                ),
              ),
              ListTile(
                title: const Text('العربية'),
                leading: Radio<String>(
                  value: 'ar',
                  groupValue: context.read<LocaleProvider>().locale.languageCode,
                  onChanged: (value) {
                    context.read<LocaleProvider>().setLocale(const Locale('ar', ''));
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  /// Construit le menu de navigation latéral (Drawer).
  Widget _buildDrawer(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
            child: Text(
              localizations?.navigationMenu ?? 'Menu de navigation',
              style: const TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.list_alt),
            title: Text(localizations?.hizbList ?? 'Liste des Ahzab'),
            onTap: () {
              Navigator.pop(context); // Ferme le drawer
              Navigator.push(context, MaterialPageRoute(builder: (context) => const EcranListeAhzab()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.calendar_today),
            title: Text(localizations?.khatmaDates ?? 'Dates des Khatmas'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context) => const EcranDatesKhatma()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.book),
            title: Text(localizations?.quranRecitation ?? 'Duaa Khatm Al-Quran'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context) => const EcranDuaa()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.info_outline),
            title: Text(localizations?.aboutKhatma ?? 'À propos de la Khatma'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context) => const EcranInfoKhatma()));
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.language),
            title: Text(localizations?.language ?? 'Langue'),
            subtitle: Text(localizations?.currentLanguage ?? 'Français'),
            onTap: () {
              Navigator.pop(context);
              _showLanguageDialog(context);
            },
          ),
           ListTile(
             leading: Icon(
               context.watch<ThemeProvider>().isDarkMode 
                 ? Icons.light_mode 
                 : Icons.dark_mode,
             ),
             title: Text('Thème'),
             subtitle: Text(
               context.watch<ThemeProvider>().isDarkMode 
                 ? 'Mode sombre' 
                 : 'Mode clair',
             ),
             onTap: () {
               context.read<ThemeProvider>().toggleTheme();
               Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.person_outline),
            title: Text(localizations?.aboutUs ?? 'À propos de nous'),
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
