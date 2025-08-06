import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

/// Gestionnaire pour les fichiers locaux (PDF, images, etc.)
class GestionnaireFichiersLocaux {
  static final GestionnaireFichiersLocaux _instance = GestionnaireFichiersLocaux._internal();
  factory GestionnaireFichiersLocaux() => _instance;
  GestionnaireFichiersLocaux._internal();

  /// Copie le PDF du duaa depuis les assets vers le stockage local
  Future<String?> copierPdfDuaaEnLocal() async {
    try {
      // Obtenir le répertoire de documents
      final Directory documentsDir = await getApplicationDocumentsDirectory();
      final String dossierPdf = path.join(documentsDir.path, 'pdfs');
      
      // Créer le dossier s'il n'existe pas
      final Directory dossier = Directory(dossierPdf);
      if (!await dossier.exists()) {
        await dossier.create(recursive: true);
      }
      
      // Chemin du fichier local
      final String cheminLocal = path.join(dossierPdf, 'khatma.pdf');
      final File fichierLocal = File(cheminLocal);
      
      // Vérifier si le fichier existe déjà
      if (await fichierLocal.exists()) {
        print('PDF du duaa déjà présent en local: $cheminLocal');
        return cheminLocal;
      }
      
      // Copier le fichier depuis les assets
      print('Copie du PDF du duaa vers le stockage local...');
      final ByteData data = await rootBundle.load('assets/pdf/khatma.pdf');
      final Uint8List bytes = data.buffer.asUint8List();
      await fichierLocal.writeAsBytes(bytes);
      
      print('PDF du duaa copié avec succès: $cheminLocal');
      return cheminLocal;
    } catch (e) {
      print('Erreur lors de la copie du PDF: $e');
      return null;
    }
  }

  /// Vérifie si le PDF du duaa existe en local
  Future<bool> pdfDuaaExisteEnLocal() async {
    try {
      final Directory documentsDir = await getApplicationDocumentsDirectory();
      final String cheminLocal = path.join(documentsDir.path, 'pdfs', 'khatma.pdf');
      final File fichierLocal = File(cheminLocal);
      return await fichierLocal.exists();
    } catch (e) {
      print('Erreur lors de la vérification du PDF local: $e');
      return false;
    }
  }

  /// Obtient le chemin du PDF du duaa (local ou asset)
  Future<String> obtenirCheminPdfDuaa() async {
    try {
      // Essayer d'abord le fichier local
      if (await pdfDuaaExisteEnLocal()) {
        final Directory documentsDir = await getApplicationDocumentsDirectory();
        final String cheminLocal = path.join(documentsDir.path, 'pdfs', 'khatma.pdf');
        print('GestionnaireFichiersLocaux: Utilisation du fichier local: $cheminLocal');
        return cheminLocal;
      }
      
      // Sinon, copier en local et retourner le chemin
      print('GestionnaireFichiersLocaux: Tentative de copie en local...');
      final String? cheminLocal = await copierPdfDuaaEnLocal();
      if (cheminLocal != null) {
        print('GestionnaireFichiersLocaux: Copie réussie, utilisation du fichier local');
        return cheminLocal;
      }
      
      // En dernier recours, utiliser l'asset
      print('GestionnaireFichiersLocaux: Utilisation de l\'asset par défaut');
      return 'assets/pdf/khatma.pdf';
    } catch (e) {
      print('GestionnaireFichiersLocaux: Erreur lors de l\'obtention du chemin: $e');
      return 'assets/pdf/khatma.pdf';
    }
  }

  /// Supprime le fichier PDF local (pour forcer une nouvelle copie)
  Future<bool> supprimerPdfLocal() async {
    try {
      final Directory documentsDir = await getApplicationDocumentsDirectory();
      final String cheminLocal = path.join(documentsDir.path, 'pdfs', 'khatma.pdf');
      final File fichierLocal = File(cheminLocal);
      
      if (await fichierLocal.exists()) {
        await fichierLocal.delete();
        print('PDF local supprimé avec succès');
        return true;
      }
      return false;
    } catch (e) {
      print('Erreur lors de la suppression du PDF local: $e');
      return false;
    }
  }
} 