import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import '../auxiliaires/donnees_statiques.dart';
import '../l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import '../auxiliaires/locale_provider.dart';
import '../auxiliaires/theme_provider.dart';
import 'ecran_liste_ahzab.dart';
import 'ecran_dates_khatma.dart';
import 'ecran_duaa.dart';
import 'ecran_info_khatma.dart';
import 'ecran_a_propos.dart';
import 'dart:developer' as developer;
/// Écran pour afficher les pages du Coran.
/// Il utilise un PageView pour permettre de balayer les pages avec des contrôles de navigation.
class EcranQuran extends StatefulWidget {
  final int idCoran;
  final int? nextHizbId; // ID du hizb suivant (optionnel)
  final bool isLastHizbOfDay; // Si c'est le dernier hizb de la journée
  final VoidCallback? onDayCompleted; // Callback pour marquer la journée comme terminée

  const EcranQuran({
    Key? key, 
    required this.idCoran,
    this.nextHizbId,
    this.isLastHizbOfDay = false,
    this.onDayCompleted,
  }) : super(key: key);

  @override
  _EcranQuranState createState() => _EcranQuranState();
}

class _EcranQuranState extends State<EcranQuran> {
  late PageController _pageController;
  int _currentPage = 0;
  late List<String> _pages;
  bool _isFullScreen = false;
  bool _hasAttemptedSwipeBeyondLastPage = false;

