// lib/modeles/khatma.dart

/// Classe modèle pour un enregistrement de la table 'khatma'.
/// Chaque instance représente une journée du cycle de lecture.
class Khatma {
  final int? id;
  final String verser1;
  final String verser2;
  final String verser3;
  final DateTime? date;
  final String jour;

  Khatma({
    this.id,
    required this.verser1,
    required this.verser2,
    required this.verser3,
    this.date,
    required this.jour,
  });

  /// Convertit un objet Khatma en Map.
  /// Utile pour l'insertion dans la base de données.
  Map<String, dynamic> toMap() {
    // La date est stockée comme une chaîne de caractères représentant les millisecondes depuis l'époque.
    // Si la date est nulle, on stocke "0".
    return {
      'id': id,
      'verser1': verser1,
      'verser2': verser2,
      'verser3': verser3,
      'date': date != null ? date!.millisecondsSinceEpoch.toString() : "0",
      'jour': jour,
    };
  }

  /// Crée un objet Khatma à partir d'une Map.
  /// Utile pour la lecture depuis la base de données.
  factory Khatma.fromMap(Map<String, dynamic> map) {
    return Khatma(
      id: map['id'],
      verser1: map['verser1'],
      verser2: map['verser2'],
      verser3: map['verser3'],
      // La date est lue depuis la chaîne de caractères stockée.
      // Si la chaîne est "0", la date est nulle.
      date: map['date'] != "0" ? DateTime.fromMillisecondsSinceEpoch(int.parse(map['date'])) : null,
      jour: map['jour'],
    );
  }
}
