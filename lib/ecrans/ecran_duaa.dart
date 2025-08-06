import 'dart:io';
import 'package:flutter/material.dart';
import 'package:khatma_flutter/l10n/app_localizations.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/services.dart';
import 'dart:developer' as developer;
import 'package:share_plus/share_plus.dart';
import 'package:file_picker/file_picker.dart';
import 'package:khatma_flutter/ecrans/ecran_quran.dart';

/// Écran affichant le Duaa (prière) de la ختم القرآن en utilisant les images.
class EcranDuaa extends StatefulWidget {
  const EcranDuaa({Key? key}) : super(key: key);

  @override
  _EcranDuaaState createState() => _EcranDuaaState();
}

class _EcranDuaaState extends State<EcranDuaa> {
  bool _isLoading = true;
  String? _errorMessage;
  bool _isInitialized = false;
  int _currentPage = 1;
  final int _totalPages = 5;
  final PageController _pageController = PageController();
  
  // Variables pour le plein écran et le zoom
  bool _isFullScreen = false;
  bool _isZoomEnabled = false;
  double _zoomLevel = 1.0;
  final TransformationController _transformationController = TransformationController();

  @override
  void initState() {
    super.initState();
    developer.log('EcranDuaa: Initialisation...', name: 'IMAGE_DEBUG');
    _initializeImages();
    
    // Ajouter un listener pour détecter les tentatives de swipe au-delà de la dernière page
    _pageController.addListener(() {
      if (_pageController.page != null) {
        final currentPage = _pageController.page!.round();
        if (currentPage == _totalPages - 1) {
          developer.log('EcranDuaa: PageController listener - Dernière page détectée', name: 'IMAGE_DEBUG');
        }
      }
    });
  }

  /// Initialise les images
  Future<void> _initializeImages() async {
    try {
      developer.log('EcranDuaa: Initialisation des images...', name: 'IMAGE_DEBUG');
      
      // Vérifier que les images existent dans les assets
      for (int i = 1; i <= _totalPages; i++) {
        try {
          await DefaultAssetBundle.of(context).load('assets/khatma/$i.jpg');
          developer.log('EcranDuaa: Image $i.jpg trouvée', name: 'IMAGE_DEBUG');
        } catch (e) {
          developer.log('EcranDuaa: Erreur lors du chargement de $i.jpg: $e', name: 'IMAGE_DEBUG');
          throw Exception('Image $i.jpg introuvable');
        }
      }

      if (mounted) {
        setState(() {
          _isInitialized = true;
          _isLoading = false;
        });
      }
    } catch (e) {
      developer.log('EcranDuaa: Erreur lors de l\'initialisation des images: $e', name: 'IMAGE_DEBUG');
      if (mounted) {
        setState(() {
          _isInitialized = true;
          _isLoading = false;
          _errorMessage = 'Erreur lors du chargement des images: $e';
        });
      }
    }
  }

