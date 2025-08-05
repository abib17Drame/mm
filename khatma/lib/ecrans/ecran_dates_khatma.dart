import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import '../auxiliaires/logique_date.dart';
import '../auxiliaires/aideur_base_de_donnees.dart';
import '../l10n/app_localizations.dart';

/// Écran affichant les dates des 10 prochaines Khatmas.
class EcranDatesKhatma extends StatefulWidget {
  const EcranDatesKhatma({Key? key}) : super(key: key);

  @override
  _EcranDatesKhatmaState createState() => _EcranDatesKhatmaState();
}

class _EcranDatesKhatmaState extends State<EcranDatesKhatma> {
  Future<List<DateTime>>? _futureDates;
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _futureDates = _chargerDates();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  /// Charge la date de session initiale et calcule les 10 prochaines dates.
  Future<List<DateTime>> _chargerDates() async {
    final dbHelper = AideurBaseDeDonnees.instance;
    DateTime? session = await dbHelper.getDernierSession();
    // Si la session n'est pas trouvée, on utilise une date par défaut.
    session ??= DateTime(2016, 2, 17);
    return LogiqueDate.liste10khatma(session);
  }

  /// Génère une couleur basée sur l'index (seulement deux couleurs harmonieuses)
  Color _getCardColor(int index) {
    final colors = [
      const Color(0xFF2E7D32), // Vert foncé (harmonieux avec le thème vert)
      const Color(0xFF1565C0), // Bleu foncé (complémentaire élégant)
    ];
    return colors[index % colors.length];
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    final theme = Theme.of(context);
    
    return Focus(
      autofocus: true,
      onKeyEvent: (node, event) {
        if (event is KeyDownEvent) {
          switch (event.logicalKey) {
            case LogicalKeyboardKey.arrowUp:
              _scrollController.animateTo(
                _scrollController.offset - 100,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
              return KeyEventResult.handled;
            case LogicalKeyboardKey.arrowDown:
              _scrollController.animateTo(
                _scrollController.offset + 100,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
              return KeyEventResult.handled;
            case LogicalKeyboardKey.pageUp:
              _scrollController.animateTo(
                _scrollController.offset - 300,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
              return KeyEventResult.handled;
            case LogicalKeyboardKey.pageDown:
              _scrollController.animateTo(
                _scrollController.offset + 300,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
              return KeyEventResult.handled;
            case LogicalKeyboardKey.home:
              _scrollController.animateTo(
                0,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
              return KeyEventResult.handled;
            case LogicalKeyboardKey.end:
              _scrollController.animateTo(
                _scrollController.position.maxScrollExtent,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
              return KeyEventResult.handled;
          }
        }
        return KeyEventResult.ignored;
      },
      child: Scaffold(
        backgroundColor: theme.colorScheme.background,
        appBar: AppBar(
          title: Text(
            localizations?.khatmaDates ?? 'Dates des prochaines Khatmas',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          elevation: 0,
          backgroundColor: theme.colorScheme.primary,
          foregroundColor: theme.colorScheme.onPrimary,
        ),
        body: FutureBuilder<List<DateTime>>(
        future: _futureDates,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(
                    color: theme.colorScheme.primary,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Chargement des dates...',
                    style: theme.textTheme.bodyLarge,
                  ),
                ],
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.error_outline,
                    size: 64,
                    color: theme.colorScheme.error,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Erreur: ${snapshot.error}',
                    style: theme.textTheme.bodyLarge,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.calendar_today_outlined,
                    size: 64,
                    color: theme.colorScheme.primary,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    localizations?.noDates ?? 'Aucune date à afficher.',
                    style: theme.textTheme.bodyLarge,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            );
          }

          final dates = snapshot.data!;
          final format = DateFormat('EEEE d MMMM yyyy', 'fr_FR');

          return Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  theme.colorScheme.primary.withOpacity(0.1),
                  theme.colorScheme.background,
                ],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  // En-tête avec icône
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.primary.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: theme.colorScheme.primary.withOpacity(0.3),
                        width: 1,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.calendar_month,
                          size: 32,
                          color: theme.colorScheme.primary,
                        ),
                        const SizedBox(width: 12),
                        Text(
                          'Prochaines Khatmas',
                          style: theme.textTheme.headlineSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: theme.colorScheme.primary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  // Liste des dates
                  Expanded(
                    child: ListView.builder(
                      controller: _scrollController,
                      itemCount: dates.length,
                      itemBuilder: (context, index) {
                        final date = dates[index];
                        final cardColor = _getCardColor(index);
                        
                        return Container(
                          margin: const EdgeInsets.only(bottom: 16),
                          child: Card(
                            elevation: 8,
                            shadowColor: cardColor.withOpacity(0.3),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    cardColor,
                                    cardColor.withOpacity(0.8),
                                  ],
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(24),
                                child: Column(
                                  children: [
                                    // Icône de célébration
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Icon(
                                          Icons.celebration,
                                          color: Colors.white.withOpacity(0.8),
                                          size: 24,
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 16),
                                    // Date principale
                                    Text(
                                      format.format(date),
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    const SizedBox(height: 8),
                                    // Jour de la semaine
                                    Text(
                                      DateFormat('EEEE', 'fr_FR').format(date),
                                      style: TextStyle(
                                        color: Colors.white.withOpacity(0.8),
                                        fontSize: 16,
                                        fontStyle: FontStyle.italic,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
        ),
      );
  }
}
