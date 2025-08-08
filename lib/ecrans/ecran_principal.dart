import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
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
    
    // Précharge les données pour améliorer les performances
    _prechargerDonnees();
  }
  
  /// Précharge les données pour améliorer les performances
  void _prechargerDonnees() {
    // Précharge les données de base de manière asynchrone
    Future.microtask(() async {
      await _dbHelper.database;
    });
  }



  /// Prépare la base de données et charge les données pour la date initiale.
  Future<void> _initialiser() async {
    try {
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
    } catch (e) {
      // Gestion d'erreur pour éviter les blocages
      print('Erreur lors de l\'initialisation: $e');
      setState(() {
        _isLoading = false;
      });
    }
  }

  /// Charge les données de la Khatma pour une date donnée.
  void _chargerDonneesPourDate(DateTime date) async {
    setState(() {
      _isLoading = true;
    });
    
    try {
      int idJour = LogiqueDate.rechercheIdJour(_session, date);
      _khatmaDuJour = await _dbHelper.getLigneById(idJour);
    } catch (e) {
      print('Erreur lors du chargement des données: $e');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
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
        title: Text('حزب الإدارة'),
      ),
      drawer: _buildDrawer(context),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
                      : _khatmaDuJour == null
                ? Center(child: Text(localizations?.dataNotAvailable ?? "Données non disponibles."))
              : Column(
                  children: [
                    _buildEnteteDate(context),
                    _buildBismillah(context),
                    Expanded(
                      child: GestureDetector(
                        onHorizontalDragEnd: (DragEndDetails details) {
                          if (details.primaryVelocity! > 0) {
                            // Swipe vers la droite (jour suivant)
                            _jourSuivant();
                          } else if (details.primaryVelocity! < 0) {
                            // Swipe vers la gauche (jour précédent)
                            _jourPrecedent();
                          }
                        },
                        child: ListView(
                          padding: const EdgeInsets.all(8.0),
                          children: [
                            _buildCarteLecture(context, _khatmaDuJour!.verser1, 1),
                            _buildCarteLecture(context, _khatmaDuJour!.verser2, 2),
                            // Si c'est le dernier jour, insérer la carte du duaa entre hizb 60 et hizb 1
                            if (_isDernierJour()) _buildCarteDuaa(context),
                            _buildCarteLecture(context, _khatmaDuJour!.verser3, _isDernierJour() ? 4 : 3),
                          ],
                        ),
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

  /// Widget pour afficher la Bismillah de manière très stylée.
  Widget _buildBismillah(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.green.shade300,
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.green.shade200.withOpacity(0.4),
            blurRadius: 8,
            offset: const Offset(0, 3),
            spreadRadius: 1,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Ligne décorative à gauche
          Container(
            width: 20,
            height: 1.5,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.transparent,
                  Colors.green.shade400,
                  Colors.green.shade600,
                ],
              ),
            ),
          ),
          const SizedBox(width: 12),
          // Texte principal Bismillah avec style calligraphique
          Text(
            'بِسْمِ اللَّهِ الرَّحْمَٰنِ الرَّحِيمِ',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w600,
              color: Colors.green.shade800,
              height: 1.6,
              letterSpacing: 0.5,
              shadows: [
                Shadow(
                  color: Colors.green.shade600.withOpacity(0.2),
                  offset: const Offset(0, 1),
                  blurRadius: 2,
                ),
              ],
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(width: 12),
          // Ligne décorative à droite
          Container(
            width: 20,
            height: 1.5,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.green.shade600,
                  Colors.green.shade400,
                  Colors.transparent,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Widget pour une carte de lecture cliquable.
  Widget _buildCarteLecture(BuildContext context, String titre, int position) {
    final localizations = AppLocalizations.of(context);
    
    // Couleurs vertes pour toutes les plateformes
    final List<List<Color>> gradientColors = [
      [Colors.green.shade400, Colors.green.shade600],
      [Colors.green.shade500, Colors.green.shade700],
      [Colors.green.shade600, Colors.green.shade800],
    ];
    
    // Gérer le cas où position peut être 4 (hizb 1 après le duaa)
    final int colorIndex = position <= 3 ? position - 1 : 2; // Utiliser la dernière couleur pour position 4
    
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 4),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: gradientColors[colorIndex],
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: gradientColors[colorIndex][0].withOpacity(0.3),
            blurRadius: 12,
            offset: const Offset(0, 6),
            spreadRadius: 2,
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: () {
            int idJour = LogiqueDate.rechercheIdJour(_session, _dateAffichee);
            int idCoran = _calculerIdCoran(idJour, position);

            if(idCoran == 100) {
              // Cas spécial pour la Sourate Al-Kahf (vendredi)
              _navigateToKahf(context);
            } else if(idCoran > 0) {
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
                Text(
                  _getHizbTitle(titre),
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton.icon(
            onPressed: _jourPrecedent,
            icon: const Icon(Icons.arrow_left),
            label: Text(localizations?.previous ?? 'Précédent'),
          ),
          const SizedBox(width: 16.0),
          // Bouton de thème
          Consumer<ThemeProvider>(
            builder: (context, themeProvider, child) {
              return ElevatedButton(
                onPressed: () {
                  themeProvider.toggleTheme();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,
                  foregroundColor: Colors.white,
                  elevation: 4,
                  shadowColor: Theme.of(context).primaryColor.withOpacity(0.3),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Icon(
                  themeProvider.isDarkMode ? Icons.light_mode : Icons.dark_mode,
                  color: Colors.white,
                ),
              );
            },
          ),
          const SizedBox(width: 16.0),
          ElevatedButton.icon(
            onPressed: _jourSuivant,
            icon: const Icon(Icons.arrow_right),
            label: Text(localizations?.next ?? 'Suivant'),
          ),
        ],
      ),
    );
  }

  /// Calcule l'ID de la section du Coran à afficher, en se basé sur le jour du cycle et la position dans la liste.
  /// Cette logique est une traduction directe de la méthode `visualisationQuran` de l'application Java originale.
  int _calculerIdCoran(int idJour, int positionDansListe) {
    switch (idJour) {
      case 1:
        if (positionDansListe == 1) return 59;
        if (positionDansListe == 2) return 60;
        if (positionDansListe == 3) return 1;
        if (positionDansListe == 4) return 1; // Hizb 1 après le duaa
        break;
      case 2:
        if (positionDansListe == 1) return 2;
        if (positionDansListe == 2) return 3;
        if (positionDansListe == 3) return 4;
        break;
      case 3:
        // Le jour 3 (Vendredi) a une logique spéciale, le premier item est "Sourate Al-Kahf"
        if (positionDansListe == 1) return 100; // ID spécial pour sourate Al-Kahf
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
         // la sourate Al-Kahf
        if (positionDansListe == 1) return 100; // ID spécial pour sourate Al-Kahf
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
        if (positionDansListe == 1) return 100; // ID spécial pour sourate Al-Kahf
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
          title: Text(
            localizations?.language ?? 'Langue',
            style: Theme.of(context).dialogTheme.titleTextStyle,
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: Text(
                  'Français',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
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
                title: Text(
                  'العربية',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
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
             title: Text(_getThemeText(context, true)),
             subtitle: Text(_getThemeText(context, false)),
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

  /// Vérifie si c'est le dernier jour (jour avec hizb 60)
  bool _isDernierJour() {
    if (_khatmaDuJour == null) return false;
    
    // Vérifier si le verser2 contient "الحزب 60" (hizb 60)
    return _khatmaDuJour!.verser2.contains("الحزب 60");
  }

  /// Widget pour la carte du duaa (quatrième carte du dernier jour)
  Widget _buildCarteDuaa(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    
    // Couleur spéciale pour la carte du duaa (bleu plus vif)
    final List<Color> gradientColors = [Colors.blue.shade400, Colors.blue.shade600];
    
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 4),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: gradientColors,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: gradientColors[0].withOpacity(0.3),
            blurRadius: 12,
            offset: const Offset(0, 6),
            spreadRadius: 2,
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: () {
            // Naviguer vers l'écran du duaa
            Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) => const EcranDuaa(),
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
          },
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Text(
                  "دعاء ختم القرآن الكريم",
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Navigate vers un écran spécial pour la Sourate Al-Kahf
  void _navigateToKahf(BuildContext context) {
    // Al-Kahf est toujours en position 1 les vendredis, donc il y a un hizb suivant (position 2)
    int idJour = LogiqueDate.rechercheIdJour(_session, _dateAffichee);
    int? nextHizbId = _calculerIdCoran(idJour, 2); // Position 2 après Al-Kahf
    bool isLastHizbOfDay = false; // Al-Kahf n'est jamais le dernier hizb
    
    // Naviguer vers l'écran Quran avec l'ID 100 (Al-Kahf)
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => EcranQuran(
          idCoran: 100, // ID spécial pour Al-Kahf (utilise quran61_x.jpg)
          nextHizbId: nextHizbId > 0 ? nextHizbId : null, // Hizb suivant si valide
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
  }

  /// Retourne le texte du thème adapté selon la langue
  String _getThemeText(BuildContext context, bool isTitle) {
    final locale = Localizations.localeOf(context).languageCode;
    
    if (locale == 'ar') {
      return isTitle ? 'المظهر' : (context.watch<ThemeProvider>().isDarkMode ? 'الوضع المظلم' : 'الوضع الفاتح');
    } else {
      return isTitle ? 'Thème' : (context.watch<ThemeProvider>().isDarkMode ? 'Mode sombre' : 'Mode clair');
    }
  }

  /// Retourne le tooltip du bouton thème adapté selon la langue
  String _getThemeTooltip(BuildContext context) {
    final locale = Localizations.localeOf(context).languageCode;
    
    if (locale == 'ar') {
      return 'تغيير الثيم';
    } else {
      return 'Changer le thème';
    }
  }


}
