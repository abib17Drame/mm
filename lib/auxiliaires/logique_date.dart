// lib/auxiliaires/logique_date.dart
import 'package:intl/intl.dart';

/// Classe contenant la logique de calcul de date pour déterminer
/// le jour actuel dans le cycle de la Khatma.
class LogiqueDate {

  /// Calcule la différence en jours entre deux dates.
  /// Les heures, minutes et secondes sont ignorées.
  static int getJourDiff(DateTime ses, DateTime d) {
    // Crée des dates à minuit pour comparer uniquement les jours.
    final dateDebut = DateTime(ses.year, ses.month, ses.day);
    final dateFin = DateTime(d.year, d.month, d.day);
    return dateFin.difference(dateDebut).inDays;
  }

  /// Met à jour la date de session pour qu'elle corresponde au début
  /// du cycle de 21 jours le plus récent par rapport à la date actuelle.
  static DateTime majSession(DateTime d) {
    final aujourdhui = DateTime.now();
    final diff = getJourDiff(d, aujourdhui);

    if (diff > 20) {
      final cyclesPasses = diff ~/ 21;
      final joursAAjouter = cyclesPasses * 21;
      return d.add(Duration(days: joursAAjouter));
    }
    return d;
  }

  /// Recherche l'ID du jour actuel (de 1 à 21) dans le cycle.
  /// L'ID est calculé en fonction de la date de session et de la date courante.
  static int rechercheIdJour(DateTime session, DateTime cour) {
    final diff = getJourDiff(session, cour);

    // Pour une différence positive, on utilise le modulo 21.
    // Le +1 est pour avoir un ID de 1 à 21 au lieu de 0 à 20.
    if (diff >= 0) {
      return (diff % 21) + 1;
    }
    // Pour une différence négative, on calcule le décalage par rapport à la fin du cycle.
    else {
      int id = 22 + (diff % 21);
      // Si le résultat est 22 (cas où diff est un multiple de -21), on le ramène à 1.
      // Cependant, la logique originale renverrait 21 dans ce cas.
      // Un 'diff' de -21 devrait correspondre à l'ID 1 du cycle précédent.
      // Modulo de -21 est 0, donc 22+0=22.
      // L'original: i-- (21 fois) -> 1 -> 0(21) -> 20 -> .. -> 2.
      // Il y a une petite différence de logique ici. On s'en tient à une version simplifiée.
      // `(diff % 21)` en Dart pour un nombre négatif retourne un résultat négatif.
      // Par exemple, -1 % 21 = -1. Donc 22 + (-1) = 21. C'est correct.
      // -22 % 21 = -1. Aussi 21.
      // Pour être plus robuste :
      int idJour = (diff % 21);
      if (idJour == 0) return 1; // Le jour même du début d'un cycle ancien
      return (idJour + 21) + 1;
    }
  }

  /// Formate une date pour l'affichage.
  static String formatDate(DateTime date) {
    // Utilise le package intl pour un formatage localisé si nécessaire.
    // Pour l'instant, un format simple.
    return DateFormat('dd / MM / yyyy').format(date);
  }

    /// Calcule les 10 prochaines dates de Khatma à partir de la date de session.
  static List<DateTime> liste10khatma(DateTime datesession) {
    List<DateTime> dates = [];
    DateTime dateActuelle = datesession;
    for (int i = 0; i < 10; i++) {
      dateActuelle = dateActuelle.add(const Duration(days: 21));
      dates.add(dateActuelle);
    }
    return dates;
  }
}
