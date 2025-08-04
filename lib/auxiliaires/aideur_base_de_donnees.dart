import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../modeles/khatma.dart';

/// Classe d'aide pour la gestion de la base de données SQLite.
/// Utilise le modèle Singleton pour garantir une seule instance de la base de données.
class AideurBaseDeDonnees {
  // Constantes pour la base de données et la table.
  static const _nomBaseDeDonnees = "khatma_base.db";
  static const _versionBaseDeDonnees = 1;
  static const tableKhatma = 'khatma';

  // Colonnes de la table.
  static const colonneId = 'id';
  static const colonneVerser1 = 'verser1';
  static const colonneVerser2 = 'verser2';
  static const colonneVerser3 = 'verser3';
  static const colonneDate = 'date';
  static const colonneJour = 'jour';

  // Instance unique (Singleton).
  AideurBaseDeDonnees._privateConstructor();
  static final AideurBaseDeDonnees instance = AideurBaseDeDonnees._privateConstructor();

  // Référence unique à la base de données.
  static Database? _database;

  /// Obtient la base de données. Si elle n'existe pas, elle est initialisée.
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  /// Initialise la base de données : chemin, création et peuplement.
  _initDatabase() async {
    String path = join(await getDatabasesPath(), _nomBaseDeDonnees);
    return await openDatabase(path,
        version: _versionBaseDeDonnees,
        onCreate: _onCreate);
  }