  @override
  void initState() {
    super.initState();
    _pages = DonneesStatiques.getImagesPourCoran(widget.idCoran);
    developer.log('EcranQuran: Images chargées pour idCoran=${widget.idCoran}: $_pages', name: 'QURAN_DEBUG');
    _pageController = PageController();
    print('DEBUG: EcranQuran initState - Nombre de pages: ${_pages.length}');
    
    // Ajouter un listener pour détecter les tentatives de swipe au-delà de la dernière page
    _pageController.addListener(() {
      if (_pageController.page != null) {
        final currentPage = _pageController.page!.round();
        if (currentPage == _pages.length - 1) {
          print('DEBUG: PageController listener - Dernière page détectée');
        }
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    // Nettoyer la mémoire des images
    _pages.clear();
    super.dispose();
  }

  void _goToPage(int page) {
    if (page >= 0 && page < _pages.length) {
      _pageController.animateToPage(
        page,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _nextPage() {
    print('DEBUG: _nextPage appelée - Page actuelle: $_currentPage, Total: ${_pages.length}');
    if (_currentPage < _pages.length - 1) {
      print('DEBUG: Navigation vers la page suivante');
      _goToPage(_currentPage + 1);
    } else if (_currentPage == _pages.length - 1) {
      print('DEBUG: Dernière page atteinte, affichage du dialogue');
      // L'utilisateur essaie d'aller au-delà de la dernière page
      _showCompletionDialog();
    }
  }

  void _handlePageChange(int index) {
    print('DEBUG: _handlePageChange - Index: $index, Pages totales: ${_pages.length}');
    setState(() {
      _currentPage = index;
    });
    
    // Vérifier si on est sur la dernière page
    if (index == _pages.length - 1) {
      print('DEBUG: Dernière page atteinte');
      // Réinitialiser le flag quand on arrive sur la dernière page
      _hasAttemptedSwipeBeyondLastPage = false;
    }
  }

  bool _handleScrollNotification(ScrollNotification notification) {
    // Cette méthode n'est plus nécessaire car on utilise le listener du PageController
    return false;
  }

  void _previousPage() {
    if (_currentPage > 0) {
      _goToPage(_currentPage - 1);
    }
  }

  void _toggleFullScreen() {
    setState(() {
      _isFullScreen = !_isFullScreen;
      // Recréer le PageController avec la page actuelle pour conserver la position
      _pageController = PageController(initialPage: _currentPage);
    });
  }

  void _showCompletionDialog() {
    print('DEBUG: _showCompletionDialog appelée');
    final localizations = AppLocalizations.of(context);
    
    // Utiliser un délai pour éviter les conflits avec les animations de swipe
    Future.delayed(const Duration(milliseconds: 100), () {
      if (mounted) {
        print('DEBUG: Affichage du dialogue de completion');
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            // Déterminer le message selon le hizb
            String titleText = localizations?.hizbCompleted ?? 'Hizb terminé';
            String messageText = localizations?.hizbCompletionMessage ?? 'Félicitations ! Vous avez terminé ce hizb.';
            String continueText = localizations?.continueToNextHizb ?? 'Voulez-vous continuer vers le hizb suivant ?';
            
            // Si c'est le hizb 60, modifier les messages
            if (widget.idCoran == 60) {
              titleText = localizations?.hizb60Completed ?? 'Hizb 60 terminé';
              messageText = localizations?.hizb60CompletionMessage ?? 'Félicitations ! Vous avez terminé le dernier hizb du Coran.';
              continueText = localizations?.continueToDuaa ?? 'Voulez-vous continuer vers le Duaa de Khatm Al-Quran ?';
            }
            
            return AlertDialog(
              title: Row(
                children: [
                  Icon(
                    Icons.check_circle,
                    color: Colors.green,
                    size: 28,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      titleText,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    messageText,
                    style: Theme.of(context).textTheme.bodyMedium,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    continueText,
                    style: Theme.of(context).textTheme.bodyMedium,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text(localizations?.no ?? 'Non'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    _continueToNextHizb();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                    foregroundColor: Colors.white,
                  ),
                  child: Text(localizations?.yes ?? 'Oui'),
                ),
              ],
            );
          },
        );
      }
    });
  }

  void _markDayAsCompleted() {
    // Appeler le callback pour marquer la journée comme terminée
    widget.onDayCompleted?.call();
    
    // Afficher un message de confirmation
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(AppLocalizations.of(context)?.dayMarkedCompleted ?? 
                     'Journée marquée comme terminée !'),
        backgroundColor: Colors.green,
        duration: const Duration(seconds: 2),
      ),
    );
    
    // Retourner à l'écran principal
    Navigator.of(context).pop();
  }

  void _continueToNextHizb() {
    print('DEBUG: _continueToNextHizb - idCoran: ${widget.idCoran}, nextHizbId: ${widget.nextHizbId}');
    print('DEBUG: Type de idCoran: ${widget.idCoran.runtimeType}');
    print('DEBUG: Comparaison idCoran == 60: ${widget.idCoran == 60}');
    
    // Vérifier si on est au hizb 60 (dernier hizb) - priorité absolue
    if (widget.idCoran == 60) {
      print('DEBUG: Hizb 60 détecté, navigation vers EcranDuaa');
      // Si on termine le hizb 60, aller vers le duaa (khatma)
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const EcranDuaa(),
        ),
      );
      return;
    } else {
      print('DEBUG: Pas hizb 60, idCoran = ${widget.idCoran}');
    }
    
    if (widget.nextHizbId != null) {
      print('DEBUG: Navigation vers le hizb suivant dans le même jour');
      // Naviguer vers le hizb suivant dans le même jour
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => EcranQuran(
            idCoran: widget.nextHizbId!,
            // Pour l'instant, on ne passe pas les informations suivantes
            // car elles devraient être calculées depuis l'écran principal
            onDayCompleted: widget.onDayCompleted,
          ),
        ),
      );
    } else {
      // Si nextHizbId est null (lecture depuis la liste des Ahzab),
      // naviguer vers le hizb suivant dans la séquence
      final nextHizbId = widget.idCoran + 1;
      print('DEBUG: nextHizbId calculé: $nextHizbId');
      
      if (nextHizbId <= 60) {
        print('DEBUG: Navigation vers le hizb suivant: $nextHizbId');
        // Vérifier si le hizb suivant existe (1-60)
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => EcranQuran(
              idCoran: nextHizbId,
              // Pas de nextHizbId pour permettre la séquence continue
            ),
          ),
        );
      } else {
        print('DEBUG: Retour à la liste des Ahzab');
        // Si on est au hizb 60, retourner à la liste des Ahzab
        Navigator.of(context).pop();
      }
    }
  }

  void _showPageDialog() {
    final localizations = AppLocalizations.of(context);
    final TextEditingController controller = TextEditingController();
    
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(localizations?.pageNavigation ?? 'Navigation des pages'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                localizations?.pageInfo(_currentPage + 1, _pages.length) ?? 
                'Page ${_currentPage + 1} sur ${_pages.length}',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 16),
              TextField(
                controller: controller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Numéro de page (1-${_pages.length})',
                  border: const OutlineInputBorder(),
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(localizations?.goBack ?? 'Annuler'),
            ),
            ElevatedButton(
              onPressed: () {
                final pageNumber = int.tryParse(controller.text);
                if (pageNumber != null && pageNumber >= 1 && pageNumber <= _pages.length) {
                  _goToPage(pageNumber - 1);
                  Navigator.of(context).pop();
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Veuillez entrer un numéro entre 1 et ${_pages.length}'),
                    ),
                  );
                }
              },
              child: Text('Aller'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    return _buildScaffold(context, localizations);
  }

  Widget _buildScaffold(BuildContext context, AppLocalizations? localizations) {

    return Scaffold(
        drawer: _buildDrawer(context),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () => Scaffold.of(context).openDrawer(),
            tooltip: localizations?.navigationMenu ?? 'Menu de navigation',
          ),
        ),

        actions: [],
      ),
      body: _isFullScreen
        ? Stack(
            children: [
              // Indicateur de page en mode plein écran
              Positioned(
                top: 16,
                right: 16,
                child: defaultTargetPlatform == TargetPlatform.android
                  ? GestureDetector(
                      onTap: _showPageDialog,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Theme.of(context).primaryColor.withOpacity(0.9),
                              Theme.of(context).primaryColor.withOpacity(0.8),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: Theme.of(context).primaryColor.withOpacity(0.3),
                            width: 1.5,
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.pageview,
                              size: 16,
                              color: Colors.white,
                            ),
                            const SizedBox(width: 6),
                            Text(
                              '${_currentPage + 1} / ${_pages.length}',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  : GestureDetector(
                      onTap: _showPageDialog,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Theme.of(context).primaryColor.withOpacity(0.9),
                              Theme.of(context).primaryColor.withOpacity(0.8),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: Theme.of(context).primaryColor.withOpacity(0.3),
                            width: 1.5,
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.pageview,
                              size: 18,
                              color: Colors.white,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              '${_currentPage + 1} / ${_pages.length}',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
              ),
              NotificationListener<ScrollNotification>(
                onNotification: (ScrollNotification notification) {
                  print('DEBUG: Scroll notification reçue: ${notification.runtimeType}');
                  if (notification is ScrollStartNotification && _currentPage == _pages.length - 1) {
                    print('DEBUG: Début de swipe détecté sur la dernière page (mode plein écran)');
                    _hasAttemptedSwipeBeyondLastPage = true;
                  }
                  if (notification is ScrollEndNotification) {
                    print('DEBUG: Scroll terminée - Page actuelle: $_currentPage, Total: ${_pages.length}');
                    // Vérifier si on a essayé de swiper au-delà de la dernière page
                    if (_currentPage == _pages.length - 1 && _hasAttemptedSwipeBeyondLastPage) {
                      print('DEBUG: Tentative de swipe au-delà de la dernière page détectée (mode plein écran)');
                      // Attendre un peu puis afficher le dialogue
                      Future.delayed(const Duration(milliseconds: 1), () {
                        if (mounted && _currentPage == _pages.length - 1 && _hasAttemptedSwipeBeyondLastPage) {
                          print('DEBUG: Affichage du dialogue de completion (mode plein écran)');
                          _showCompletionDialog();
                          _hasAttemptedSwipeBeyondLastPage = false;
                        }
                      });
                    }
                  }
                  return false;
                },
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: _pages.length,
                  onPageChanged: _handlePageChange,
                  physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return InteractiveViewer(
                              maxScale: 4.0,
                              minScale: 0.5,
                              child: Image.asset(
                                _pages[index],
                                fit: BoxFit.contain,
                                cacheWidth: 800, // Optimisation de la mémoire
                                errorBuilder: (context, error, stackTrace) {
                                  return Center(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.image_not_supported,
                                          size: 64,
                                          color: Colors.grey[600],
                                        ),
                                        const SizedBox(height: 16),
                                        Text(
                                          localizations?.imageNotAvailable ?? 
                                          "Image non disponible",
                                          style: Theme.of(context).textTheme.titleMedium,
                                          textAlign: TextAlign.center,
                                        ),
                                        const SizedBox(height: 8),
                                        Text(
                                          "Page ${index + 1} de la section ${widget.idCoran}",
                                          style: Theme.of(context).textTheme.bodyMedium,
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            );
                          },
              ),
            ),
              // Bouton pour quitter le mode plein écran
              Positioned(
                bottom: 16,
                right: 16,
                child: FloatingActionButton(
                  onPressed: _toggleFullScreen,
                  backgroundColor: Colors.black.withOpacity(0.7),
                  foregroundColor: Colors.white,
                  child: const Icon(Icons.fullscreen_exit),
                ),
              ),
            ],
          )
        : Column(
            children: [
              // Indicateur de page en haut
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                defaultTargetPlatform == TargetPlatform.android
                  ? GestureDetector(
                      onTap: _showPageDialog,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Theme.of(context).primaryColor.withOpacity(0.1),
                              Theme.of(context).primaryColor.withOpacity(0.2),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: Theme.of(context).primaryColor.withOpacity(0.3),
                            width: 1.5,
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.pageview,
                              size: 16,
                              color: Theme.of(context).primaryColor,
                            ),
                            const SizedBox(width: 6),
                            Text(
                              '${_currentPage + 1} / ${_pages.length}',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  : GestureDetector(
                      onTap: _showPageDialog,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Theme.of(context).primaryColor.withOpacity(0.1),
                              Theme.of(context).primaryColor.withOpacity(0.2),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: Theme.of(context).primaryColor.withOpacity(0.3),
                            width: 1.5,
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.pageview,
                              size: 18,
                              color: Theme.of(context).primaryColor,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              '${_currentPage + 1} / ${_pages.length}',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
              ],
            ),
          ),
          // Contenu principal
          Expanded(
            child: _pages.isEmpty
              // Affiche un message informatif si les images ne sont pas disponibles
              ? Center(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.info_outline,
                          size: 64,
                          color: Theme.of(context).primaryColor,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          localizations?.quranSectionNotAvailable(widget.idCoran) ?? 
                          "Section ${widget.idCoran} non disponible",
                          style: Theme.of(context).textTheme.headlineSmall,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          localizations?.quranSectionInfo ?? 
                          "Cette section du Coran n'est pas encore disponible dans cette version de l'application.",
                          style: Theme.of(context).textTheme.bodyMedium,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text(localizations?.goBack ?? 'Retour'),
                        ),
                      ],
                    ),
                  ),
                )
              // Affiche le PageView avec contrôles de navigation
              : Column(
                  children: [
                    // Zone de lecture principale
                    Expanded(
                      child: NotificationListener<ScrollNotification>(
                        onNotification: (ScrollNotification notification) {
                          print('DEBUG: Scroll notification reçue (mode normal): ${notification.runtimeType}');
                          if (notification is ScrollStartNotification && _currentPage == _pages.length - 1) {
                            print('DEBUG: Début de swipe détecté sur la dernière page');
                            _hasAttemptedSwipeBeyondLastPage = true;
                          }
                          if (notification is ScrollEndNotification) {
                            print('DEBUG: Scroll terminée (mode normal) - Page actuelle: $_currentPage, Total: ${_pages.length}');
                            // Ne déclencher le dialogue que si on a essayé de swiper depuis la dernière page
                            if (_currentPage == _pages.length - 1 && _hasAttemptedSwipeBeyondLastPage) {
                              print('DEBUG: Tentative de swipe au-delà de la dernière page détectée (mode normal)');
                              // Attendre un peu puis afficher le dialogue
                              Future.delayed(const Duration(milliseconds: 100), () {
                                if (mounted && _currentPage == _pages.length - 1 && _hasAttemptedSwipeBeyondLastPage) {
                                  print('DEBUG: Affichage du dialogue de completion (mode normal)');
                                  _showCompletionDialog();
                                  _hasAttemptedSwipeBeyondLastPage = false;
                                }
                              });
                            }
                          }
                          return false;
                        },
                        child: PageView.builder(
                          controller: _pageController,
                          itemCount: _pages.length,
                          onPageChanged: _handlePageChange,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: InteractiveViewer(
                                maxScale: 4.0,
                                minScale: 0.5,
                                child: Image.asset(
                                  _pages[index],
                                  fit: BoxFit.contain,
                                  cacheWidth: 800, // Optimisation de la mémoire
                                  errorBuilder: (context, error, stackTrace) {
                                    return Center(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.image_not_supported,
                                            size: 64,
                                            color: Colors.grey[600],
                                          ),
                                          const SizedBox(height: 16),
                                          Text(
                                            localizations?.imageNotAvailable ?? 
                                            "Image non disponible",
                                            style: Theme.of(context).textTheme.titleMedium,
                                            textAlign: TextAlign.center,
                                          ),
                                          const SizedBox(height: 8),
                                          Text(
                                            "Page ${index + 1} de la section ${widget.idCoran}",
                                            style: Theme.of(context).textTheme.bodyMedium,
                                            textAlign: TextAlign.center,
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),
                            );
                          },
                      ),
                    ),
                  ),
                    // Barre de navigation en bas
                    Container(
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 4,
                            offset: const Offset(0, -2),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Bouton flèche gauche (circulaire) - garde les couleurs actuelles
                          Container(
                            width: 50,
                            height: 50,
                            child: ElevatedButton(
                              onPressed: _currentPage > 0 ? _previousPage : null,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: _currentPage > 0 
                                    ? Theme.of(context).primaryColor 
                                    : Colors.grey,
                                foregroundColor: Colors.white,
                                elevation: _currentPage > 0 ? 4 : 1,
                                shadowColor: _currentPage > 0 
                                    ? Theme.of(context).primaryColor.withOpacity(0.3)
                                    : Colors.grey.withOpacity(0.3),
                                shape: const CircleBorder(),
                                padding: EdgeInsets.zero,
                              ),
                              child: const Icon(Icons.arrow_back, color: Colors.white),
                            ),
                          ),
                          
                          // Bouton "رجوع" (rectangulaire) - garde les couleurs actuelles
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 8),
                            child: SizedBox(
                                height: 40,
                                child: ElevatedButton.icon(
                                onPressed: () => Navigator.of(context).pop(),
                                icon: const Icon(Icons.arrow_back),
                                label: const Text('رجوع'),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.orange,
                                  foregroundColor: Colors.white,
                                  elevation: 4,
                                  shadowColor: Colors.orange.withOpacity(0.3),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          
                          // Bouton de thème
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 8),
                            child: SizedBox(
                              height: 40,
                              width: 40,
                              child: ElevatedButton(
                                onPressed: () {
                                  context.read<ThemeProvider>().toggleTheme();
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Theme.of(context).primaryColor,
                                  foregroundColor: Colors.white,
                                  elevation: 4,
                                  shadowColor: Theme.of(context).primaryColor.withOpacity(0.3),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                                ),
                                child: Icon(
                                  context.watch<ThemeProvider>().isDarkMode 
                                    ? Icons.light_mode 
                                    : Icons.dark_mode,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          
                          defaultTargetPlatform == TargetPlatform.android
                            ? Container(
                                margin: const EdgeInsets.symmetric(horizontal: 8),
                                child: SizedBox(
                                  height: 40,
                                  width: 35,
                                  child: ElevatedButton(
                                    onPressed: _toggleFullScreen,
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: _isFullScreen 
                                          ? Colors.orange 
                                          : Theme.of(context).primaryColor,
                                      foregroundColor: Colors.white,
                                      elevation: 4,
                                      shadowColor: (_isFullScreen 
                                          ? Colors.orange 
                                          : Theme.of(context).primaryColor).withOpacity(0.3),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                                    ),
                                    child: Icon(
                                      _isFullScreen ? Icons.fullscreen_exit : Icons.fullscreen,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              )
                              : Container(
                                    margin: const EdgeInsets.symmetric(horizontal: 8),
                                    child: SizedBox(
                                      width: 120,
                                      height: 40,
                                      child: ElevatedButton.icon(
                                        onPressed: _toggleFullScreen,
                                        icon: Icon(_isFullScreen ? Icons.fullscreen_exit : Icons.fullscreen),
                                        label: const Text('تكبير'),
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: _isFullScreen 
                                              ? Colors.orange 
                                              : Theme.of(context).primaryColor,
                                          foregroundColor: Colors.white,
                                          elevation: 4,
                                          shadowColor: (_isFullScreen 
                                              ? Colors.orange 
                                              : Theme.of(context).primaryColor).withOpacity(0.3),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(8),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                          
                          // Bouton flèche droite (circulaire) - garde les couleurs actuelles
                          Container(
                            width: 50,
                            height: 50,
                            child: ElevatedButton(
                              onPressed: _nextPage,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Theme.of(context).primaryColor,
                                foregroundColor: Colors.white,
                                elevation: 4,
                                shadowColor: Theme.of(context).primaryColor.withOpacity(0.3),
                                shape: const CircleBorder(),
                                padding: EdgeInsets.zero,
                              ),
                              child: const Icon(Icons.arrow_forward, color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
          ),
        ],
      ),
    );
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

  /// Retourne le texte du thème adapté selon la langue
  String _getThemeText(BuildContext context, bool isTitle) {
    final locale = Localizations.localeOf(context).languageCode;
    
    if (locale == 'ar') {
      return isTitle ? 'المظهر' : (context.watch<ThemeProvider>().isDarkMode ? 'الوضع المظلم' : 'الوضع الفاتح');
    } else {
      return isTitle ? 'Thème' : (context.watch<ThemeProvider>().isDarkMode ? 'Mode sombre' : 'Mode clair');
    }
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
}
 