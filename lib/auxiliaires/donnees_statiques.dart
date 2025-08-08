// lib/auxiliaires/donnees_statiques.dart

import 'package:intl/intl.dart';

/// Classe utilitaire pour fournir des données statiques de l'application,
/// comme le texte des duas, les informations, et les listes d'images du Coran.
class DonneesStatiques {

  /// Retourne la liste des chemins d'images pour un ID de Coran donné.
  static List<String> getImagesPourCoran(int idCoran) {
    // Cas spécial pour la Sourate Al-Kahf (ID 100)
    if (idCoran == 100) {
      // Al-Kahf utilise les images quran61_x.jpg (10 pages)
      return List.generate(10, (index) => 'assets/images/quran61_${index + 1}.jpg');
    }
    
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
      // Génère la liste des images pour la section demandée
      return List.generate(nombreDePages, (index) => 'assets/images/quran${idCoran}_${index + 1}.jpg');
    }
    return [];
  }

  /// Formate une date en français et en arabe
  static Map<String, String> formaterDateBilingue(DateTime date) {
    // Format français
    final formatFrancais = DateFormat('EEEE d MMMM yyyy', 'fr_FR');
    final dateFrancais = formatFrancais.format(date);
    
    // Format arabe avec les noms des mois en arabe
    final Map<String, String> moisArabes = {
      'January': 'يناير',
      'February': 'فبراير',
      'March': 'مارس',
      'April': 'أبريل',
      'May': 'مايو',
      'June': 'يونيو',
      'July': 'يوليو',
      'August': 'أغسطس',
      'September': 'سبتمبر',
      'October': 'أكتوبر',
      'November': 'نوفمبر',
      'December': 'ديسمبر',
    };
    
    final Map<String, String> joursArabes = {
      'Monday': 'الاثنين',
      'Tuesday': 'الثلاثاء',
      'Wednesday': 'الأربعاء',
      'Thursday': 'الخميس',
      'Friday': 'الجمعة',
      'Saturday': 'السبت',
      'Sunday': 'الأحد',
    };
    
    // Format anglais pour récupérer les noms
    final formatAnglais = DateFormat('EEEE MMMM d yyyy', 'en_US');
    final dateAnglaise = formatAnglais.format(date);
    
    // Extraire les parties de la date
    final parts = dateAnglaise.split(' ');
    final jourSemaine = parts[0];
    final mois = parts[1];
    final jour = parts[2];
    final annee = parts[3];
    
    // Traduire en arabe
    final jourSemaineArabe = joursArabes[jourSemaine] ?? jourSemaine;
    final moisArabe = moisArabes[mois] ?? mois;
    
    // Formater la date en arabe
    final dateArabe = '$jourSemaineArabe $jour $moisArabe $annee';
    
    return {
      'francais': dateFrancais,
      'arabe': dateArabe,
    };
  }

  /// Retourne le texte du Duaa de ختم القرآن.
  static String getDuaa() {
    return "دعاء ختم القرآن الكريم\n\nبسم الله الرحمن الرحيم\n\nصدق الله العظيم وبلغ مولانا رسوله المصطفى النبي الكريم عليه أفضل الصلاة وأزكى التسليم وهو أصدق القائلين والمصدقين ،ونحن على ذلك من الشاهدين وبه مؤمنون ولا حول ولا قوة إلا بالله العلي العظيم ،\n\nورضي الله عن ساداتنا :أبي بكر وعمر وعثمان وعلي وطلحة والزبير وعبد الرحمن بن عوف وسعد وسعيد وعن أبي عبيدة ابن الجراح وحمزة والعباس وعن الحسن والحسين وعن جعفر وعقيل وفاطمة وخديجة وعائشة ورضي الله عن سائر أمهات المؤمنين وعن أصحاب رسول الله صلى الله عليه وسلم أجمعين وعن التابعين وتابعي التابعين لهم بإحسان إلى يوم الدين .\n\nاللهم اجعلنا يا مولانا من المحبين التابعين ،\n\nاللهم ارحمنا بالقرآن العظيم وبما فيه من الآيات والذكر الحكيم ،\n\nاللهم علمنا منه ما جهلنا وذكرنا منه ما نسينا وارزقنا تلاوته وحلاوته آناء الليل وأطراف النهار ابتغاء مرضاتك ياذا الجلال والإكرام.\n\nاللهم اجعله لنا إماما ونورا وهدى ورحمة.\n\nاللهم اجعل القرآن العظيم ربيع قلوبنا ، ونور به قلوبنا وقبورنا ،واشرح به صدورنا ويسر يه أمورنا ووفقنا به لما فيه رضاك عنا .\n\nاللهم اجعل القرآن العظيم شافعا مشفعا فينا ولا تجعله ماحلا مصدقا فينا ،\n\nاللهم اجعل القرآن العظيم أمامنا قائدنا إلى الجنة ولا تجعله خلفنا سائقنا إلى النار ،\n\nاللهم ارحمنا بالقرأن العظيم وارحم به والدينا وارحم به أشياخنا وارحم به أزواجنا وارحم به ذرياتنا وارحم به معاهدنا وارحم بها أصهارنا وأنصارنا وارحم بفضلك من علمنا وارحم به جميع المسلمين والمسلمات والمؤمنين والمؤمنات الأحياء منهم والأموات.\n\nاللهم اقسم لنا من خشيتك ما تحول به  بيننا وبين معاصيك ومن طاعتك ما تبلغنا به جنتك ومن اليقين ما تهون به علينا مصائب الدنيا ومتعنا بأبصارنا وأسماعنا وقوتنا ما أحييتنا، واجعله الوارث منا واجعل ثأرنا على من ظلمنا وانصرنا على من عادانا ولا تجعل مصيبتنا في ديننا ولا تجعل الدنيا أكبر همنا ولا مبلغ علمنا ولا غاية رغبتنا ولا تسلط علينا بذنوبنا من لا يرحمنا\n\nاللهم إنا نسألك من الخير كله عاجله وآجله ما علمنا منه وما لم نعلم ونعوذ بك من الشر كله عاجله وآجله ما علمنا منه وما لم نعلم ونسألك الجنة وما قرب إليها من قول وعمل، ونعوذ بك من النار وما قرب إليها من قول وعمل، ونسألك من كل خير سألك منه محمد نبيك وعبدك ورسولك صلى الله عليه وسلم ونعوذ بك من كل شر استعاذك منه محمد نبيك وعبدك ورسولك صلى الله عليه وسلم،\n\nاللهم ما قضيت به علينا من قضاء فاجعل عاقبته رشدا.\n\nياربنا ياخالق العوالم\nحل بيننا وبين كل ظالم\n\nياربنا أنت ترى ما قد جرى\nفاقصم بقهر من علينا جسرا\n\nياربنا عجل لنا بالفرج\nونجنا من ضيقة وحرج\n\nوامدد علينا من حماك الأمنع\nسرادقا من حل فيه يمنع\n\nاللهم احرسنا بعينك التي لا تنام ،واكنفنا في كنفك الذي لا يرام ،واجعلنا في جوارك الذي لا يخفر ولا يضام ،\n\nاللهم إنا ندرأ بك في نحور الأعداء ونعوذ بك من شرورهم،\n\nاللهم إنك أعلم بأعدائنا وكفى بك وليا وكفى بك نصيرا ، اللهم اكفناهم بما شئت .\n\nاللهم أصلح أمة سيدنا محمد صلى الله عليه وسلم .\n\nاللهم ارحم أمة سيدنا محمد صلى الله عليه وسلم.\n\n اللهم فرج عن أمة سيدنا محمد صلى الله عليه وسلم.\n\nاللهم لا تجعل لنا في وقتنا هذا ذنبا إلا غفرته ولا هما إلا فرجته ولا مريضا إلا شفيته  ولا عدوا إلا كفيته ولا دينا إلا قضيته ولامسافرا إلا حفظته وبلغته ولا قلبا إلا أصلحته ولا جائعا إلا أطعمته ولا عريانا إلا كسوته ولا بلاء إلا رددته وصرفته ولا ولا حاجة من حوائج الدنيا والآخرة لك فيه رضى ولنا فيها صلاح إلا أديتها وقضيتها برحمتك يا أرحم الراحمين.\n\nاللهم اغفر لحينا وميتنا وكبيرنا وصغيرنا وحاضرنا وغائبنا  وذكرنا وأنثانا وحرنا وعبدنا وطائعنا وعاصينا.\n\nاللهم اغفر لنا أجمعين وتوفنا مسلمين واحشرنا في زمرة النبيين والصديقين والشهداء والصالحين واكفنا ما أهمنا وما لم يهمنا من أمور الدين والدنيا والآخرة، وكف عنا أيدي المعتدين و لا تجعلنا فتنة للظالمين، ونجنا برحمتك من القوم الكافرين واجعلنا من عبادك المخلصين.\n\nواغفر لكل من إلينا أحسنا\nوجازه عنا الجزاء الأحسنا.\n\nواغفر لكل مسلم ومسلمه\nواحمل عن الجميع كل مظلمه\n\nواحفظ جيوش المسلمين وانصر\nولاتهم على ممر الأعصر.\n\nاللهم لا تجعل فينا ولا منا شقيا ولا محروما.\n\nاللهم استرنا بسترك الجميل وعاملنا بلطفك الجزيل وكن لنا صاحبا في المقام والرحيل.\n\n اللهم إنا نسألك الصدق في العبودية والقيام بحقوق الربوبية .\n\nاللهم إنا نسألك بفاتحية الفاتح الفتح التام وبخاتمية الخاتم حسن الختام،\n\n اللهم إنك أمرتنا بدعائك ووعدتنا بإجابتك وقد دعوناك كما أمرتنا فأجبنا كما وعدتنا يا ذا الجلال والإكرام، إنك لا تخلف الميعاد\n\n اللهم هذا الدعاء ومنك الإجابة وهذا الجهد منا وعليك التكلان، ولاحول ولا قوة إلا بالله العلي العظيم وصلى الله على سيدنا محمد وعلى آله وصحبه وسلم تسليما.\n\nسبحان ربك رب العزة عما يصفون وسلام على المرسلين والحمد لله رب العالمين.";
  }

  /// Retourne les informations sur la Khatma.
  static String getInfoKhatma() {
    return """
* يمكنكم هذا التطبيق من :

📖 قراءة أحزاب القرآن الكريم برواية ورش عن نافع (كل حزب مقسم إلى أثمان، وكل ثمن في صفحة) وهو ما يساعد على الحفظ، من خلال التطبيق يمكن الضغط على أي حزب لقراءته (المصحف المعتمد في التطبيق بعد سورة الفاتحة هو "مصحف الشاذلي المثمن" المشهور في الجزائر).

📅 معرفة الأحزاب التي تقرأ كل يوم حسب تاريخه، طبقا لبرنامج "ختمة الإدارة"، وهو ما يعين على مرافقة المواظبين على هذه الختمة وختم القرآن معهم كل ثلاثة أسابيع (من خلال الضغط على تواريخ الختمات القادمة في التطبيق، يمكن معرفة تواريخ ليالي الختمة).

🕌 معرفة الأحزاب التي فيها مواضع سجود التلاوة ومعرفة أرقام الآيات للانتباه لها عند القراءة.

📿 قراءة دعاء ختم القرآن الكريم مع إمكانية التكبير والتصغير والمشاركة.

🌙 تغيير المظهر بين الوضع الفاتح والوضع المظلم حسب تفضيلات المستخدم.

🌍 تغيير اللغة بين العربية والفرنسية والإنجليزية.

📱 استخدام التطبيق على الهواتف الذكية والأجهزة اللوحية وأجهزة الكمبيوتر.

🔄 التنقل بين الأيام بسهولة مع عرض التاريخ الحالي ويوم الختمة.

📊 عرض قائمة كاملة للأحزاب الستين مع تفاصيل كل حزب.

🎯 تحديد مواضع السجود في كل حزب للانتباه عند القراءة.

📤 مشاركة صفحات القرآن والدعاء مع الآخرين.

💾 حفظ البيانات محلياً مع إمكانية العمل بدون إنترنت.

* ختمة الإدارة

"ختمة الإدارة"، من الدوران، لأنه يختم كل ثلاثة أسابيع (من ليلة الخميس إلى ليلة الخميس) ... ، وهي من عمل أهل شنقيط وتتوارثها الأجيال في بعض المناطق الموريتانية ، حيث يواظب عليها في المساجد وفي البيوت.

- تبدأ هذه الختمة ليلة الخميس ويختم القرآن ليلة الخميس الرابعة بعد البداية.

- ثلاثة أحزاب في اليوم، حزب في الصباح وحزبين في المساء، إلا يوم الجمعة تقرأ سورة الكهف بدل الحزب الصباحي.

* المميزات التقنية :

⚡ تطبيق سريع ومستجيب مع واجهة مستخدم حديثة
🎨 تصميم جميل مع ألوان هادئة ومناسبة للقراءة
📱 متوافق مع جميع الأجهزة (Android, iOS, Windows, macOS, Linux)
🔧 تحديثات مستمرة وتحسينات للأداء
💡 واجهة سهلة الاستخدام مع تنقل بديهي
""";
  }

  /// Retourne les informations sur la Khatma en français.
  static String getInfoKhatmaFrancais() {
    return """
* Ce que vous permet cette application :

📖 Lire les hizb du Coran selon la récitation Warsh de Nafi' (chaque hizb divisé en huitièmes, chaque huitième sur une page) ce qui aide à la mémorisation. Vous pouvez cliquer sur n'importe quel hizb pour le lire (le mushaf utilisé dans l'application après la sourate Al-Fatiha est le "Mushaf Chadhli Muthamman" célèbre en Algérie).

📅 Connaître les hizb à lire chaque jour selon la date, selon le programme "Khatma de l'Administration", ce qui aide à accompagner ceux qui suivent régulièrement cette khatma et terminer le Coran avec eux toutes les trois semaines (en cliquant sur les dates des prochaines khatmas dans l'application, vous pouvez connaître les dates des nuits de khatma).

🕌 Connaître les hizb qui contiennent des positions de prosternation de récitation et connaître les numéros des versets pour y prêter attention lors de la lecture.

📿 Lire le dua'a de Khatm Al-Quran avec possibilité de zoom, réduction et partage.

🌙 Changer l'apparence entre le mode clair et le mode sombre selon les préférences de l'utilisateur.

🌍 Changer la langue entre l'arabe, le français et l'anglais.

📱 Utiliser l'application sur smartphones, tablettes et ordinateurs.

🔄 Naviguer facilement entre les jours avec affichage de la date actuelle et du jour de khatma.

📊 Afficher une liste complète des soixante hizb avec détails de chaque hizb.

🎯 Identifier les positions de prosternation dans chaque hizb pour y prêter attention lors de la lecture.

📤 Partager les pages du Coran et du dua'a avec d'autres.

💾 Sauvegarder les données localement avec possibilité de travailler hors ligne.

* Khatma de l'Administration

"Khatma de l'Administration", de la rotation, car elle termine tous les trois semaines (du jeudi soir au jeudi soir)... Elle est l'œuvre des gens de Chinguetti et se transmet de génération en génération dans certaines régions mauritaniennes, où elle est pratiquée régulièrement dans les mosquées et les maisons.

- Cette khatma commence le jeudi soir et termine le Coran le quatrième jeudi soir après le début.

- Trois hizb par jour, un hizb le matin et deux hizb le soir, sauf le vendredi où on lit la sourate Al-Kahf au lieu du hizb du matin.

* Caractéristiques techniques :

⚡ Application rapide et réactive avec interface utilisateur moderne
🎨 Design beau avec des couleurs douces et appropriées pour la lecture
📱 Compatible avec tous les appareils (Android, iOS, Windows, macOS, Linux)
🔧 Mises à jour continues et améliorations de performance
💡 Interface facile à utiliser avec navigation intuitive
""";
  }

  /// Retourne les informations sur la Khatma en anglais.
  static String getInfoKhatmaAnglais() {
    return """
* What this application allows you to do :

📖 Read the hizb of the Quran according to Warsh recitation from Nafi' (each hizb divided into eighths, each eighth on a page) which helps with memorization. You can click on any hizb to read it (the mushaf used in the application after Surah Al-Fatiha is the famous "Mushaf Chadhli Muthamman" in Algeria).

📅 Know the hizb to read each day according to the date, according to the "Administration Khatma" program, which helps to accompany those who regularly follow this khatma and complete the Quran with them every three weeks (by clicking on the dates of upcoming khatmas in the application, you can know the dates of khatma nights).

🕌 Know the hizb that contain recitation prostration positions and know the verse numbers to pay attention to during reading.

📿 Read the dua'a of Khatm Al-Quran with zoom, reduction and sharing capabilities.

🌙 Change appearance between light and dark mode according to user preferences.

🌍 Change language between Arabic, French and English.

📱 Use the application on smartphones, tablets and computers.

🔄 Navigate easily between days with display of current date and khatma day.

📊 Display a complete list of the sixty hizb with details of each hizb.

🎯 Identify prostration positions in each hizb to pay attention to during reading.

📤 Share Quran pages and dua'a with others.

💾 Save data locally with ability to work offline.

* Administration Khatma

"Administration Khatma", from rotation, because it completes every three weeks (from Thursday evening to Thursday evening)... It is the work of the people of Chinguetti and is passed down from generation to generation in some Mauritanian regions, where it is regularly practiced in mosques and homes.

- This khatma begins on Thursday evening and completes the Quran on the fourth Thursday evening after the beginning.

- Three hizb per day, one hizb in the morning and two hizb in the evening, except Friday where Surah Al-Kahf is read instead of the morning hizb.

* Technical features :

⚡ Fast and responsive application with modern user interface
🎨 Beautiful design with soft colors appropriate for reading
📱 Compatible with all devices (Android, iOS, Windows, macOS, Linux)
🔧 Continuous updates and performance improvements
💡 Easy-to-use interface with intuitive navigation
""";
  }

  /// Retourne les informations sur la Khatma selon la langue.
  static String getInfoKhatmaByLanguage(String languageCode) {
    switch (languageCode) {
      case 'fr':
        return getInfoKhatmaFrancais();
      case 'en':
        return getInfoKhatmaAnglais();
      case 'ar':
      default:
        return getInfoKhatma();
    }
  }

  /// Retourne les informations sur l'application en français.
  static String getInfoApplicationFrancais() {
    return """
📱 **Khatma Flutter**

Une application moderne développée pour faciliter la lecture quotidienne du Coran selon le programme traditionnel "ختمة الإدارة" (Khatma de l'Administration).

🎯 **Fonctionnalités principales :**

📖 **Lecture du Coran**
• Affichage des pages avec zoom et navigation fluide
• Navigation temporelle entre les jours passés et futurs
• Calcul automatique des hizb à lire chaque jour

📋 **Gestion complète**
• Liste complète des 60 hizb avec leurs détails
• Suivi quotidien automatique
• Calcul et affichage des prochaines dates de Khatma

📿 **Dua'a de fin**
• Inclusion du dua'a complet de Khatm Al-Quran
• Export PDF du dua'a

🌍 **Support multilingue**
• Français, arabe et anglais
• Changement dynamique de langue
• Interface adaptée à chaque culture

🎨 **Personnalisation**
• Mode clair et mode sombre
• Thèmes adaptatifs
• Interface moderne et intuitive

📱 **Compatibilité**
• Android (téléphones et tablettes)
• iOS (iPhone et iPad)
• Windows, macOS, Linux (ordinateurs)

💾 **Fonctionnalités techniques**
• Base de données locale SQLite
• Mode hors ligne complet
• Partage d'images et de documents
• Sauvegarde automatique des préférences

⚡ **Performance**
• Chargement rapide des images
• Navigation fluide
• Optimisation mémoire
• Interface réactive

🔧 **Développement**
• Framework Flutter moderne
• Architecture modulaire
• Code maintenable et extensible
• Tests et documentation

📞 **Support**
• Interface intuitive
• Gestion d'erreurs gracieuse
• Messages d'aide contextuels
• Mises à jour régulières
""";
  }

  /// Retourne les informations sur l'application en anglais.
  static String getInfoApplicationAnglais() {
    return """
📱 **Khatma Flutter**

A modern application developed to facilitate daily Quran reading according to the traditional "ختمة الإدارة" (Administration Khatma) program.

🎯 **Main features :**

📖 **Quran Reading**
• Display pages with zoom and smooth navigation
• Temporal navigation between past and future days
• Automatically calculate hizb to read each day

📋 **Complete management**
• Complete list of all 60 hizb with their details
• Automatic daily tracking
• Calculate and display upcoming Khatma dates

📿 **Completion dua'a**
• Include the complete Khatm Al-Quran dua'a
• PDF export of dua'a

🌍 **Multilingual support**
• French, Arabic and English
• Dynamic language switching
• Interface adapted to each culture

🎨 **Personalization**
• Light and dark mode
• Adaptive themes
• Modern and intuitive interface

📱 **Compatibility**
• Android (phones and tablets)
• iOS (iPhone and iPad)
• Windows, macOS, Linux (computers)

💾 **Technical features**
• Local SQLite database
• Complete offline mode
• Image and document sharing
• Automatic preference backup

⚡ **Performance**
• Fast image loading
• Smooth navigation
• Memory optimization
• Responsive interface

🔧 **Development**
• Modern Flutter framework
• Modular architecture
• Maintainable and extensible code
• Tests and documentation

📞 **Support**
• Intuitive interface
• Graceful error handling
• Contextual help messages
• Regular updates
""";
  }

  /// Retourne les informations sur l'application en arabe.
  static String getInfoApplicationArabe() {
    return """
📱 **ختمة فلاتر**

تطبيق حديث تم تطويره لتسهيل القراءة اليومية للقرآن الكريم حسب البرنامج التقليدي "ختمة الإدارة".

🎯 **الميزات الرئيسية :**

📖 **قراءة القرآن**
• عرض صفحات القرآن مع التكبير والتنقل السلس
• التنقل الزمني بين الأيام الماضية والمستقبلية
• حساب الأحزاب التي يجب قراءتها كل يوم تلقائياً

📋 **الإدارة الشاملة**
• عرض جميع الأحزاب الستين مع تفاصيلها
• المتابعة اليومية التلقائية
• حساب وعرض التواريخ القادمة للختمات

📿 **دعاء الختم**
• تضمين دعاء ختم القرآن الكريم الكامل
• تصدير PDF للدعاء

🌍 **الدعم متعدد اللغات**
• الفرنسية والعربية والإنجليزية
• تغيير اللغة ديناميكياً
• واجهة متكيفة مع كل ثقافة

🎨 **التخصيص**
• الوضع الفاتح والوضع المظلم
• السمات المتكيفة
• واجهة حديثة وبديهية

📱 **التوافق**
• أندرويد (الهواتف والأجهزة اللوحية)
• آي أو إس (آيفون وآيباد)
• ويندوز، ماك أو إس، لينكس (أجهزة الكمبيوتر)

💾 **الميزات التقنية**
• قاعدة بيانات محلية SQLite
• وضع عدم الاتصال الكامل
• مشاركة الصور والمستندات
• النسخ الاحتياطي التلقائي للتفضيلات

⚡ **الأداء**
• تحميل سريع للصور
• تنقل سلس
• تحسين الذاكرة
• واجهة مستجيبة

🔧 **التطوير**
• إطار عمل فلاتر الحديث
• هندسة معيارية
• كود قابل للصيانة والتوسيع
• الاختبارات والتوثيق

📞 **الدعم**
• واجهة بديهية
• معالجة الأخطاء بأمان
• رسائل المساعدة السياقية
• التحديثات المنتظمة
""";
  }

  /// Retourne les informations sur l'application selon la langue.
  static String getInfoApplicationByLanguage(String languageCode) {
    switch (languageCode) {
      case 'fr':
        return getInfoApplicationFrancais();
      case 'en':
        return getInfoApplicationAnglais();
      case 'ar':
      default:
        return getInfoApplicationArabe();
    }
  }

  /// Retourne la liste des Ahzab.
  static List<String> getListeAhzab() {
    return [
      "الحزب 1 : الم \nمن الفاتحة إلى الآية 75 من البقرة.",
      "الحزب 2 : وَإِذَا لَقُوا\nمن الآية 76 إلى الآية 141 من البقرة",
      "الحزب 3 : سَيَقُولُ السُّفَهَاء\n من الآية 142 إلى الآية 202 من البقرة",
      "الحزب 4 : وَاذْكُرُواْ اللّه\nمن الآية 203 إلى الآية 252 من البقرة",
      "الحزب 5 : تِلْكَ الرُّسُل\n من الآية 253من البقرة إلى الآية 14 من آل عمران",
      "الحزب 6 : قُلْ أَؤُنَبِّئُكُم \nمن الآية 15 إلى الآية 90 من آل عمران",
      "الحزب 7 : لَن تَنَالُواْ الْبِرَّ حَتَّى تُنفِقُواْ مِمَّا تُحِبُّون\nمن الآية 91 إلى الآية 170 من آل عمران",
      "الحزب 8 : يَسْتَبْشِرُون\n من الآية 171 من آل عمران إلى الآية 23 من النساء",
      "الحزب 9 : وَالْمُحْصَنَات\n من الآية 24 إلى الآية 85 من النساء",
      "الحزب 10 : اللّهُ لا إِلَـهَ إِلاَّ هُو\n من الآية 86 إلى الآية 146 من النساء",
      "الحزب 11 : لاَّ يُحِبُّ اللّهُ الْجَهْرَ بِالسُّوَءِ مِنَ الْقَوْل\n من الآية 147 من النساء إلى الآية 24 من المائدة",
      "الحزب 12 : قَالَ رَجُلاَن\n من الآية 25 إلى الآية 81 من المائدة",
      "الحزب 13 : لَتَجِدَن\nمن الآية 82 من المائدة إلى الآية 35 الأنعام",
      "الحزب 14 : إِنَّمَا يَسْتَجِيب \nمن الآية 36 إلى الآية 110 من الأنعام",
      "الحزب 15 : وَلَوْ أَنَّنَا\nمن الآية 111 من الأنعام إلى الآية 3 من الأعراف",
      "الحزب 16 : فَمَا كَانَ دَعْوَاهُم\nمن الآية 4 إلى الآية 87 من الأعراف",
      "الحزب 17 : قَالَ الْمَلأُ\nمن الآية 88 إلى الآية 170 من الأعراف",
      "الحزب 18 : وَإِذ نَتَقْنَا الْجَبَل\nمن الآية 171 من الأعراف إلى الآية 40 من الأنفال\nالسجدة، الآية 206 من الأعراف",
      "الحزب 19 : وَاعْلَمُواْ\n من الآية 41 من الأنفال إلى الآية 33 من التوبة",
      "الحزب 20 : يَا أَيُّهَا الَّذِينَ آمَنُواْ إِنَّ كَثِيرا\nمن الآية 34 إلى الآية 92 من التوبة",
      "الحزب 21 : إِنَّمَا السَّبِيل\nمن الآية 93 من التوبة إلى الآية 25 من يونس",
      "الحزب 22 : لِّلَّذِينَ أَحْسَنُواْ الحسنى\nمن الآية 26 من يونس إلى الآية 5 من هود",
      "الحزب 23 : وَمَا مِن دَآبَّة\nمن الآية 6 إلى الآية 83 من هود",
      "الحزب 24 : وَإِلَى مَدْيَن\nمن الآية 84 من هود إلى الآية 52 من يوسف",
      "الحزب 25 : وَمَا أُبَرِّىءُ\nمن الآية 53 من يوسف إلى الآية 18 من الرعد\nالسجدة، الآية 16 من الرعد",
      "الحزب 26 : أَفَمَن يَعْلَمُ\nمن الآية 19 من الرعد إلى آخر إبراهيم",
      "الحزب 27 : رُّبَمَا\nمن الآية 2 من الحجر إلى الآية 50 من النحل\nالسجدة، الآية 50 من النحل",
      "الحزب 28 : وَقَالَ اللّهُ\nمن الآية 51 إلى آخر النحل",
      "الحزب 29 : سُبْحَانَ\nمن الآية 1 إلى 98 من الإسراء",
      "الحزب 30 : أَوَلَمْ يَرَوْاْ\nمن 99 من الإسراء إلى الآية 74 من الكهف\nالسجدة، الآية 108 من الإسراء",
      "الحزب 31 : قَالَ أَلَمْ أَقُلْ لك\nمن الآية 75 من الكهف إلى الآية 8 من طه\nالسجدة، الآية 58 من مريم",
      "الحزب 32 : طه\nسورة طه",
      "الحزب 33 : اقْتَرَبَ لِلنَّاسِ حسابهم\nسورة الأنبياء",
      "الحزب 34 : يَا أَيُّهَا النَّاس\nسورة الحج\nالسجدة، الآية 18",
      "الحزب 35 : قَدْ أَفْلَح المؤمنون\nمن الآية 1 من المؤمنون إلى الآية 20 من النور",
      "الحزب 36 : يَا أَيُّهَا الَّذِينَ آمَنُوا لَا تَتَّبِعُوا خُطُوَاتِ الشَّيْطَان\nمن الآية 21 من النور إلى الآية 20 من الفرقان",
      "الحزب 37 : وَقَالَ الَّذِينَ لَا يَرْجُونَ\nمن الآية 21 الفرقان إلى الآية 110 من الشعراء\nالسجدة، الآية 60 من سورة الفرقان",
      "الحزب 38 : قَالُوا أَنُؤْمِنُ\nمن الآية 111 من الشعراء إلى الآية 55 من النمل\nالسجدة، الآية 26 من سورة النمل",
      "الحزب 39 : فَمَا كَانَ جَوَابَ\nمن الآية 56 من النمل إلى الآية 50 من القصص",
      "الحزب 40 : وَلَقَدْ وَصَّلْنَا\nمن الآية 51 من القصص إلى الآية 45 من العنكبوت",
      "الحزب 41 : وَلَا تُجَادِلُوا\nمن الآية 46 من العنكبوت إلى الآية 21 من لقمان",
      "الحزب 42 : وَمَن يُسْلِمْ\nمن الآية 22 من لقمان إلى الآية 30 من الأحزاب\nالسجدة، الآية 15 من سورة السجدة",
      "الحزب 43 : وَمَن يَقْنُتْ\nمن الآية 31 من الأحزاب إلى الآية 23 من سبا",
      "الحزب 44 : قُلْ مَن يَرْزُقُكُم\nمن الآية 24 من سبا إلى الآية 27 من يس",
      "الحزب 45 : وَمَا أَنزَلْنَا\nمن الآية 28 من يس إلى الآية 145 من الصافات",
      "الحزب 46 : * فَنَبَذْنَاه\nمن الآية 146 من الصافات إلى الآية 31 من الزمر\nالسجدة، الآية 23 من سورة ص",
      "الحزب 47 : فَمَنْ أَظْلَم\nمن الآية 32 من الزمر إلى الآية 40 من غافر",
      "الحزب 48 : وَيَا قَوْمِ\nمن الآية 41 من غافر إلى الآية 46 من فصلت\nالسجدة، الآية 37 من فصلت",
      "الحزب 49 : إلَيْهِ\nمن الآية 47 من فصلت إلى الآية 23 من الزخرف",
      "الحزب 50 : قَالَ أَوَلَوْ \nمن الآية 24 من الزخرف إلى آخر الجاثية",
      "الحزب 51 : حم\nمن الآية 1 من الأحقاف إلى الآية 17 الفتح",
      "الحزب 52 : لَقَدْ رَضِيَ اللَّهُ\nمن الآية 18 من الفتح إلى الآية 30 من الذاريات",
      "الحزب 53 : قَالَ فَمَا خَطْبُكُمْ\nمن الآية 31 من الذاريات إلى آخر القمر",
      "الحزب 54 : الرَّحْمَنُ\nمن الرحمن إلى الحديد",
      "الحزب 55 : قَدْ سَمِعَ الله\nمن المجادلة إلى الصف",
      "الحزب 56 : يُسَبِّحُ \nمن الجمعة إلى التحريم",
      "الحزب 57 : تبَارَكَ\nمن الملك إلى نوح",
      "الحزب 58 : قُلْ أُوحِيَ\nمن الجن إلى المرسلات",
      "الحزب 59 : عَمَّ \nمن النبأ إلى الطارق",
      "الحزب 60 : سَبِّحِ \n من الأعلى إلى الناس",
    ];
  }
}
