package info.cam.cam.khatma_app;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/* loaded from: classes.dex */
public class Verser {
    String jour;
    String verser1;
    String verser2;
    String verser3;

    public Verser(String verser1, String verser2, String verser3, String jour) {
        this.verser1 = verser1;
        this.verser2 = verser2;
        this.verser3 = verser3;
        this.jour = jour;
    }

    public Verser() {
    }

    public static List<Verser> listeVers() {
        List<Verser> list = new ArrayList<>();
        list.add(new Verser("الحزب 59 : عَمَّ \nمن النبأ إلى الطارق", "الحزب 60 : سَبِّحِ \n من الأعلى إلى الناس", "الحزب 1 : الم \nمن الفاتحة إلى الآية 75 من البقرة.", "الأربعاء"));
        list.add(new Verser("الحزب 2 : وَإِذَا لَقُوا\nمن الآية 76 إلى الآية 141 من البقرة", "الحزب 3 : سَيَقُولُ السُّفَهَاء\n من الآية 142 إلى الآية 202 من البقرة", "الحزب 4 : وَاذْكُرُواْ اللّه\nمن الآية 203 إلى الآية 252 من البقرة", "الخميس"));
        list.add(new Verser("سورة الكهف", "الحزب 5 : تِلْكَ الرُّسُل\n من الآية 253من البقرة إلى الآية 14 من آل عمران", "الحزب 6 : قُلْ أَؤُنَبِّئُكُم \nمن الآية 15 إلى الآية 90 من آل عمران", "الجمعة"));
        list.add(new Verser("الحزب 7 : لَن تَنَالُواْ الْبِرَّ حَتَّى تُنفِقُواْ مِمَّا تُحِبُّون\nمن الآية 91 إلى الآية 170 من آل عمران", "الحزب 8 : يَسْتَبْشِرُون\n من الآية 171 من آل عمران إلى الآية 23 من النساء", "الحزب 9 : وَالْمُحْصَنَات\n من الآية 24 إلى الآية 85 من النساء", "السبت"));
        list.add(new Verser("الحزب 10 : اللّهُ لا إِلَـهَ إِلاَّ هُو\n من الآية 86 إلى الآية 146 من النساء", "الحزب 11 : لاَّ يُحِبُّ اللّهُ الْجَهْرَ بِالسُّوَءِ مِنَ الْقَوْل\n من الآية 147 من النساء إلى الآية 24 من المائدة", "الحزب 12 : قَالَ رَجُلاَن\n من الآية 25 إلى الآية 81 من المائدة", "الأحد"));
        list.add(new Verser("الحزب 13 : لَتَجِدَن\nمن الآية 82 من المائدة إلى الآية 35 الأنعام", "الحزب 14 : إِنَّمَا يَسْتَجِيب \nمن الآية 36 إلى الآية 110 من الأنعام", "الحزب 15 : وَلَوْ أَنَّنَا\nمن الآية 111 من الأنعام إلى الآية 3 من الأعراف", "الاثنين"));
        list.add(new Verser("الحزب 16 : فَمَا كَانَ دَعْوَاهُم\nمن الآية 4 إلى الآية 87 من الأعراف", "الحزب 17 : قَالَ الْمَلأُ\nمن الآية 88 إلى الآية 170 من الأعراف", "الحزب 18 : وَإِذ نَتَقْنَا الْجَبَل\nمن الآية 171 من الأعراف إلى الآية 40 من الأنفال\nالسجدة، الآية 206 من الأعراف", "الثلاثاء"));
        list.add(new Verser("الحزب 19 : وَاعْلَمُواْ\n من الآية 41 من الأنفال إلى الآية 33 من التوبة", "الحزب 20 : يَا أَيُّهَا الَّذِينَ آمَنُواْ إِنَّ كَثِيرا\nمن الآية 34 إلى الآية 92 من التوبة", "الحزب 21 : إِنَّمَا السَّبِيل\nمن الآية 93 من التوبة إلى الآية 25 من يونس", "الأربعاء"));
        list.add(new Verser("الحزب 22 : لِّلَّذِينَ أَحْسَنُواْ الحسنى\nمن الآية 26 من يونس إلى الآية 5 من هود", "الحزب 23 : وَمَا مِن دَآبَّة\nمن الآية 6 إلى الآية 83 من هود", "الحزب 24 : وَإِلَى مَدْيَن\nمن الآية 84 من هود إلى الآية 52 من يوسف", "الخميس"));
        list.add(new Verser("سورة الكهف", "الحزب 25 : وَمَا أُبَرِّىءُ\nمن الآية 53 من يوسف إلى الآية 18 من الرعد\nالسجدة، الآية 16 من الرعد", "الحزب 26 : أَفَمَن يَعْلَمُ\nمن الآية 19 من الرعد إلى آخر إبراهيم", "الجمعة"));
        list.add(new Verser("الحزب 27 : رُّبَمَا\nمن الآية 2 من الحجر إلى الآية 50 من النحل\nالسجدة، الآية 50 من النحل", "الحزب 28 : وَقَالَ اللّهُ\nمن الآية 51 إلى آخر النحل", "الحزب 29 : سُبْحَانَ\nمن الآية 1 إلى 98 من الإسراء", "السبت"));
        list.add(new Verser("الحزب 30 : أَوَلَمْ يَرَوْاْ\nمن 99 من الإسراء إلى الآية 74 من الكهف\nالسجدة، الآية 108 من الإسراء", "الحزب 31 : قَالَ أَلَمْ أَقُلْ لك\nمن الآية 75 من الكهف إلى الآية 8 من طه\nالسجدة، الآية 58 من مريم", "الحزب 32 : طه\nسورة طه", "الأحد"));
        list.add(new Verser("الحزب 33 : اقْتَرَبَ لِلنَّاسِ حسابهم\nسورة الأنبياء", "الحزب 34 : يَا أَيُّهَا النَّاس\nسورة الحج\nالسجدة، الآية 18", "الحزب 35 : قَدْ أَفْلَح المؤمنون\nمن الآية 1 من المؤمنون إلى الآية 20 من النور", "الاثنين"));
        list.add(new Verser("الحزب 36 : يَا أَيُّهَا الَّذِينَ آمَنُوا لَا تَتَّبِعُوا خُطُوَاتِ الشَّيْطَان\nمن الآية 21 من النور إلى الآية 20 من الفرقان", "الحزب 37 : وَقَالَ الَّذِينَ لَا يَرْجُونَ\nمن الآية 21 الفرقان إلى الآية 110 من الشعراء\nالسجدة، الآية 60 من سورة الفرقان", "الحزب 38 : قَالُوا أَنُؤْمِنُ\nمن الآية 111 من الشعراء إلى الآية 55 من النمل\nالسجدة، الآية 26 من سورة النمل", "الثلاثاء"));
        list.add(new Verser("الحزب 39 : فَمَا كَانَ جَوَابَ\nمن الآية 56 من النمل إلى الآية 50 من القصص", "الحزب 40 : وَلَقَدْ وَصَّلْنَا\nمن الآية 51 من القصص إلى الآية 45 من العنكبوت", "الحزب 41 : وَلَا تُجَادِلُوا\nمن الآية 46 من العنكبوت إلى الآية 21 من لقمان", "الاربعا"));
        list.add(new Verser("الحزب 42 : وَمَن يُسْلِمْ\nمن الآية 22 من لقمان إلى الآية 30 من الأحزاب\nالسجدة، الآية 15 من سورة السجدة", "الحزب 43 : وَمَن يَقْنُتْ\nمن الآية 31 من الأحزاب إلى الآية 23 من سبا", "الحزب 44 : قُلْ مَن يَرْزُقُكُم\nمن الآية 24 من سبا إلى الآية 27 من يس", "الخميس"));
        list.add(new Verser("سورة الكهف", "الحزب 45 : وَمَا أَنزَلْنَا\nمن الآية 28 من يس إلى الآية 145 من الصافات", "الحزب 46 : * فَنَبَذْنَاه\nمن الآية 146 من الصافات إلى الآية 31 من الزمر\nالسجدة، الآية 23 من سورة ص", "الجمعة"));
        list.add(new Verser("الحزب 47 : فَمَنْ أَظْلَم\nمن الآية 32 من الزمر إلى الآية 40 من غافر", "الحزب 48 : وَيَا قَوْمِ\nمن الآية 41 من غافر إلى الآية 46 من فصلت\nالسجدة، الآية 37 من فصلت", "الحزب 49 : إلَيْهِ\nمن الآية 47 من فصلت إلى الآية 23 من الزخرف", "السبت"));
        list.add(new Verser("الحزب 50 : قَالَ أَوَلَوْ \nمن الآية 24 من الزخرف إلى آخر الجاثية", "الحزب 51 : حم\nمن الآية 1 من الأحقاف إلى الآية 17 الفتح", "الحزب 52 : لَقَدْ رَضِيَ اللَّهُ\nمن الآية 18 من الفتح إلى الآية 30 من الذاريات", "الأحد"));
        list.add(new Verser("الحزب 53 : قَالَ فَمَا خَطْبُكُمْ\nمن الآية 31 من الذاريات إلى آخر القمر", "الحزب 54 : الرَّحْمَنُ\nمن الرحمن إلى الحديد", "الحزب 55 : قَدْ سَمِعَ الله\nمن المجادلة إلى الصف", "الاثنين"));
        list.add(new Verser("الحزب 56 : يُسَبِّحُ \nمن الجمعة إلى التحريم", "الحزب 57 : تبَارَكَ\nمن الملك إلى نوح", "الحزب 58 : قُلْ أُوحِيَ\nمن الجن إلى المرسلات", "الثلاثاء"));
        return list;
    }

