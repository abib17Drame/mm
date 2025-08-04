// lib/auxiliaires/donnees_statiques.dart

/// Classe utilitaire pour fournir des données statiques de l'application,
/// comme le texte des duas, les informations, et les listes d'images du Coran.
class DonneesStatiques {

  /// Retourne la liste des chemins d'images pour un ID de Coran donné.
  /// C'est une reconstruction de la méthode `getQuran` du code Java.
  /// NOTE : Le code original contient une logique de mapping complexe pour 61 sections.
  /// Pour cet exemple, seule la section 1 est mappée pour la démonstration.
  /// Une implémentation complète nécessiterait de traduire l'intégralité du switch-case.
  static List<String> getImagesPourCoran(int idCoran) {
    // Le nombre d'images varie pour chaque section.
    const Map<int, int> pagesParSection = {
      1: 9, 2: 8, 3: 8, 4: 8, 5: 8, 6: 8, 7: 8, 8: 8, 9: 8,
      10: 8, 11: 8, 12: 8, 13: 8, 14: 8, 15: 8, 16: 8, 17: 8, 18: 8,
      19: 8, 20: 8, 21: 8, 22: 8, 23: 8, 24: 8, 25: 8, 26: 8, 27: 8,
      28: 8, 29: 8, 30: 8, 31: 8, 32: 8, 33: 8, 34: 8, 35: 8, 36: 8,
      37: 8, 38: 8, 39: 8, 40: 8, 41: 8, 42: 8, 43: 8, 44: 8, 45: 8,
      46: 8, 47: 8, 48: 8, 49: 8, 50: 8, 51: 8, 52: 8, 53: 8, 54: 8,
      55: 8, 56: 8, 57: 8, 58: 8, 59: 8, 60: 10, 61: 10,
    };

    int? nombreDePages = pagesParSection[idCoran];

    if (nombreDePages != null) {
      // Génère la liste des chemins d'accès aux images.
      // Ex: 'assets/images/quran1_1.jpg', 'assets/images/quran1_2.jpg', ...
      return List.generate(nombreDePages, (index) => 'assets/images/quran${idCoran}_${index + 1}.jpg');
    }

    // Retourne une liste vide si l'ID n'est pas trouvé.
    return [];
  }

  /// Retourne le texte du Duaa de ختم القرآن.
  static String getDuaa() {
    return "دعاء ختم القرآن الكريم\n\nبسم الله الرحمن الرحيم\n\nصدق الله العظيم..."; // Le texte complet est très long
  }

  /// Retourne les informations sur la Khatma.
  static String getInfoKhatma() {
    return "\n* يمكنكم هذا التطبيق من :\n\n-\tقراءة أحزاب القرآن الكريم برواية ورش عن نافع..."; // Texte complet
  }

  /// Retourne la liste des Ahzab.
  static List<String> getListeAhzab() {
    return [
      "الحزب 1 : الم \nمن الفاتحة إلى الآية 75 من البقرة.",
      "الحزب 2 : وَإِذَا لَقُوا\nمن الآية 76 إلى الآية 141 من البقرة",
      // ... et ainsi de suite pour les 60 ahzabs.
    ];
  }
}
