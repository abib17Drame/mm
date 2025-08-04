import 'package:flutter/material.dart';
import '../auxiliaires/donnees_statiques.dart';

/// Écran pour afficher les pages du Coran.
/// Il utilise un PageView pour permettre de balayer les pages.
class EcranQuran extends StatelessWidget {
  final int idCoran;

  const EcranQuran({Key? key, required this.idCoran}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Récupère la liste des images pour la section du Coran demandée.
    final List<String> pages = DonneesStatiques.getImagesPourCoran(idCoran);

    return Scaffold(
      appBar: AppBar(
        title: Text('Lecture du Coran (Section $idCoran)'),
      ),
      // Le corps de l'écran.
      body: pages.isEmpty
          // Affiche un message si les images ne sont pas disponibles (non incluses dans l'exemple).
          ? Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  "Les images pour la section $idCoran n'ont pas pu être chargées. Seules les images pour la section 1 sont incluses dans cet exemple.",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
            )
          // Affiche le PageView si des images sont disponibles.
          : PageView.builder(
              // Le sens de lecture est de droite à gauche.
              reverse: true,
              itemCount: pages.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  // InteractiveViewer permet de pincer pour zoomer.
                  child: InteractiveViewer(
                    maxScale: 4.0, // Zoom maximum
                    child: Image.asset(
                      pages[index],
                      fit: BoxFit.contain, // L'image s'adapte à l'écran.
                      // Affiche un indicateur de chargement pendant que l'image charge.
                      loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Center(
                          child: CircularProgressIndicator(
                            value: loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                                : null,
                          ),
                        );
                      },
                      // Affiche une icône d'erreur si l'image ne peut pas être chargée.
                      errorBuilder: (context, error, stackTrace) {
                        return const Center(child: Icon(Icons.error_outline, color: Colors.red, size: 50));
                      },
                    ),
                  ),
                );
              },
            ),
    );
  }
}