    public static String getDuaa() {
        return "دعاء ختم القرآن الكريم\n\nبسم الله الرحمن الرحيم\n\nصدق الله العظيم وبلغ مولانا رسوله المصطفى النبي الكريم عليه أفضل الصلاة وأزكى التسليم وهو أصدق القائلين والمصدقين ،ونحن على ذلك من الشاهدين وبه مؤمنون ولا حول ولا قوة إلا بالله العلي العظيم ،\n\nورضي الله عن ساداتنا :أبي بكر وعمر وعثمان وعلي وطلحة والزبير وعبد الرحمن بن عوف وسعد وسعيد وعن أبي عبيدة ابن الجراح وحمزة والعباس وعن الحسن والحسين وعن جعفر وعقيل وفاطمة وخديجة وعائشة ورضي الله عن سائر أمهات المؤمنين وعن أصحاب رسول الله صلى الله عليه وسلم أجمعين وعن التابعين وتابعي التابعين لهم بإحسان إلى يوم الدين .\n\nاللهم اجعلنا يا مولانا من المحبين التابعين ،\n\nاللهم ارحمنا بالقرآن العظيم وبما فيه من الآيات والذكر الحكيم ،\n\nاللهم علمنا منه ما جهلنا وذكرنا منه ما نسينا وارزقنا تلاوته وحلاوته آناء الليل وأطراف النهار ابتغاء مرضاتك ياذا الجلال والإكرام.\n\nاللهم اجعله لنا إماما ونورا وهدى ورحمة.\n\nاللهم اجعل القرآن العظيم ربيع قلوبنا ، ونور به قلوبنا وقبورنا ،واشرح به صدورنا ويسر يه أمورنا ووفقنا به لما فيه رضاك عنا .\n\nاللهم اجعل القرآن العظيم شافعا مشفعا فينا ولا تجعله ماحلا مصدقا فينا ،\n\nاللهم اجعل القرآن العظيم أمامنا قائدنا إلى الجنة ولا تجعله خلفنا سائقنا إلى النار ،\n\nاللهم ارحمنا بالقرأن العظيم وارحم به والدينا وارحم به أشياخنا وارحم به أزواجنا وارحم به ذرياتنا وارحم به معاهدنا وارحم بها أصهارنا وأنصارنا وارحم بفضلك من علمنا وارحم به جميع المسلمين والمسلمات والمؤمنين والمؤمنات الأحياء منهم والأموات.\n\nاللهم اقسم لنا من خشيتك ما تحول به  بيننا وبين معاصيك ومن طاعتك ما تبلغنا به جنتك ومن اليقين ما تهون به علينا مصائب الدنيا ومتعنا بأبصارنا وأسماعنا وقوتنا ما أحييتنا، واجعله الوارث منا واجعل ثأرنا على من ظلمنا وانصرنا على من عادانا ولا تجعل مصيبتنا في ديننا ولا تجعل الدنيا أكبر همنا ولا مبلغ علمنا ولا غاية رغبتنا ولا تسلط علينا بذنوبنا من لا يرحمنا\n\nاللهم إنا نسألك من الخير كله عاجله وآجله ما علمنا منه وما لم نعلم ونعوذ بك من الشر كله عاجله وآجله ما علمنا منه وما لم نعلم ونسألك الجنة وما قرب إليها من قول وعمل، ونعوذ بك من النار وما قرب إليها من قول وعمل، ونسألك من كل خير سألك منه محمد نبيك وعبدك ورسولك صلى الله عليه وسلم ونعوذ بك من كل شر استعاذك منه محمد نبيك وعبدك ورسولك صلى الله عليه وسلم،\n\nاللهم ما قضيت به علينا من قضاء فاجعل عاقبته رشدا.\n\nياربنا ياخالق العوالم\nحل بيننا وبين كل ظالم\n\nياربنا أنت ترى ما قد جرى\nفاقصم بقهر من علينا جسرا\n\nياربنا عجل لنا بالفرج\nونجنا من ضيقة وحرج\n\nوامدد علينا من حماك الأمنع\nسرادقا من حل فيه يمنع\n\nاللهم احرسنا بعينك التي لا تنام ،واكنفنا في كنفك الذي لا يرام ،واجعلنا في جوارك الذي لا يخفر ولا يضام ،\n\nاللهم إنا ندرأ بك في نحور الأعداء ونعوذ بك من شرورهم،\n\nاللهم إنك أعلم بأعدائنا وكفى بك وليا وكفى بك نصيرا ، اللهم اكفناهم بما شئت .\n\nاللهم أصلح أمة سيدنا محمد صلى الله عليه وسلم .\n\nاللهم ارحم أمة سيدنا محمد صلى الله عليه وسلم.\n\n اللهم فرج عن أمة سيدنا محمد صلى الله عليه وسلم.\n\nاللهم لا تجعل لنا في وقتنا هذا ذنبا إلا غفرته ولا هما إلا فرجته ولا مريضا إلا شفيته  ولا عدوا إلا كفيته ولا دينا إلا قضيته ولامسافرا إلا حفظته وبلغته ولا قلبا إلا أصلحته ولا جائعا إلا أطعمته ولا عريانا إلا كسوته ولا بلاء إلا رددته وصرفته ولا ولا حاجة من حوائج الدنيا والآخرة لك فيه رضى ولنا فيها صلاح إلا أديتها وقضيتها برحمتك يا أرحم الراحمين.\n\nاللهم اغفر لحينا وميتنا وكبيرنا وصغيرنا وحاضرنا وغائبنا  وذكرنا وأنثانا وحرنا وعبدنا وطائعنا وعاصينا.\n\nاللهم اغفر لنا أجمعين وتوفنا مسلمين واحشرنا في زمرة النبيين والصديقين والشهداء والصالحين واكفنا ما أهمنا وما لم يهمنا من أمور الدين والدنيا والآخرة، وكف عنا أيدي المعتدين و لا تجعلنا فتنة للظالمين، ونجنا برحمتك من القوم الكافرين واجعلنا من عبادك المخلصين.\n\nواغفر لكل من إلينا أحسنا\nوجازه عنا الجزاء الأحسنا.\n\nواغفر لكل مسلم ومسلمه\nواحمل عن الجميع كل مظلمه\n\nواحفظ جيوش المسلمين وانصر\nولاتهم على ممر الأعصر.\n\nاللهم لا تجعل فينا ولا منا شقيا ولا محروما.\n\nاللهم استرنا بسترك الجميل وعاملنا بلطفك الجزيل وكن لنا صاحبا في المقام والرحيل.\n\n اللهم إنا نسألك الصدق في العبودية والقيام بحقوق الربوبية .\n\nاللهم إنا نسألك بفاتحية الفاتح الفتح التام وبخاتمية الخاتم حسن الختام،\n\n اللهم إنك أمرتنا بدعائك ووعدتنا بإجابتك وقد دعوناك كما أمرتنا فأجبنا كما وعدتنا يا ذا الجلال والإكرام، إنك لا تخلف الميعاد\n\n اللهم هذا الدعاء ومنك الإجابة وهذا الجهد منا وعليك التكلان، ولاحول ولا قوة إلا بالله العلي العظيم وصلى الله على سيدنا محمد وعلى آله وصحبه وسلم تسليما.\n\nسبحان ربك رب العزة عما يصفون وسلام على المرسلين والحمد لله رب العالمين.";
    }