  /// Partage l'image actuelle via les applications disponibles
  Future<void> _shareCurrentImage() async {
    try {
      developer.log('EcranDuaa: Partage de l\'image $_currentPage.jpg', name: 'IMAGE_DEBUG');
      
      final ByteData data = await DefaultAssetBundle.of(context).load('assets/khatma/$_currentPage.jpg');
      final directory = await getTemporaryDirectory();
      final file = File('${directory.path}/$_currentPage.jpg');
      await file.writeAsBytes(data.buffer.asUint8List());

      await Share.shareXFiles(
        [XFile(file.path)],
        text: 'دعاء ختم القرآن الكريم - Page $_currentPage - Duaa Khatma Al-Quran',
        subject: 'دعاء ختم القرآن الكريم - Page $_currentPage',
      );
      
      developer.log('EcranDuaa: Image partagée avec succès', name: 'IMAGE_DEBUG');
    } catch (e) {
      developer.log('EcranDuaa: Erreur lors du partage de l\'image: $e', name: 'IMAGE_DEBUG');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Erreur lors du partage: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  /// Affiche le dialogue de  du duaa
  void _showDuaaCompletionDialog() {
    developer.log('EcranDuaa: _showDuaaCompletionDialog appelée', name: 'IMAGE_DEBUG');
    
    // Forcer le retour à la dernière page réelle
    _pageController.animateToPage(
      _totalPages - 1,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
    
    final localizations = AppLocalizations.of(context);
    
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
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
                  localizations?.khatmaCompleted ?? 'Khatma terminée',
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                localizations?.khatmaCompletionMessage ?? 'Félicitations ! Vous avez terminé la Khatma complète.',
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Text(
                localizations?.continueToNewKhatma ?? 'Voulez-vous commencer une nouvelle Khatma ?',
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(localizations?.no ?? 'لا'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                _goToHizb1();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).primaryColor,
                foregroundColor: Colors.white,
              ),
              child: Text(localizations?.yes ?? 'نعم'),
            ),
          ],
        );
      },
    );
  }

  /// Navigue vers le hizb 1 pour commencer une nouvelle khatma
  void _goToHizb1() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => const EcranQuran(
          idCoran: 1,
        ),
      ),
    );
  }

  /// Bascule le mode plein écran
  void _toggleFullScreen() {
    setState(() {
      _isFullScreen = !_isFullScreen;
    });
  }

  /// Bascule le mode zoom
  void _toggleZoom() {
    setState(() {
      _isZoomEnabled = !_isZoomEnabled;
      if (!_isZoomEnabled) {
        // Réinitialiser le zoom quand on désactive
        _transformationController.value = Matrix4.identity();
        _zoomLevel = 1.0;
      }
    });
  }

  /// Réinitialise le zoom
  void _resetZoom() {
    setState(() {
      _transformationController.value = Matrix4.identity();
      _zoomLevel = 1.0;
    });
  }

  /// Vérifie si l'utilisateur essaie de swiper au-delà de la dernière page
  void _checkSwipeBeyondLastPage() {
    developer.log('EcranDuaa: _checkSwipeBeyondLastPage appelée - _currentPage: $_currentPage, _totalPages: $_totalPages', name: 'IMAGE_DEBUG');
    if (_currentPage == _totalPages) {
      developer.log('EcranDuaa: Vérification swipe au-delà de la dernière page', name: 'IMAGE_DEBUG');
      // Attendre un peu puis afficher le dialogue
      Future.delayed(const Duration(milliseconds: 200), () {
        if (mounted && _currentPage == _totalPages) {
          developer.log('EcranDuaa: Affichage du dialogue de completion', name: 'IMAGE_DEBUG');
          _showDuaaCompletionDialog();
        } else {
          developer.log('EcranDuaa: Widget non monté ou page changée', name: 'IMAGE_DEBUG');
        }
      });
    } else {
      developer.log('EcranDuaa: Pas à la dernière page - _currentPage: $_currentPage, _totalPages: $_totalPages', name: 'IMAGE_DEBUG');
    }
  }

  /// Partage le PDF du khatma
  Future<void> _partagerPdf() async {
    try {
      developer.log('EcranDuaa: Partage du PDF du khatma', name: 'IMAGE_DEBUG');
      
      // Charger le PDF depuis les assets
      final ByteData data = await DefaultAssetBundle.of(context).load('assets/khatma/khatma.pdf');
      final directory = await getTemporaryDirectory();
      final file = File('${directory.path}/khatma.pdf');
      await file.writeAsBytes(data.buffer.asUint8List());

      await Share.shareXFiles(
        [XFile(file.path)],
        text: 'دعاء ختم القرآن الكريم - Duaa Khatm Al-Quran',
        subject: 'دعاء ختم القرآن الكريم - Duaa Khatm Al-Quran',
      );
      
      developer.log('EcranDuaa: PDF partagé avec succès', name: 'IMAGE_DEBUG');
    } catch (e) {
      developer.log('EcranDuaa: Erreur lors du partage du PDF: $e', name: 'IMAGE_DEBUG');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Erreur lors du partage du PDF: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  /// Télécharge le PDF complet en permettant à l'utilisateur de choisir le dossier
  Future<void> _downloadPdf() async {
    try {
      developer.log('EcranDuaa: Demande de sélection du dossier pour le PDF', name: 'IMAGE_DEBUG');
      
      // Demander à l'utilisateur de choisir le dossier de destination
      String? selectedDirectory = await FilePicker.platform.getDirectoryPath(
        dialogTitle: 'Choisir le dossier pour sauvegarder le PDF',
      );
      
      if (selectedDirectory == null) {
        developer.log('EcranDuaa: Aucun dossier sélectionné', name: 'IMAGE_DEBUG');
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Aucun dossier sélectionné'),
              backgroundColor: Colors.orange,
              duration: Duration(seconds: 2),
            ),
          );
        }
        return;
      }
      
      developer.log('EcranDuaa: Dossier sélectionné: $selectedDirectory', name: 'IMAGE_DEBUG');
      
      // Charger le PDF depuis les assets
      final ByteData data = await DefaultAssetBundle.of(context).load('assets/khatma/khatma.pdf');
      final file = File('$selectedDirectory/khatma.pdf');
      await file.writeAsBytes(data.buffer.asUint8List());

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('PDF téléchargé avec succès dans: $selectedDirectory/khatma.pdf'),
            backgroundColor: Colors.green,
            duration: const Duration(seconds: 4),
            action: SnackBarAction(
              label: 'OK',
              textColor: Colors.white,
              onPressed: () {},
            ),
          ),
        );
      }
      
      developer.log('EcranDuaa: PDF téléchargé avec succès dans $selectedDirectory', name: 'IMAGE_DEBUG');
    } catch (e) {
      developer.log('EcranDuaa: Erreur lors du téléchargement du PDF: $e', name: 'IMAGE_DEBUG');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Erreur lors du téléchargement du PDF: $e'),
            backgroundColor: Colors.red,
            duration: const Duration(seconds: 4),
          ),
        );
      }
    }
  }

  void _goToPage(int page) {
    if (page >= 1 && page <= _totalPages) {
      setState(() {
        _currentPage = page;
      });
      _pageController.animateToPage(
        page - 1,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else if (page > _totalPages) {
      // L'utilisateur essaie d'aller au-delà de la dernière page
      _showDuaaCompletionDialog();
    }
  }

  @override
  void dispose() {
    developer.log('EcranDuaa: Disposal...', name: 'IMAGE_DEBUG');
    _pageController.dispose();
    _transformationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    developer.log('EcranDuaa: Build appelé, isLoading: $_isLoading, error: $_errorMessage, currentPage: $_currentPage', name: 'IMAGE_DEBUG');
    
    final localizations = AppLocalizations.of(context);
    final theme = Theme.of(context);

    // Si en mode plein écran, afficher seulement l'image avec les contrôles de zoom
    if (_isFullScreen) {
      return Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            // Image en plein écran
            _buildFullScreenImageViewer(),
            // Bouton reset zoom en haut à droite
            if (_isZoomEnabled)
              Positioned(
                top: MediaQuery.of(context).padding.top + 16,
                right: 16,
                child: FloatingActionButton.small(
                  onPressed: _resetZoom,
                  backgroundColor: Colors.black54,
                  foregroundColor: Colors.white,
                  child: const Icon(Icons.refresh),
                ),
              ),
            // Indicateur de page en haut au centre
            Positioned(
              top: MediaQuery.of(context).padding.top + 16,
              left: 0,
              right: 0,
              child: Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    '$_currentPage / $_totalPages',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            // Bouton sortir plein écran en bas
            Positioned(
              bottom: MediaQuery.of(context).padding.bottom + 16,
              left: 0,
              right: 0,
              child: Center(
                child: FloatingActionButton(
                  onPressed: _toggleFullScreen,
                  backgroundColor: Colors.black54,
                  foregroundColor: Colors.white,
                  child: const Icon(Icons.fullscreen_exit),
                ),
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: theme.colorScheme.background,
      appBar: AppBar(
        title: Text(
          localizations?.quranRecitation ?? 'دعاء ختم القرآن الكريم',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        elevation: 0,
        backgroundColor: theme.colorScheme.primary,
        foregroundColor: theme.colorScheme.onPrimary,
        actions: [],
      ),
      body: _buildImageViewer(),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: theme.colorScheme.surface,
          border: Border(
            top: BorderSide(
              color: theme.colorScheme.outline.withOpacity(0.2),
              width: 1,
            ),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 4,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Barre de navigation des pages
              Container(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Bouton première page
                    IconButton(
                      icon: const Icon(Icons.first_page),
                      onPressed: () {
                        developer.log('EcranDuaa: First page pressed', name: 'IMAGE_DEBUG');
                        _goToPage(1);
                      },
                      tooltip: 'Première page',
                    ),
                    // Bouton page précédente
                    IconButton(
                      icon: const Icon(Icons.chevron_left),
                      onPressed: () {
                        developer.log('EcranDuaa: Previous page pressed', name: 'IMAGE_DEBUG');
                        _goToPage(_currentPage - 1);
                      },
                      tooltip: 'Page précédente',
                    ),
                    // Indicateur de page
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: theme.colorScheme.primary.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        '$_currentPage/$_totalPages',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: theme.colorScheme.primary,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    // Bouton page suivante
                    IconButton(
                      icon: const Icon(Icons.chevron_right),
                      onPressed: () {
                        developer.log('EcranDuaa: Next page pressed', name: 'IMAGE_DEBUG');
                        _goToPage(_currentPage + 1);
                      },
                      tooltip: 'Page suivante',
                    ),
                    // Bouton dernière page
                    IconButton(
                      icon: const Icon(Icons.last_page),
                      onPressed: () {
                        developer.log('EcranDuaa: Last page pressed', name: 'IMAGE_DEBUG');
                        _goToPage(_totalPages);
                      },
                      tooltip: 'Dernière page',
                    ),
                  ],
                ),
              ),
              // Barre d'actions
              Wrap(
                alignment: WrapAlignment.center,
                spacing: 8,
                runSpacing: 8,
                children: [
                  // Bouton plein écran
                  ElevatedButton(
                    onPressed: _toggleFullScreen,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _isFullScreen ? Colors.orange.shade600 : Colors.blue.shade600,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Icon(_isFullScreen ? Icons.fullscreen_exit : Icons.fullscreen),
                  ),
                  // Bouton partager PDF
                  ElevatedButton(
                    onPressed: _partagerPdf,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green.shade600,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Icon(Icons.share),
                  ),
                  // Bouton télécharger PDF
                  ElevatedButton(
                    onPressed: _downloadPdf,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: theme.colorScheme.secondary,
                      foregroundColor: theme.colorScheme.onSecondary,
                      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Icon(Icons.download),
                  ),
                  // Bouton retour
                  ElevatedButton.icon(
                    onPressed: () {
                      developer.log('EcranDuaa: Bouton retour pressed', name: 'IMAGE_DEBUG');
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(Icons.arrow_back),
                    label: Text(
                      localizations?.goBack ?? 'Retour',
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: theme.colorScheme.primary,
                      foregroundColor: theme.colorScheme.onPrimary,
                      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImageViewer() {
    developer.log('EcranDuaa: _buildImageViewer appelé, isLoading: $_isLoading, error: $_errorMessage, currentPage: $_currentPage', name: 'IMAGE_DEBUG');
    
    if (!_isInitialized) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 16),
            Text('Initialisation des images...'),
          ],
        ),
      );
    }
    
    if (_errorMessage != null) {
      return Center(
            child: Container(
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.background,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.error_outline,
                    size: 64,
                    color: Theme.of(context).colorScheme.error,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Erreur de chargement',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    _errorMessage!,
                    style: Theme.of(context).textTheme.bodyMedium,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                  developer.log('EcranDuaa: Bouton réessayer pressed', name: 'IMAGE_DEBUG');
                      setState(() {
                        _isLoading = true;
                        _errorMessage = null;
                        _isInitialized = false;
                    _currentPage = 1;
                      });
                  _initializeImages();
                    },
                    child: const Text('Réessayer'),
              ),
            ],
          ),
        ),
      );
    }
    
    return Stack(
      children: [
        PageView.builder(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() {
              _currentPage = index + 1;
            });
            developer.log('EcranDuaa: Page changée vers: $_currentPage', name: 'IMAGE_DEBUG');
            
            // Si on est à la dernière page, vérifier si on essaie d'aller plus loin
            if (_currentPage == _totalPages) {
              developer.log('EcranDuaa: Dernière page atteinte', name: 'IMAGE_DEBUG');
            }
            
            // Si on essaie d'aller au-delà de la dernière page
            if (index == _totalPages) {
              developer.log('EcranDuaa: Page virtuelle atteinte - index: $index', name: 'IMAGE_DEBUG');
              _showDuaaCompletionDialog();
            }
          },
          itemCount: _totalPages + 1, // Permettre le swipe au-delà de la dernière page
          itemBuilder: (context, index) {
            final pageNumber = index + 1;
            
            return InteractiveViewer(
              minScale: _isZoomEnabled ? 0.5 : 1.0,
              maxScale: _isZoomEnabled ? 4.0 : 1.0,
              transformationController: _isZoomEnabled ? _transformationController : null,
              child: Center(
                child: Image.asset(
                  'assets/khatma/$pageNumber.jpg',
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    developer.log('EcranDuaa: Erreur lors du chargement de $pageNumber.jpg: $error', name: 'IMAGE_DEBUG');
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.broken_image,
                            size: 64,
                            color: Theme.of(context).colorScheme.error,
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'Erreur de chargement de l\'image',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Page $pageNumber',
                            style: Theme.of(context).textTheme.bodyMedium,
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
        if (_isLoading)
          Container(
            color: Theme.of(context).colorScheme.background.withOpacity(0.8),
            child: const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 16),
                  Text(
                    'Chargement des images...',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }

  /// Affiche l'image en mode plein écran avec zoom
  Widget _buildFullScreenImageViewer() {
    return PageView.builder(
      controller: _pageController,
      onPageChanged: (index) {
        setState(() {
          _currentPage = index + 1;
        });
        developer.log('EcranDuaa: Page changée vers: $_currentPage (mode plein écran)', name: 'IMAGE_DEBUG');
        
        // Si on essaie d'aller au-delà de la dernière page
        if (index == _totalPages) {
          developer.log('EcranDuaa: Page virtuelle atteinte (mode plein écran) - index: $index', name: 'IMAGE_DEBUG');
          _showDuaaCompletionDialog();
        }
      },
      itemCount: _totalPages + 1, // Permettre le swipe au-delà de la dernière page
      itemBuilder: (context, index) {
        final pageNumber = index + 1;
        
        return InteractiveViewer(
          minScale: 0.5,
          maxScale: 4.0,
          transformationController: _transformationController,
          child: Center(
            child: Image.asset(
              'assets/khatma/$pageNumber.jpg',
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) {
                developer.log('EcranDuaa: Erreur lors du chargement de $pageNumber.jpg: $error', name: 'IMAGE_DEBUG');
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.broken_image,
                        size: 64,
                        color: Colors.white,
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Erreur de chargement de l\'image',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Page $pageNumber',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}