import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:khatma_flutter/l10n/app_localizations.dart';
import '../auxiliaires/donnees_statiques.dart';
import 'ecran_quran.dart';

/// Écran affichant la liste des Ahzab du Coran (1-60).
class EcranListeAhzab extends StatefulWidget {
  const EcranListeAhzab({Key? key}) : super(key: key);

  @override
  _EcranListeAhzabState createState() => _EcranListeAhzabState();
}

class _EcranListeAhzabState extends State<EcranListeAhzab> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
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
    final List<String> ahzab = DonneesStatiques.getListeAhzab();
    
    // Utiliser tous les ahzab de 1 à 60
    final List<String> ahzabFiltres = ahzab; // Ahzab 1 à 60

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
            localizations?.hizbList ?? 'Liste des Ahzab',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          elevation: 0,
          backgroundColor: theme.colorScheme.primary,
          foregroundColor: theme.colorScheme.onPrimary,
        ),
        body: Container(
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
                        Icons.menu_book,
                        size: 32,
                        color: theme.colorScheme.primary,
                      ),
                      const SizedBox(width: 12),
                                             Text(
                         'Ahzab du Coran',
                         style: theme.textTheme.headlineSmall?.copyWith(
                           fontWeight: FontWeight.bold,
                           color: theme.colorScheme.primary,
                         ),
                       ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                // Liste des ahzab
                Expanded(
                  child: ListView.builder(
                    controller: _scrollController,
                    itemCount: ahzabFiltres.length,
                    itemBuilder: (context, index) {
                      final ahzabName = ahzabFiltres[index];
                      final cardColor = _getCardColor(index);
                      final ahzabId = index + 1; // Ahzab 1 à 60
                      
                      return GestureDetector(
                        onTap: () {
                          // Naviguer vers l'écran de lecture du Quran
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => EcranQuran(
                                idCoran: ahzabId,
                              ),
                            ),
                          );
                        },
                        child: Container(
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
                                    // Numéro de l'ahzab
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 12,
                                            vertical: 6,
                                          ),
                                          decoration: BoxDecoration(
                                            color: Colors.white.withOpacity(0.2),
                                            borderRadius: BorderRadius.circular(20),
                                          ),
                                                                                     child: Text(
                                             '$ahzabId',
                                             style: const TextStyle(
                                               color: Colors.white,
                                               fontWeight: FontWeight.bold,
                                               fontSize: 14,
                                             ),
                                           ),
                                        ),
                                        Icon(
                                          Icons.auto_stories,
                                          color: Colors.white.withOpacity(0.8),
                                          size: 24,
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 16),
                                    // Nom de l'ahzab
                                    Text(
                                      ahzabName,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    const SizedBox(height: 8),
                                    
                                  ],
                                ),
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
        ),
      ),
    );
  }
}
