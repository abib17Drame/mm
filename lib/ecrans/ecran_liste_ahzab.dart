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
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _searchController.dispose();
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
    
    // Filtrer les ahzab selon la recherche
    final List<MapEntry<int, String>> ahzabFiltres = ahzab.asMap().entries
        .where((entry) {
          final index = entry.key + 1; // Numéro du Hizb (1-60)
          final ahzabName = entry.value;
          
          if (_searchQuery.isEmpty) return true;
          
          // Recherche par numéro de Hizb
          if (_searchQuery.isNotEmpty && index.toString().contains(_searchQuery)) {
            return true;
          }
          
          // Recherche par nom de Hizb (seulement le titre, pas les détails des versets)
          final hizbTitle = ahzabName.split('\n').first; // Prend seulement la première ligne
          return hizbTitle.toLowerCase().contains(_searchQuery.toLowerCase());
        })
        .toList();

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
                         'أحزاب القرآن',
                         style: theme.textTheme.headlineSmall?.copyWith(
                           fontWeight: FontWeight.bold,
                           color: theme.colorScheme.primary,
                         ),
                       ),
                    ],
                  ),
                ),
                                 const SizedBox(height: 24),
                 
                 // Barre de recherche
                 Container(
                   margin: const EdgeInsets.only(bottom: 16),
                   decoration: BoxDecoration(
                     color: Colors.white,
                     borderRadius: BorderRadius.circular(12),
                     boxShadow: [
                       BoxShadow(
                         color: Colors.black.withOpacity(0.1),
                         blurRadius: 4,
                         offset: const Offset(0, 2),
                       ),
                     ],
                   ),
                   child: TextField(
                     controller: _searchController,
                     onChanged: (value) {
                       setState(() {
                         _searchQuery = value;
                       });
                     },
                     decoration: InputDecoration(
                       hintText: 'البحث عن رقم الحزب أو الاسم...',
                       hintStyle: TextStyle(
                         color: Colors.grey[600],
                         fontSize: 16,
                       ),
                       prefixIcon: Icon(
                         Icons.search,
                         color: theme.colorScheme.primary,
                       ),
                       suffixIcon: _searchQuery.isNotEmpty
                           ? IconButton(
                               icon: Icon(
                                 Icons.clear,
                                 color: Colors.grey[600],
                               ),
                               onPressed: () {
                                 setState(() {
                                   _searchController.clear();
                                   _searchQuery = '';
                                 });
                               },
                             )
                           : null,
                       border: InputBorder.none,
                       contentPadding: const EdgeInsets.symmetric(
                         horizontal: 16,
                         vertical: 12,
                       ),
                     ),
                     style: const TextStyle(
                       fontSize: 16,
                       fontWeight: FontWeight.w500,
                     ),
                   ),
                 ),
                 
                 // Liste des ahzab
                 Expanded(
                  child: ListView.builder(
                    controller: _scrollController,
                    itemCount: ahzabFiltres.length,
                      itemBuilder: (context, index) {
                       final entry = ahzabFiltres[index];
                       final ahzabName = entry.value;
                       final originalIndex = entry.key;
                       final ahzabId = originalIndex + 1; // Vrai numéro du Hizb (1-60)
                       final cardColor = _getCardColor(originalIndex);
                      
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