  /// Crée la table lors de la première création de la base de données.
  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $tableKhatma (
            $colonneId INTEGER PRIMARY KEY AUTOINCREMENT,
            $colonneVerser1 TEXT NOT NULL,
            $colonneVerser2 TEXT NOT NULL,
            $colonneVerser3 TEXT NOT NULL,
            $colonneDate TEXT,
            $colonneJour TEXT NOT NULL
          )
          ''');
    // Une fois la table créée, on la peuple avec les données initiales.
    await _peuplerDonneesInitiales(db);
  }

  /// Peuple la base de données avec la liste prédéfinie de lectures.
  Future<void> _peuplerDonneesInitiales(Database db) async {
    List<Khatma> listeInitiales = _getDonneesInitiales();
    for (var khatma in listeInitiales) {
      await db.insert(tableKhatma, khatma.toMap());
    }
  }

  /// Récupère une ligne par son ID.
  Future<Khatma?> getLigneById(int id) async {
    Database db = await instance.database;
    List<Map<String, dynamic>> maps = await db.query(tableKhatma,
        columns: [colonneId, colonneVerser1, colonneVerser2, colonneVerser3, colonneDate, colonneJour],
        where: '$colonneId = ?',
        whereArgs: [id]);
    if (maps.isNotEmpty) {
      return Khatma.fromMap(maps.first);
    }
    return null;
  }

    /// Met à jour la date de session pour la première ligne (ID 1).
  Future<int> updateSession(DateTime session) async {
    Database db = await instance.database;
    return await db.update(tableKhatma, {'date': session.millisecondsSinceEpoch.toString()}, where: '$colonneId = ?', whereArgs: [1]);
  }

  /// Récupère la dernière date de session (depuis la ligne avec ID 1).
  Future<DateTime?> getDernierSession() async {
    Database db = await instance.database;
    List<Map<String, dynamic>> maps = await db.query(tableKhatma,
        columns: [colonneDate],
        where: '$colonneId = ?',
        whereArgs: [1]);
    if (maps.isNotEmpty && maps.first[colonneDate] != "0") {
      return DateTime.fromMillisecondsSinceEpoch(int.parse(maps.first[colonneDate]));
    }
    return null;
  }

    /// Compte le nombre de lignes dans la table.
  Future<int> nombreLigne() async {
    Database db = await instance.database;
    return Sqflite.firstIntValue(await db.rawQuery('SELECT COUNT(*) FROM $tableKhatma')) ?? 0;
  }


  /// Retourne la liste statique des lectures du cycle de 21 jours.
  /// C'est une traduction directe de la méthode `listeVers()` du code Java.
  List<Khatma> _getDonneesInitiales() {
    return [
      Khatma(jour: "الأربعاء", verser1: "الحزب 59 : عَمَّ \nمن النبأ إلى الطارق", verser2: "الحزب 60 : سَبِّحِ \n من الأعلى إلى الناس", verser3: "الحزب 1 : الم \nمن الفاتحة إلى الآية 75 من البقرة."),
      Khatma(jour: "الخميس", verser1: "الحزب 2 : وَإِذَا لَقُوا\nمن الآية 76 إلى الآية 141 من البقرة", verser2: "الحزب 3 : سَيَقُولُ السُّفَهَاء\n من الآية 142 إلى الآية 202 من البقرة", verser3: "الحزب 4 : وَاذْكُرُواْ اللّه\nمن الآية 203 إلى الآية 252 من البقرة"),
      Khatma(jour: "الجمعة", verser1: "سورة الكهف", verser2: "الحزب 5 : تِلْكَ الرُّسُل\n من الآية 253من البقرة إلى الآية 14 من آل عمران", verser3: "الحزب 6 : قُلْ أَؤُنَبِّئُكُم \nمن الآية 15 إلى الآية 90 من آل عمران"),
      Khatma(jour: "السبت", verser1: "الحزب 7 : لَن تَنَالُواْ الْبِرَّ حَتَّى تُنفِقُواْ مِمَّا تُحِبُّون\nمن الآية 91 إلى الآية 170 من آل عمران", verser2: "الحزب 8 : يَسْتَبْشِرُون\n من الآية 171 من آل عمران إلى الآية 23 من النساء", verser3: "الحزب 9 : وَالْمُحْصَنَات\n من الآية 24 إلى الآية 85 من النساء"),
      Khatma(jour: "الأحد", verser1: "الحزب 10 : اللّهُ لا إِلَـهَ إِلاَّ هُو\n من الآية 86 إلى الآية 146 من النساء", verser2: "الحزب 11 : لاَّ يُحِبُّ اللّهُ الْجَهْرَ بِالسُّوَءِ مِنَ الْقَوْل\n من الآية 147 من النساء إلى الآية 24 من المائدة", verser3: "الحزب 12 : قَالَ رَجُلاَن\n من الآية 25 إلى الآية 81 من المائدة"),
      Khatma(jour: "الاثنين", verser1: "الحزب 13 : لَتَجِدَن\nمن الآية 82 من المائدة إلى الآية 35 الأنعام", verser2: "الحزب 14 : إِنَّمَا يَسْتَجِيب \nمن الآية 36 إلى الآية 110 من الأنعام", verser3: "الحزب 15 : وَلَوْ أَنَّنَا\nمن الآية 111 من الأنعام إلى الآية 3 من الأعراف"),
      Khatma(jour: "الثلاثاء", verser1: "الحزب 16 : فَمَا كَانَ دَعْوَاهُم\nمن الآية 4 إلى الآية 87 من الأعراف", verser2: "الحزب 17 : قَالَ الْمَلأُ\nمن الآية 88 إلى الآية 170 من الأعراف", verser3: "الحزب 18 : وَإِذ نَتَقْنَا الْجَبَل\nمن الآية 171 من الأعراف إلى الآية 40 من الأنفال\nالسجدة، الآية 206 من الأعراف"),
      Khatma(jour: "الأربعاء", verser1: "الحزب 19 : وَاعْلَمُواْ\n من الآية 41 من الأنفال إلى الآية 33 من التوبة", verser2: "الحزب 20 : يَا أَيُّهَا الَّذِينَ آمَنُواْ إِنَّ كَثِيرا\nمن الآية 34 إلى الآية 92 من التوبة", verser3: "الحزب 21 : إِنَّمَا السَّبِيل\nمن الآية 93 من التوبة إلى الآية 25 من يونس"),
      Khatma(jour: "الخميس", verser1: "الحزب 22 : لِّلَّذِينَ أَحْسَنُواْ الحسنى\nمن الآية 26 من يونس إلى الآية 5 من هود", verser2: "الحزب 23 : وَمَا مِن دَآبَّة\nمن الآية 6 إلى الآية 83 من هود", verser3: "الحزب 24 : وَإِلَى مَدْيَن\nمن الآية 84 من هود إلى الآية 52 من يوسف"),
      Khatma(jour: "الجمعة", verser1: "سورة الكهف", verser2: "الحزب 25 : وَمَا أُبَرِّىءُ\nمن الآية 53 من يوسف إلى الآية 18 من الرعد\nالسجدة، الآية 16 من الرعد", verser3: "الحزب 26 : أَفَمَن يَعْلَمُ\nمن الآية 19 من الرعد إلى آخر إبراهيم"),
      Khatma(jour: "السبت", verser1: "الحزب 27 : رُّبَمَا\nمن الآية 2 من الحجر إلى الآية 50 من النحل\nالسجدة، الآية 50 من النحل", verser2: "الحزب 28 : وَقَالَ اللّهُ\nمن الآية 51 إلى آخر النحل", verser3: "الحزب 29 : سُبْحَانَ\nمن الآية 1 إلى 98 من الإسراء"),
      Khatma(jour: "الأحد", verser1: "الحزب 30 : أَوَلَمْ يَرَوْاْ\nمن 99 من الإسراء إلى الآية 74 من الكهف\nالسجدة، الآية 108 من الإسراء", verser2: "الحزب 31 : قَالَ أَلَمْ أَقُلْ لك\nمن الآية 75 من الكهف إلى الآية 8 من طه\nالسجدة، الآية 58 من مريم", verser3: "الحزب 32 : طه\nسورة طه"),
      Khatma(jour: "الاثنين", verser1: "الحزب 33 : اقْتَرَبَ لِلنَّاسِ حسابهم\nسورة الأنبياء", verser2: "الحزب 34 : يَا أَيُّهَا النَّاس\nسورة الحج\nالسجدة، الآية 18", verser3: "الحزب 35 : قَدْ أَفْلَح المؤمنون\nمن الآية 1 من المؤمنون إلى الآية 20 من النور"),
      Khatma(jour: "الثلاثاء", verser1: "الحزب 36 : يَا أَيُّهَا الَّذِينَ آمَنُوا لَا تَتَّبِعُوا خُطُوَاتِ الشَّيْطَان\nمن الآية 21 من النور إلى الآية 20 من الفرقان", verser2: "الحزب 37 : وَقَالَ الَّذِينَ لَا يَرْجُونَ\nمن الآية 21 الفرقان إلى الآية 110 من الشعراء\nالسجدة، الآية 60 من سورة الفرقان", verser3: "الحزب 38 : قَالُوا أَنُؤْمِنُ\nمن الآية 111 من الشعراء إلى الآية 55 من النمل\nالسجدة، الآية 26 من سورة النمل"),
      Khatma(jour: "الاربعا", verser1: "الحزب 39 : فَمَا كَانَ جَوَابَ\nمن الآية 56 من النمل إلى الآية 50 من القصص", verser2: "الحزب 40 : وَلَقَدْ وَصَّلْنَا\nمن الآية 51 من القصص إلى الآية 45 من العنكبوت", verser3: "الحزب 41 : وَلَا تُجَادِلُوا\nمن الآية 46 من العنكبوت إلى الآية 21 من لقمان"),
      Khatma(jour: "الخميس", verser1: "الحزب 42 : وَمَن يُسْلِمْ\nمن الآية 22 من لقمان إلى الآية 30 من الأحزاب\nالسجدة، الآية 15 من سورة السجدة", verser2: "الحزب 43 : وَمَن يَقْنُتْ\nمن الآية 31 من الأحزاب إلى الآية 23 من سبا", verser3: "الحزب 44 : قُلْ مَن يَرْزُقُكُم\nمن الآية 24 من سبا إلى الآية 27 من يس"),
      Khatma(jour: "الجمعة", verser1: "سورة الكهف", verser2: "الحزب 45 : وَمَا أَنزَلْنَا\nمن الآية 28 من يس إلى الآية 145 من الصافات", verser3: "الحزب 46 : * فَنَبَذْنَاه\nمن الآية 146 من الصافات إلى الآية 31 من الزمر\nالسجدة، الآية 23 من سورة ص"),
      Khatma(jour: "السبت", verser1: "الحزب 47 : فَمَنْ أَظْلَم\nمن الآية 32 من الزمر إلى الآية 40 من غافر", verser2: "الحزب 48 : وَيَا قَوْمِ\nمن الآية 41 من غافر إلى الآية 46 من فصلت\nالسجدة، الآية 37 من فصلت", verser3: "الحزب 49 : إلَيْهِ\nمن الآية 47 من فصلت إلى الآية 23 من الزخرف"),
      Khatma(jour: "الأحد", verser1: "الحزب 50 : قَالَ أَوَلَوْ \nمن الآية 24 من الزخرف إلى آخر الجاثية", verser2: "الحزب 51 : حم\nمن الآية 1 من الأحقاف إلى الآية 17 الفتح", verser3: "الحزب 52 : لَقَدْ رَضِيَ اللَّهُ\nمن الآية 18 من الفتح إلى الآية 30 من الذاريات"),
      Khatma(jour: "الاثنين", verser1: "الحزب 53 : قَالَ فَمَا خَطْبُكُمْ\nمن الآية 31 من الذاريات إلى آخر القمر", verser2: "الحزب 54 : الرَّحْمَنُ\nمن الرحمن إلى الحديد", verser3: "الحزب 55 : قَدْ سَمِعَ الله\nمن المجادلة إلى الصف"),
      Khatma(jour: "الثلاثاء", verser1: "الحزب 56 : يُسَبِّحُ \nمن الجمعة إلى التحريم", verser2: "الحزب 57 : تبَارَكَ\nمن الملك إلى نوح", verser3: "الحزب 58 : قُلْ أُوحِيَ\nمن الجن إلى المرسلات"),
    ];
  }
}