    public static String getInfoKhatma() {
        return "\n* يمكنكم هذا التطبيق من :\n\n-\tقراءة أحزاب القرآن الكريم برواية ورش عن نافع (كل حزب مقسم إلى أثمان، وكل ثمن في صفحة) وهو ما يساعد على الحفظ، من خلال التطبيق يمكن الضغط على أي حزب لقراءته (المصحف المعتمد في التطبيق بعد سورة الفاتحة هو \"مصحف الشاذلي المثمن\" المشهور في الجزائر).\n\n-\tمعرفة الأحزاب التي تقرأ كل يوم حسب تاريخه، طبقا لبرنامج \"ختمة الإدارة\"، وهو ما يعين على مرافقة المواظبين على هذه الختمة وختم القرآن معهم كل ثلاثة أسابيع (من خلال الضغط على تواريخ الختمات القادمة في التطبيق، يمكن معرفة تواريخ ليالي الختمة).\n\n-\tمعرفة الأحزاب التي فيها مواضع سجود التلاوة ومعرفة أرقام الآيات للانتباه لها عند القراءة.\n\n-\tقراءة دعاء ختم القرآن الكريم.\n\n* ختمة الإدارة\n\n\" -الإدارة\"، من الدوران، لأنه يختم كل ثلاثة أسابيع  (من ليلة الخميس إلى ليلة الخميس) ... ، وهي من عمل أهل شنقيط وتتوارثها الأجيال في بعض المناطق الموريتانية ، حيث يواظب عليها في المساجد وفي البيوت.\n\n- تبدأ هذه الختمة ليلة الخميس ويختم القرآن ليلة الخميس الرابعة بعد البداية.\n\n- ثلاثة أحزاب في اليوم، حزب في الصباح وحزبين في المساء، إلا يوم الجمعة تقرأ سورة الكهف بدل الحزب الصباحي.\n";
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    public static List<Integer> getQuran(int i) {
        List<Integer> list = new ArrayList<>();
        switch (i) {
            case 1:
                list.add(Integer.valueOf(R.drawable.quran1_1));
                list.add(Integer.valueOf(R.drawable.quran1_2));
                list.add(Integer.valueOf(R.drawable.quran1_3));
                list.add(Integer.valueOf(R.drawable.quran1_4));
                list.add(Integer.valueOf(R.drawable.quran1_5));
                list.add(Integer.valueOf(R.drawable.quran1_6));
                list.add(Integer.valueOf(R.drawable.quran1_7));
                list.add(Integer.valueOf(R.drawable.quran1_8));
                list.add(Integer.valueOf(R.drawable.quran1_9));
                return list;
            case 2:
                list.add(Integer.valueOf(R.drawable.quran2_1));
                list.add(Integer.valueOf(R.drawable.quran2_2));
                list.add(Integer.valueOf(R.drawable.quran2_3));
                list.add(Integer.valueOf(R.drawable.quran2_4));
                list.add(Integer.valueOf(R.drawable.quran2_5));
                list.add(Integer.valueOf(R.drawable.quran2_6));
                list.add(Integer.valueOf(R.drawable.quran2_7));
                list.add(Integer.valueOf(R.drawable.quran2_8));
                return list;
            case 3:
                list.add(Integer.valueOf(R.drawable.quran3_1));
                list.add(Integer.valueOf(R.drawable.quran3_2));
                list.add(Integer.valueOf(R.drawable.quran3_3));
                list.add(Integer.valueOf(R.drawable.quran3_4));
                list.add(Integer.valueOf(R.drawable.quran3_5));
                list.add(Integer.valueOf(R.drawable.quran3_6));
                list.add(Integer.valueOf(R.drawable.quran3_7));
                list.add(Integer.valueOf(R.drawable.quran3_8));
                return list;
            case 4:
                list.add(Integer.valueOf(R.drawable.quran4_1));
                list.add(Integer.valueOf(R.drawable.quran4_2));
                list.add(Integer.valueOf(R.drawable.quran4_3));
                list.add(Integer.valueOf(R.drawable.quran4_4));
                list.add(Integer.valueOf(R.drawable.quran4_5));
                list.add(Integer.valueOf(R.drawable.quran4_6));
                list.add(Integer.valueOf(R.drawable.quran4_7));
                list.add(Integer.valueOf(R.drawable.quran4_8));
                return list;
            case 5:
                list.add(Integer.valueOf(R.drawable.quran5_1));
                list.add(Integer.valueOf(R.drawable.quran5_2));
                list.add(Integer.valueOf(R.drawable.quran5_3));
                list.add(Integer.valueOf(R.drawable.quran5_4));
                list.add(Integer.valueOf(R.drawable.quran5_5));
                list.add(Integer.valueOf(R.drawable.quran5_6));
                list.add(Integer.valueOf(R.drawable.quran5_7));
                list.add(Integer.valueOf(R.drawable.quran5_8));
                return list;
            case 6:
                list.add(Integer.valueOf(R.drawable.quran6_1));
                list.add(Integer.valueOf(R.drawable.quran6_2));
                list.add(Integer.valueOf(R.drawable.quran6_3));
                list.add(Integer.valueOf(R.drawable.quran6_4));
                list.add(Integer.valueOf(R.drawable.quran6_5));
                list.add(Integer.valueOf(R.drawable.quran6_6));
                list.add(Integer.valueOf(R.drawable.quran6_7));
                list.add(Integer.valueOf(R.drawable.quran6_8));
                return list;
            case 7:
                list.add(Integer.valueOf(R.drawable.quran7_1));
                list.add(Integer.valueOf(R.drawable.quran7_2));
                list.add(Integer.valueOf(R.drawable.quran7_3));
                list.add(Integer.valueOf(R.drawable.quran7_4));
                list.add(Integer.valueOf(R.drawable.quran7_5));
                list.add(Integer.valueOf(R.drawable.quran7_6));
                list.add(Integer.valueOf(R.drawable.quran7_7));
                list.add(Integer.valueOf(R.drawable.quran7_8));
                return list;
            case 8:
                list.add(Integer.valueOf(R.drawable.quran8_1));
                list.add(Integer.valueOf(R.drawable.quran8_2));
                list.add(Integer.valueOf(R.drawable.quran8_3));
                list.add(Integer.valueOf(R.drawable.quran8_4));
                list.add(Integer.valueOf(R.drawable.quran8_5));
                list.add(Integer.valueOf(R.drawable.quran8_6));
                list.add(Integer.valueOf(R.drawable.quran8_7));
                list.add(Integer.valueOf(R.drawable.quran8_8));
                return list;
            case 9:
                list.add(Integer.valueOf(R.drawable.quran9_1));
                list.add(Integer.valueOf(R.drawable.quran9_2));
                list.add(Integer.valueOf(R.drawable.quran9_3));
                list.add(Integer.valueOf(R.drawable.quran9_4));
                list.add(Integer.valueOf(R.drawable.quran9_5));
                list.add(Integer.valueOf(R.drawable.quran9_6));
                list.add(Integer.valueOf(R.drawable.quran9_7));
                list.add(Integer.valueOf(R.drawable.quran9_8));
                return list;
            case 10:
                list.add(Integer.valueOf(R.drawable.quran10_1));
                list.add(Integer.valueOf(R.drawable.quran10_2));
                list.add(Integer.valueOf(R.drawable.quran10_3));
                list.add(Integer.valueOf(R.drawable.quran10_4));
                list.add(Integer.valueOf(R.drawable.quran10_5));
                list.add(Integer.valueOf(R.drawable.quran10_6));
                list.add(Integer.valueOf(R.drawable.quran10_7));
                list.add(Integer.valueOf(R.drawable.quran10_8));
                return list;
            case 11:
                list.add(Integer.valueOf(R.drawable.quran11_1));
                list.add(Integer.valueOf(R.drawable.quran11_2));
                list.add(Integer.valueOf(R.drawable.quran11_3));
                list.add(Integer.valueOf(R.drawable.quran11_4));
                list.add(Integer.valueOf(R.drawable.quran11_5));
                list.add(Integer.valueOf(R.drawable.quran11_6));
                list.add(Integer.valueOf(R.drawable.quran11_7));
                list.add(Integer.valueOf(R.drawable.quran11_8));
                return list;
            case 12:
                list.add(Integer.valueOf(R.drawable.quran12_1));
                list.add(Integer.valueOf(R.drawable.quran12_2));
                list.add(Integer.valueOf(R.drawable.quran12_3));
                list.add(Integer.valueOf(R.drawable.quran12_4));
                list.add(Integer.valueOf(R.drawable.quran12_5));
                list.add(Integer.valueOf(R.drawable.quran12_6));
                list.add(Integer.valueOf(R.drawable.quran12_7));
                list.add(Integer.valueOf(R.drawable.quran12_8));
                return list;
            case 13:
                list.add(Integer.valueOf(R.drawable.quran13_1));
                list.add(Integer.valueOf(R.drawable.quran13_2));
                list.add(Integer.valueOf(R.drawable.quran13_3));
                list.add(Integer.valueOf(R.drawable.quran13_4));
                list.add(Integer.valueOf(R.drawable.quran13_5));
                list.add(Integer.valueOf(R.drawable.quran13_6));
                list.add(Integer.valueOf(R.drawable.quran13_7));
                list.add(Integer.valueOf(R.drawable.quran13_8));
                return list;
            case 14:
                list.add(Integer.valueOf(R.drawable.quran14_1));
                list.add(Integer.valueOf(R.drawable.quran14_2));
                list.add(Integer.valueOf(R.drawable.quran14_3));
                list.add(Integer.valueOf(R.drawable.quran14_4));
                list.add(Integer.valueOf(R.drawable.quran14_5));
                list.add(Integer.valueOf(R.drawable.quran14_6));
                list.add(Integer.valueOf(R.drawable.quran14_7));
                list.add(Integer.valueOf(R.drawable.quran14_8));
                return list;
            case 15:
                list.add(Integer.valueOf(R.drawable.quran15_1));
                list.add(Integer.valueOf(R.drawable.quran15_2));
                list.add(Integer.valueOf(R.drawable.quran15_3));
                list.add(Integer.valueOf(R.drawable.quran15_4));
                list.add(Integer.valueOf(R.drawable.quran15_5));
                list.add(Integer.valueOf(R.drawable.quran15_6));
                list.add(Integer.valueOf(R.drawable.quran15_7));
                list.add(Integer.valueOf(R.drawable.quran15_8));
                return list;
            case 16:
                list.add(Integer.valueOf(R.drawable.quran16_1));
                list.add(Integer.valueOf(R.drawable.quran16_2));
                list.add(Integer.valueOf(R.drawable.quran16_3));
                list.add(Integer.valueOf(R.drawable.quran16_4));
                list.add(Integer.valueOf(R.drawable.quran16_5));
                list.add(Integer.valueOf(R.drawable.quran16_6));
                list.add(Integer.valueOf(R.drawable.quran16_7));
                list.add(Integer.valueOf(R.drawable.quran16_8));
                return list;
            case 17:
                list.add(Integer.valueOf(R.drawable.quran17_1));
                list.add(Integer.valueOf(R.drawable.quran17_2));
                list.add(Integer.valueOf(R.drawable.quran17_3));
                list.add(Integer.valueOf(R.drawable.quran17_4));
                list.add(Integer.valueOf(R.drawable.quran17_5));
                list.add(Integer.valueOf(R.drawable.quran17_6));
                list.add(Integer.valueOf(R.drawable.quran17_7));
                list.add(Integer.valueOf(R.drawable.quran17_8));
                return list;
            case 18:
                list.add(Integer.valueOf(R.drawable.quran18_1));
                list.add(Integer.valueOf(R.drawable.quran18_2));
                list.add(Integer.valueOf(R.drawable.quran18_3));
                list.add(Integer.valueOf(R.drawable.quran18_4));
                list.add(Integer.valueOf(R.drawable.quran18_5));
                list.add(Integer.valueOf(R.drawable.quran18_6));
                list.add(Integer.valueOf(R.drawable.quran18_7));
                list.add(Integer.valueOf(R.drawable.quran18_8));
                return list;
            case 19:
                list.add(Integer.valueOf(R.drawable.quran19_1));
                list.add(Integer.valueOf(R.drawable.quran19_2));
                list.add(Integer.valueOf(R.drawable.quran19_3));
                list.add(Integer.valueOf(R.drawable.quran19_4));
                list.add(Integer.valueOf(R.drawable.quran19_5));
                list.add(Integer.valueOf(R.drawable.quran19_6));
                list.add(Integer.valueOf(R.drawable.quran19_7));
                list.add(Integer.valueOf(R.drawable.quran19_8));
                return list;
            case 20:
                list.add(Integer.valueOf(R.drawable.quran20_1));
                list.add(Integer.valueOf(R.drawable.quran20_2));
                list.add(Integer.valueOf(R.drawable.quran20_3));
                list.add(Integer.valueOf(R.drawable.quran20_4));
                list.add(Integer.valueOf(R.drawable.quran20_5));
                list.add(Integer.valueOf(R.drawable.quran20_6));
                list.add(Integer.valueOf(R.drawable.quran20_7));
                list.add(Integer.valueOf(R.drawable.quran20_8));
                return list;
            case 21:
                list.add(Integer.valueOf(R.drawable.quran21_1));
                list.add(Integer.valueOf(R.drawable.quran21_2));
                list.add(Integer.valueOf(R.drawable.quran21_3));
                list.add(Integer.valueOf(R.drawable.quran21_4));
                list.add(Integer.valueOf(R.drawable.quran21_5));
                list.add(Integer.valueOf(R.drawable.quran21_6));
                list.add(Integer.valueOf(R.drawable.quran21_7));
                list.add(Integer.valueOf(R.drawable.quran21_8));
                return list;
            case 22:
                list.add(Integer.valueOf(R.drawable.quran22_1));
                list.add(Integer.valueOf(R.drawable.quran22_2));
                list.add(Integer.valueOf(R.drawable.quran22_3));
                list.add(Integer.valueOf(R.drawable.quran22_4));
                list.add(Integer.valueOf(R.drawable.quran22_5));
                list.add(Integer.valueOf(R.drawable.quran22_6));
                list.add(Integer.valueOf(R.drawable.quran22_7));
                list.add(Integer.valueOf(R.drawable.quran22_8));
                return list;
            case 23:
                list.add(Integer.valueOf(R.drawable.quran23_1));
                list.add(Integer.valueOf(R.drawable.quran23_2));
                list.add(Integer.valueOf(R.drawable.quran23_3));
                list.add(Integer.valueOf(R.drawable.quran23_4));
                list.add(Integer.valueOf(R.drawable.quran23_5));
                list.add(Integer.valueOf(R.drawable.quran23_6));
                list.add(Integer.valueOf(R.drawable.quran23_7));
                list.add(Integer.valueOf(R.drawable.quran23_8));
                return list;
            case 24:
                list.add(Integer.valueOf(R.drawable.quran24_1));
                list.add(Integer.valueOf(R.drawable.quran24_2));
                list.add(Integer.valueOf(R.drawable.quran24_3));
                list.add(Integer.valueOf(R.drawable.quran24_4));
                list.add(Integer.valueOf(R.drawable.quran24_5));
                list.add(Integer.valueOf(R.drawable.quran24_6));
                list.add(Integer.valueOf(R.drawable.quran24_7));
                list.add(Integer.valueOf(R.drawable.quran24_8));
                return list;
            case 25:
                list.add(Integer.valueOf(R.drawable.quran25_1));
                list.add(Integer.valueOf(R.drawable.quran25_2));
                list.add(Integer.valueOf(R.drawable.quran25_3));
                list.add(Integer.valueOf(R.drawable.quran25_4));
                list.add(Integer.valueOf(R.drawable.quran25_5));
                list.add(Integer.valueOf(R.drawable.quran25_6));
                list.add(Integer.valueOf(R.drawable.quran25_7));
                list.add(Integer.valueOf(R.drawable.quran25_8));
                return list;
            case 26:
                list.add(Integer.valueOf(R.drawable.quran26_1));
                list.add(Integer.valueOf(R.drawable.quran26_2));
                list.add(Integer.valueOf(R.drawable.quran26_3));
                list.add(Integer.valueOf(R.drawable.quran26_4));
                list.add(Integer.valueOf(R.drawable.quran26_5));
                list.add(Integer.valueOf(R.drawable.quran26_6));
                list.add(Integer.valueOf(R.drawable.quran26_7));
                list.add(Integer.valueOf(R.drawable.quran26_8));
                return list;
            case 27:
                list.add(Integer.valueOf(R.drawable.quran27_1));
                list.add(Integer.valueOf(R.drawable.quran27_2));
                list.add(Integer.valueOf(R.drawable.quran27_3));
                list.add(Integer.valueOf(R.drawable.quran27_4));
                list.add(Integer.valueOf(R.drawable.quran27_5));
                list.add(Integer.valueOf(R.drawable.quran27_6));
                list.add(Integer.valueOf(R.drawable.quran27_7));
                list.add(Integer.valueOf(R.drawable.quran27_8));
                return list;
            case 28:
                list.add(Integer.valueOf(R.drawable.quran28_1));
                list.add(Integer.valueOf(R.drawable.quran28_2));
                list.add(Integer.valueOf(R.drawable.quran28_3));
                list.add(Integer.valueOf(R.drawable.quran28_4));
                list.add(Integer.valueOf(R.drawable.quran28_5));
                list.add(Integer.valueOf(R.drawable.quran28_6));
                list.add(Integer.valueOf(R.drawable.quran28_7));
                list.add(Integer.valueOf(R.drawable.quran28_8));
                return list;
            case 29:
                list.add(Integer.valueOf(R.drawable.quran29_1));
                list.add(Integer.valueOf(R.drawable.quran29_2));
                list.add(Integer.valueOf(R.drawable.quran29_3));
                list.add(Integer.valueOf(R.drawable.quran29_4));
                list.add(Integer.valueOf(R.drawable.quran29_5));
                list.add(Integer.valueOf(R.drawable.quran29_6));
                list.add(Integer.valueOf(R.drawable.quran29_7));
                list.add(Integer.valueOf(R.drawable.quran29_8));
                return list;
            case 30:
                list.add(Integer.valueOf(R.drawable.quran30_1));
                list.add(Integer.valueOf(R.drawable.quran30_2));
                list.add(Integer.valueOf(R.drawable.quran30_3));
                list.add(Integer.valueOf(R.drawable.quran30_4));
                list.add(Integer.valueOf(R.drawable.quran30_5));
                list.add(Integer.valueOf(R.drawable.quran30_6));
                list.add(Integer.valueOf(R.drawable.quran30_7));
                list.add(Integer.valueOf(R.drawable.quran30_8));
                return list;
            case 31:
                list.add(Integer.valueOf(R.drawable.quran31_1));
                list.add(Integer.valueOf(R.drawable.quran31_2));
                list.add(Integer.valueOf(R.drawable.quran31_3));
                list.add(Integer.valueOf(R.drawable.quran31_4));
                list.add(Integer.valueOf(R.drawable.quran31_5));
                list.add(Integer.valueOf(R.drawable.quran31_6));
                list.add(Integer.valueOf(R.drawable.quran31_7));
                list.add(Integer.valueOf(R.drawable.quran31_8));
                return list;
            case 32:
                list.add(Integer.valueOf(R.drawable.quran32_1));
                list.add(Integer.valueOf(R.drawable.quran32_2));
                list.add(Integer.valueOf(R.drawable.quran32_3));
                list.add(Integer.valueOf(R.drawable.quran32_4));
                list.add(Integer.valueOf(R.drawable.quran32_5));
                list.add(Integer.valueOf(R.drawable.quran32_6));
                list.add(Integer.valueOf(R.drawable.quran32_7));
                list.add(Integer.valueOf(R.drawable.quran32_8));
                return list;
            case 33:
                list.add(Integer.valueOf(R.drawable.quran33_1));
                list.add(Integer.valueOf(R.drawable.quran33_2));
                list.add(Integer.valueOf(R.drawable.quran33_3));
                list.add(Integer.valueOf(R.drawable.quran33_4));
                list.add(Integer.valueOf(R.drawable.quran33_5));
                list.add(Integer.valueOf(R.drawable.quran33_6));
                list.add(Integer.valueOf(R.drawable.quran33_7));
                list.add(Integer.valueOf(R.drawable.quran33_8));
                return list;
            case 34:
                list.add(Integer.valueOf(R.drawable.quran34_1));
                list.add(Integer.valueOf(R.drawable.quran34_2));
                list.add(Integer.valueOf(R.drawable.quran34_3));
                list.add(Integer.valueOf(R.drawable.quran34_4));
                list.add(Integer.valueOf(R.drawable.quran34_5));
                list.add(Integer.valueOf(R.drawable.quran34_6));
                list.add(Integer.valueOf(R.drawable.quran34_7));
                list.add(Integer.valueOf(R.drawable.quran34_8));
                return list;
            case 35:
                list.add(Integer.valueOf(R.drawable.quran35_1));
                list.add(Integer.valueOf(R.drawable.quran35_2));
                list.add(Integer.valueOf(R.drawable.quran35_3));
                list.add(Integer.valueOf(R.drawable.quran35_4));
                list.add(Integer.valueOf(R.drawable.quran35_5));
                list.add(Integer.valueOf(R.drawable.quran35_6));
                list.add(Integer.valueOf(R.drawable.quran35_7));
                list.add(Integer.valueOf(R.drawable.quran35_8));
                return list;
            case 36:
                list.add(Integer.valueOf(R.drawable.quran36_1));
                list.add(Integer.valueOf(R.drawable.quran36_2));
                list.add(Integer.valueOf(R.drawable.quran36_3));
                list.add(Integer.valueOf(R.drawable.quran36_4));
                list.add(Integer.valueOf(R.drawable.quran36_5));
                list.add(Integer.valueOf(R.drawable.quran36_6));
                list.add(Integer.valueOf(R.drawable.quran36_7));
                list.add(Integer.valueOf(R.drawable.quran36_8));
                return list;
            case 37:
                list.add(Integer.valueOf(R.drawable.quran37_1));
                list.add(Integer.valueOf(R.drawable.quran37_2));
                list.add(Integer.valueOf(R.drawable.quran37_3));
                list.add(Integer.valueOf(R.drawable.quran37_4));
                list.add(Integer.valueOf(R.drawable.quran37_5));
                list.add(Integer.valueOf(R.drawable.quran37_6));
                list.add(Integer.valueOf(R.drawable.quran37_7));
                list.add(Integer.valueOf(R.drawable.quran37_8));
                return list;
            case 38:
                list.add(Integer.valueOf(R.drawable.quran38_1));
                list.add(Integer.valueOf(R.drawable.quran38_2));
                list.add(Integer.valueOf(R.drawable.quran38_3));
                list.add(Integer.valueOf(R.drawable.quran38_4));
                list.add(Integer.valueOf(R.drawable.quran38_5));
                list.add(Integer.valueOf(R.drawable.quran38_6));
                list.add(Integer.valueOf(R.drawable.quran38_7));
                list.add(Integer.valueOf(R.drawable.quran38_8));
                return list;
            case 39:
                list.add(Integer.valueOf(R.drawable.quran39_1));
                list.add(Integer.valueOf(R.drawable.quran39_2));
                list.add(Integer.valueOf(R.drawable.quran39_3));
                list.add(Integer.valueOf(R.drawable.quran39_4));
                list.add(Integer.valueOf(R.drawable.quran39_5));
                list.add(Integer.valueOf(R.drawable.quran39_6));
                list.add(Integer.valueOf(R.drawable.quran39_7));
                list.add(Integer.valueOf(R.drawable.quran39_8));
                return list;
            case 40:
                list.add(Integer.valueOf(R.drawable.quran40_1));
                list.add(Integer.valueOf(R.drawable.quran40_2));
                list.add(Integer.valueOf(R.drawable.quran40_3));
                list.add(Integer.valueOf(R.drawable.quran40_4));
                list.add(Integer.valueOf(R.drawable.quran40_5));
                list.add(Integer.valueOf(R.drawable.quran40_6));
                list.add(Integer.valueOf(R.drawable.quran40_7));
                list.add(Integer.valueOf(R.drawable.quran40_8));
                return list;
            case 41:
                list.add(Integer.valueOf(R.drawable.quran41_1));
                list.add(Integer.valueOf(R.drawable.quran41_2));
                list.add(Integer.valueOf(R.drawable.quran41_3));
                list.add(Integer.valueOf(R.drawable.quran41_4));
                list.add(Integer.valueOf(R.drawable.quran41_5));
                list.add(Integer.valueOf(R.drawable.quran41_6));
                list.add(Integer.valueOf(R.drawable.quran41_7));
                list.add(Integer.valueOf(R.drawable.quran41_8));
                return list;
            case 42:
                list.add(Integer.valueOf(R.drawable.quran42_1));
                list.add(Integer.valueOf(R.drawable.quran42_2));
                list.add(Integer.valueOf(R.drawable.quran42_3));
                list.add(Integer.valueOf(R.drawable.quran42_4));
                list.add(Integer.valueOf(R.drawable.quran42_5));
                list.add(Integer.valueOf(R.drawable.quran42_6));
                list.add(Integer.valueOf(R.drawable.quran42_7));
                list.add(Integer.valueOf(R.drawable.quran42_8));
                return list;
            case 43:
                list.add(Integer.valueOf(R.drawable.quran43_1));
                list.add(Integer.valueOf(R.drawable.quran43_2));
                list.add(Integer.valueOf(R.drawable.quran43_3));
                list.add(Integer.valueOf(R.drawable.quran43_4));
                list.add(Integer.valueOf(R.drawable.quran43_5));
                list.add(Integer.valueOf(R.drawable.quran43_6));
                list.add(Integer.valueOf(R.drawable.quran43_7));
                list.add(Integer.valueOf(R.drawable.quran43_8));
                return list;
            case 44:
                list.add(Integer.valueOf(R.drawable.quran44_1));
                list.add(Integer.valueOf(R.drawable.quran44_2));
                list.add(Integer.valueOf(R.drawable.quran44_3));
                list.add(Integer.valueOf(R.drawable.quran44_4));
                list.add(Integer.valueOf(R.drawable.quran44_5));
                list.add(Integer.valueOf(R.drawable.quran44_6));
                list.add(Integer.valueOf(R.drawable.quran44_7));
                list.add(Integer.valueOf(R.drawable.quran44_8));
                return list;
            case 45:
                list.add(Integer.valueOf(R.drawable.quran45_1));
                list.add(Integer.valueOf(R.drawable.quran45_2));
                list.add(Integer.valueOf(R.drawable.quran45_3));
                list.add(Integer.valueOf(R.drawable.quran45_4));
                list.add(Integer.valueOf(R.drawable.quran45_5));
                list.add(Integer.valueOf(R.drawable.quran45_6));
                list.add(Integer.valueOf(R.drawable.quran45_7));
                list.add(Integer.valueOf(R.drawable.quran45_8));
                return list;
            case 46:
                list.add(Integer.valueOf(R.drawable.quran46_1));
                list.add(Integer.valueOf(R.drawable.quran46_2));
                list.add(Integer.valueOf(R.drawable.quran46_3));
                list.add(Integer.valueOf(R.drawable.quran46_4));
                list.add(Integer.valueOf(R.drawable.quran46_5));
                list.add(Integer.valueOf(R.drawable.quran46_6));
                list.add(Integer.valueOf(R.drawable.quran46_7));
                list.add(Integer.valueOf(R.drawable.quran46_8));
                return list;
            case 47:
                list.add(Integer.valueOf(R.drawable.quran47_1));
                list.add(Integer.valueOf(R.drawable.quran47_2));
                list.add(Integer.valueOf(R.drawable.quran47_3));
                list.add(Integer.valueOf(R.drawable.quran47_4));
                list.add(Integer.valueOf(R.drawable.quran47_5));
                list.add(Integer.valueOf(R.drawable.quran47_6));
                list.add(Integer.valueOf(R.drawable.quran47_7));
                list.add(Integer.valueOf(R.drawable.quran47_8));
                return list;
            case 48:
                list.add(Integer.valueOf(R.drawable.quran48_1));
                list.add(Integer.valueOf(R.drawable.quran48_2));
                list.add(Integer.valueOf(R.drawable.quran48_3));
                list.add(Integer.valueOf(R.drawable.quran48_4));
                list.add(Integer.valueOf(R.drawable.quran48_5));
                list.add(Integer.valueOf(R.drawable.quran48_6));
                list.add(Integer.valueOf(R.drawable.quran48_7));
                list.add(Integer.valueOf(R.drawable.quran48_8));
                return list;
            case 49:
                list.add(Integer.valueOf(R.drawable.quran49_1));
                list.add(Integer.valueOf(R.drawable.quran49_2));
                list.add(Integer.valueOf(R.drawable.quran49_3));
                list.add(Integer.valueOf(R.drawable.quran49_4));
                list.add(Integer.valueOf(R.drawable.quran49_5));
                list.add(Integer.valueOf(R.drawable.quran49_6));
                list.add(Integer.valueOf(R.drawable.quran49_7));
                list.add(Integer.valueOf(R.drawable.quran49_8));
                return list;
            case 50:
                list.add(Integer.valueOf(R.drawable.quran50_1));
                list.add(Integer.valueOf(R.drawable.quran50_2));
                list.add(Integer.valueOf(R.drawable.quran50_3));
                list.add(Integer.valueOf(R.drawable.quran50_4));
                list.add(Integer.valueOf(R.drawable.quran50_5));
                list.add(Integer.valueOf(R.drawable.quran50_6));
                list.add(Integer.valueOf(R.drawable.quran50_7));
                list.add(Integer.valueOf(R.drawable.quran50_8));
                return list;
            case 51:
                list.add(Integer.valueOf(R.drawable.quran51_1));
                list.add(Integer.valueOf(R.drawable.quran51_2));
                list.add(Integer.valueOf(R.drawable.quran51_3));
                list.add(Integer.valueOf(R.drawable.quran51_4));
                list.add(Integer.valueOf(R.drawable.quran51_5));
                list.add(Integer.valueOf(R.drawable.quran51_6));
                list.add(Integer.valueOf(R.drawable.quran51_7));
                list.add(Integer.valueOf(R.drawable.quran51_8));
                return list;
            case 52:
                list.add(Integer.valueOf(R.drawable.quran52_1));
                list.add(Integer.valueOf(R.drawable.quran52_2));
                list.add(Integer.valueOf(R.drawable.quran52_3));
                list.add(Integer.valueOf(R.drawable.quran52_4));
                list.add(Integer.valueOf(R.drawable.quran52_5));
                list.add(Integer.valueOf(R.drawable.quran52_6));
                list.add(Integer.valueOf(R.drawable.quran52_7));
                list.add(Integer.valueOf(R.drawable.quran52_8));
                return list;
            case 53:
                list.add(Integer.valueOf(R.drawable.quran53_1));
                list.add(Integer.valueOf(R.drawable.quran53_2));
                list.add(Integer.valueOf(R.drawable.quran53_3));
                list.add(Integer.valueOf(R.drawable.quran53_4));
                list.add(Integer.valueOf(R.drawable.quran53_5));
                list.add(Integer.valueOf(R.drawable.quran53_6));
                list.add(Integer.valueOf(R.drawable.quran53_7));
                list.add(Integer.valueOf(R.drawable.quran53_8));
                return list;
            case 54:
                list.add(Integer.valueOf(R.drawable.quran54_1));
                list.add(Integer.valueOf(R.drawable.quran54_2));
                list.add(Integer.valueOf(R.drawable.quran54_3));
                list.add(Integer.valueOf(R.drawable.quran54_4));
                list.add(Integer.valueOf(R.drawable.quran54_5));
                list.add(Integer.valueOf(R.drawable.quran54_6));
                list.add(Integer.valueOf(R.drawable.quran54_7));
                list.add(Integer.valueOf(R.drawable.quran54_8));
                return list;
            case 55:
                list.add(Integer.valueOf(R.drawable.quran55_1));
                list.add(Integer.valueOf(R.drawable.quran55_2));
                list.add(Integer.valueOf(R.drawable.quran55_3));
                list.add(Integer.valueOf(R.drawable.quran55_4));
                list.add(Integer.valueOf(R.drawable.quran55_5));
                list.add(Integer.valueOf(R.drawable.quran55_6));
                list.add(Integer.valueOf(R.drawable.quran55_7));
                list.add(Integer.valueOf(R.drawable.quran55_8));
                return list;
            case 56:
                list.add(Integer.valueOf(R.drawable.quran56_1));
                list.add(Integer.valueOf(R.drawable.quran56_2));
                list.add(Integer.valueOf(R.drawable.quran56_3));
                list.add(Integer.valueOf(R.drawable.quran56_4));
                list.add(Integer.valueOf(R.drawable.quran56_5));
                list.add(Integer.valueOf(R.drawable.quran56_6));
                list.add(Integer.valueOf(R.drawable.quran56_7));
                list.add(Integer.valueOf(R.drawable.quran56_8));
                return list;
            case 57:
                list.add(Integer.valueOf(R.drawable.quran57_1));
                list.add(Integer.valueOf(R.drawable.quran57_2));
                list.add(Integer.valueOf(R.drawable.quran57_3));
                list.add(Integer.valueOf(R.drawable.quran57_4));
                list.add(Integer.valueOf(R.drawable.quran57_5));
                list.add(Integer.valueOf(R.drawable.quran57_6));
                list.add(Integer.valueOf(R.drawable.quran57_7));
                list.add(Integer.valueOf(R.drawable.quran57_8));
                return list;
            case 58:
                list.add(Integer.valueOf(R.drawable.quran58_1));
                list.add(Integer.valueOf(R.drawable.quran58_2));
                list.add(Integer.valueOf(R.drawable.quran58_3));
                list.add(Integer.valueOf(R.drawable.quran58_4));
                list.add(Integer.valueOf(R.drawable.quran58_5));
                list.add(Integer.valueOf(R.drawable.quran58_6));
                list.add(Integer.valueOf(R.drawable.quran58_7));
                list.add(Integer.valueOf(R.drawable.quran58_8));
                return list;
            case 59:
                list.add(Integer.valueOf(R.drawable.quran59_1));
                list.add(Integer.valueOf(R.drawable.quran59_2));
                list.add(Integer.valueOf(R.drawable.quran59_3));
                list.add(Integer.valueOf(R.drawable.quran59_4));
                list.add(Integer.valueOf(R.drawable.quran59_5));
                list.add(Integer.valueOf(R.drawable.quran59_6));
                list.add(Integer.valueOf(R.drawable.quran59_7));
                list.add(Integer.valueOf(R.drawable.quran59_8));
                return list;
            case 60:
                list.add(Integer.valueOf(R.drawable.quran60_1));
                list.add(Integer.valueOf(R.drawable.quran60_2));
                list.add(Integer.valueOf(R.drawable.quran60_3));
                list.add(Integer.valueOf(R.drawable.quran60_4));
                list.add(Integer.valueOf(R.drawable.quran60_5));
                list.add(Integer.valueOf(R.drawable.quran60_6));
                list.add(Integer.valueOf(R.drawable.quran60_7));
                list.add(Integer.valueOf(R.drawable.quran60_8));
                list.add(Integer.valueOf(R.drawable.quran60_9));
                list.add(Integer.valueOf(R.drawable.quran60_10));
                return list;
            case 61:
                list.add(Integer.valueOf(R.drawable.quran61_1));
                list.add(Integer.valueOf(R.drawable.quran61_2));
                list.add(Integer.valueOf(R.drawable.quran61_3));
                list.add(Integer.valueOf(R.drawable.quran61_4));
                list.add(Integer.valueOf(R.drawable.quran61_5));
                list.add(Integer.valueOf(R.drawable.quran61_6));
                list.add(Integer.valueOf(R.drawable.quran61_7));
                list.add(Integer.valueOf(R.drawable.quran61_8));
                list.add(Integer.valueOf(R.drawable.quran61_9));
                list.add(Integer.valueOf(R.drawable.quran61_10));
                return list;
            default:
                return list;
        }
    }

    public static List<String> liste10khatma(Date datesession) {
        Date date = new Date(datesession.getTime());
        List<String> list = new ArrayList<>();
        for (int i = 0; i < 10; i++) {
            date.setDate(date.getDate() + 21);
            list.add((date.getYear() + 1900) + " / " + (date.getMonth() + 1) + " / " + date.getDate());
        }
        return list;
    }

    public String getVerser1() {
        return this.verser1;
    }

    public static List<String> getListeAhzab() {
        List<String> listAhzab = new ArrayList<>();
        listAhzab.add("الحزب 1 : الم \nمن الفاتحة إلى الآية 75 من البقرة.");
        listAhzab.add("الحزب 2 : وَإِذَا لَقُوا\nمن الآية 76 إلى الآية 141 من البقرة");
        listAhzab.add("الحزب 3 : سَيَقُولُ السُّفَهَاء\n من الآية 142 إلى الآية 202 من البقرة");
        listAhzab.add("الحزب 4 : وَاذْكُرُواْ اللّه\nمن الآية 203 إلى الآية 252 من البقرة");
        listAhzab.add("الحزب 5 : تِلْكَ الرُّسُل\n من الآية 253من البقرة إلى الآية 14 من آل عمران");
        listAhzab.add("الحزب 6 : قُلْ أَؤُنَبِّئُكُم \nمن الآية 15 إلى الآية 90 من آل عمران");
        listAhzab.add("الحزب 7 : لَن تَنَالُواْ الْبِرَّ حَتَّى تُنفِقُواْ مِمَّا تُحِبُّون\nمن الآية 91 إلى الآية 170 من آل عمران");
        listAhzab.add("الحزب 8 : يَسْتَبْشِرُون\n من الآية 171 من آل عمران إلى الآية 23 من النساء");
        listAhzab.add("الحزب 9 : وَالْمُحْصَنَات\n من الآية 24 إلى الآية 85 من النساء");
        listAhzab.add("الحزب 10 : اللّهُ لا إِلَـهَ إِلاَّ هُو\n من الآية 86 إلى الآية 146 من النساء");
        listAhzab.add("الحزب 11 : لاَّ يُحِبُّ اللّهُ الْجَهْرَ بِالسُّوَءِ مِنَ الْقَوْل\n من الآية 147 من النساء إلى الآية 24 من المائدة");
        listAhzab.add("الحزب 12 : قَالَ رَجُلاَن\n من الآية 25 إلى الآية 81 من المائدة");
        listAhzab.add("الحزب 13 : لَتَجِدَن\nمن الآية 82 من المائدة إلى الآية 35 الأنعام");
        listAhzab.add("الحزب 14 : إِنَّمَا يَسْتَجِيب \nمن الآية 36 إلى الآية 110 من الأنعام");
        listAhzab.add("الحزب 15 : وَلَوْ أَنَّنَا\nمن الآية 111 من الأنعام إلى الآية 3 من الأعراف");
        listAhzab.add("الحزب 16 : فَمَا كَانَ دَعْوَاهُم\nمن الآية 4 إلى الآية 87 من الأعراف");
        listAhzab.add("الحزب 17 : قَالَ الْمَلأُ\nمن الآية 88 إلى الآية 170 من الأعراف");
        listAhzab.add("الحزب 18 : وَإِذ نَتَقْنَا الْجَبَل\nمن الآية 171 من الأعراف إلى الآية 40 من الأنفال\nالسجدة، الآية 206 من الأعراف");
        listAhzab.add("الحزب 19 : وَاعْلَمُواْ\n من الآية 41 من الأنفال إلى الآية 33 من التوبة");
        listAhzab.add("الحزب 20 : يَا أَيُّهَا الَّذِينَ آمَنُواْ إِنَّ كَثِيرا\nمن الآية 34 إلى الآية 92 من التوبة");
        listAhzab.add("الحزب 21 : إِنَّمَا السَّبِيل\nمن الآية 93 من التوبة إلى الآية 25 من يونس");
        listAhzab.add("الحزب 22 : لِّلَّذِينَ أَحْسَنُواْ الحسنى\nمن الآية 26 من يونس إلى الآية 5 من هود");
        listAhzab.add("الحزب 23 : وَمَا مِن دَآبَّة\nمن الآية 6 إلى الآية 83 من هود");
        listAhzab.add("الحزب 24 : وَإِلَى مَدْيَن\nمن الآية 84 من هود إلى الآية 52 من يوسف");
        listAhzab.add("الحزب 25 : وَمَا أُبَرِّىءُ\nمن الآية 53 من يوسف إلى الآية 18 من الرعد\nالسجدة، الآية 16 من الرعد");
        listAhzab.add("الحزب 26 : أَفَمَن يَعْلَمُ\nمن الآية 19 من الرعد إلى آخر إبراهيم");
        listAhzab.add("الحزب 27 : رُّبَمَا\nمن الآية 2 من الحجر إلى الآية 50 من النحل\nالسجدة، الآية 50 من النحل");
        listAhzab.add("الحزب 28 : وَقَالَ اللّهُ\nمن الآية 51 إلى آخر النحل");
        listAhzab.add("الحزب 29 : سُبْحَانَ\nمن الآية 1 إلى 98 من الإسراء");
        listAhzab.add("الحزب 30 : أَوَلَمْ يَرَوْاْ\nمن 99 من الإسراء إلى الآية 74 من الكهف\nالسجدة، الآية 108 من الإسراء");
        listAhzab.add("الحزب 31 : قَالَ أَلَمْ أَقُلْ لك\nمن الآية 75 من الكهف إلى الآية 8 من طه\nالسجدة، الآية 58 من مريم");
        listAhzab.add("الحزب 32 : طه\nسورة طه");
        listAhzab.add("الحزب 33 : اقْتَرَبَ لِلنَّاسِ حسابهم\nسورة الأنبياء");
        listAhzab.add("الحزب 34 : يَا أَيُّهَا النَّاس\nسورة الحج\nالسجدة، الآية 18");
        listAhzab.add("الحزب 35 : قَدْ أَفْلَح المؤمنون\nمن الآية 1 من المؤمنون إلى الآية 20 من النور");
        listAhzab.add("الحزب 36 : يَا أَيُّهَا الَّذِينَ آمَنُوا لَا تَتَّبِعُوا خُطُوَاتِ الشَّيْطَان\nمن الآية 21 من النور إلى الآية 20 من الفرقان");
        listAhzab.add("الحزب 37 : وَقَالَ الَّذِينَ لَا يَرْجُونَ\nمن الآية 21 الفرقان إلى الآية 110 من الشعراء\nالسجدة، الآية 60 من سورة الفرقان");
        listAhzab.add("الحزب 38 : قَالُوا أَنُؤْمِنُ\nمن الآية 111 من الشعراء إلى الآية 55 من النمل\nالسجدة، الآية 26 من سورة النمل");
        listAhzab.add("الحزب 39 : فَمَا كَانَ جَوَابَ\nمن الآية 56 من النمل إلى الآية 50 من القصص");
        listAhzab.add("الحزب 40 : وَلَقَدْ وَصَّلْنَا\nمن الآية 51 من القصص إلى الآية 45 من العنكبوت");
        listAhzab.add("الحزب 41 : وَلَا تُجَادِلُوا\nمن الآية 46 من العنكبوت إلى الآية 21 من لقمان");
        listAhzab.add("الحزب 42 : وَمَن يُسْلِمْ\nمن الآية 22 من لقمان إلى الآية 30 من الأحزاب\nالسجدة، الآية 15 من سورة السجدة");
        listAhzab.add("الحزب 43 : وَمَن يَقْنُتْ\nمن الآية 31 من الأحزاب إلى الآية 23 من سبا");
        listAhzab.add("الحزب 44 : قُلْ مَن يَرْزُقُكُم\nمن الآية 24 من سبا إلى الآية 27 من يس");
        listAhzab.add("الحزب 45 : وَمَا أَنزَلْنَا\nمن الآية 28 من يس إلى الآية 145 من الصافات");
        listAhzab.add("الحزب 46 : * فَنَبَذْنَاه\nمن الآية 146 من الصافات إلى الآية 31 من الزمر\nالسجدة، الآية 23 من سورة ص");
        listAhzab.add("الحزب 47 : فَمَنْ أَظْلَم\nمن الآية 32 من الزمر إلى الآية 40 من غافر");
        listAhzab.add("الحزب 48 : وَيَا قَوْمِ\nمن الآية 41 من غافر إلى الآية 46 من فصلت\nالسجدة، الآية 37 من فصلت");
        listAhzab.add("الحزب 49 : إلَيْهِ\nمن الآية 47 من فصلت إلى الآية 23 من الزخرف");
        listAhzab.add("الحزب 50 : قَالَ أَوَلَوْ \nمن الآية 24 من الزخرف إلى آخر الجاثية");
        listAhzab.add("الحزب 51 : حم\nمن الآية 1 من الأحقاف إلى الآية 17 الفتح");
        listAhzab.add("الحزب 52 : لَقَدْ رَضِيَ اللَّهُ\nمن الآية 18 من الفتح إلى الآية 30 من الذاريات");
        listAhzab.add("الحزب 53 : قَالَ فَمَا خَطْبُكُمْ\nمن الآية 31 من الذاريات إلى آخر القمر");
        listAhzab.add("الحزب 54 : الرَّحْمَنُ\nمن الرحمن إلى الحديد");
        listAhzab.add("الحزب 55 : قَدْ سَمِعَ الله\nمن المجادلة إلى الصف");
        listAhzab.add("الحزب 56 : يُسَبِّحُ \nمن الجمعة إلى التحريم");
        listAhzab.add("الحزب 57 : تبَارَكَ\nمن الملك إلى نوح");
        listAhzab.add("الحزب 58 : قُلْ أُوحِيَ\nمن الجن إلى المرسلات");
        listAhzab.add("الحزب 59 : عَمَّ \nمن النبأ إلى الطارق");
        listAhzab.add("الحزب 60 : سَبِّحِ \n من الأعلى إلى الناس");
        return listAhzab;
    }

    public void setVerser1(String verser1) {
        this.verser1 = verser1;
    }

    public String getVerser2() {
        return this.verser2;
    }

    public void setVerser2(String verser2) {
        this.verser2 = verser2;
    }

    public String getVerser3() {
        return this.verser3;
    }

    public void setVerser3(String verser3) {
        this.verser3 = verser3;
    }

    public String getJour() {
        return this.jour;
    }

    public void setJour(String jour) {
        this.jour = jour;
    }
}
