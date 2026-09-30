import '../core/app_models.dart';
import 'numbers_data.dart';

const List<UrduLetter> urduAlphabet = <UrduLetter>[
  UrduLetter(name: 'الف', sound: 'alif', isolated: 'ا', initial: 'ا', medial: 'ـا', finalForm: 'ـا', words: <String>['انسان', 'اُمیر'], emoji: '🧍'),
  UrduLetter(name: 'بے', sound: 'be', isolated: 'ب', initial: 'بـ', medial: 'ـبـ', finalForm: 'ـب', words: <String>['بازار', 'بیٹا'], emoji: '🏪'),
  UrduLetter(name: 'پے', sound: 'pe', isolated: 'پ', initial: 'پـ', medial: 'ـپـ', finalForm: 'ـپ', words: <String>['پانی', 'پھول'], emoji: '🌊'),
  UrduLetter(name: 'تے', sound: 'te', isolated: 'ت', initial: 'تـ', medial: 'ـتـ', finalForm: 'ـت', words: <String>['تارا', 'تالاب'], emoji: '⭐'),
  UrduLetter(name: 'ٹے', sound: 'tte', isolated: 'ٹ', initial: 'ٹـ', medial: 'ـٹـ', finalForm: 'ـٹ', words: <String>['ٹوکری', 'ٹرک'], emoji: '🧺'),
  UrduLetter(name: 'ثے', sound: 'se', isolated: 'ث', initial: 'ثـ', medial: 'ـثـ', finalForm: 'ـث', words: <String>['ثعلب', 'ثُور'], emoji: '🦊'),
  UrduLetter(name: 'جیم', sound: 'jeem', isolated: 'ج', initial: 'جـ', medial: 'ـجـ', finalForm: 'ـج', words: <String>['جگہ', 'جملہ'], emoji: '📍'),
  UrduLetter(name: 'چے', sound: 'che', isolated: 'چ', initial: 'چـ', medial: 'ـچـ', finalForm: 'ـچ', words: <String>['چائے', 'چراغ'], emoji: '🫖'),
  UrduLetter(name: 'حے', sound: 'he', isolated: 'ح', initial: 'حـ', medial: 'ـحـ', finalForm: 'ـح', words: <String>['حکمت', 'حجرہ'], emoji: '🪨'),
  UrduLetter(name: 'خے', sound: 'khe', isolated: 'خ', initial: 'خـ', medial: 'ـخـ', finalForm: 'ـخ', words: <String>['خوش', 'خام'], emoji: '😊'),
  UrduLetter(name: 'دال', sound: 'daal', isolated: 'د', initial: 'دـ', medial: 'نہیں', finalForm: 'نہیں', words: <String>['دوست', 'دروازہ'], emoji: '🚪'),
  UrduLetter(name: 'ڈال', sound: 'ddal', isolated: 'ڈ', initial: 'ڈـ', medial: 'نہیں', finalForm: 'نہیں', words: <String>['ڈھیر', 'ڈک'], emoji: '🪣'),
  UrduLetter(name: 'ذال', sound: 'dhaal', isolated: 'ذ', initial: 'ذـ', medial: 'نہیں', finalForm: 'نہیں', words: <String>['ذکر', 'ذرت'], emoji: '🗣️'),
  UrduLetter(name: 'رے', sound: 're', isolated: 'ر', initial: 'رـ', medial: 'نہیں', finalForm: 'نہیں', words: <String>['راستہ', 'رنگ'], emoji: '🛣️'),
  UrduLetter(name: 'ڑے', sound: 'rre', isolated: 'ڑ', initial: 'ڑـ', medial: 'نہیں', finalForm: 'نہیں', words: <String>['ڑھی', 'ڑول'], emoji: '🪘'),
  UrduLetter(name: 'زے', sound: 'ze', isolated: 'ز', initial: 'زـ', medial: 'نہیں', finalForm: 'نہیں', words: <String>['زیادہ', 'زمین'], emoji: '🌍'),
  UrduLetter(name: 'ژے', sound: 'zhe', isolated: 'ژ', initial: 'ژـ', medial: 'نہیں', finalForm: 'نہیں', words: <String>['ژنگر', 'ژاؤ'], emoji: '🦁'),
  UrduLetter(name: 'سین', sound: 'seen', isolated: 'س', initial: 'سـ', medial: 'ـسـ', finalForm: 'ـس', words: <String>['سورج', 'سکول'], emoji: '☀️'),
  UrduLetter(name: 'شین', sound: 'sheen', isolated: 'ش', initial: 'شـ', medial: 'ـشـ', finalForm: 'ـش', words: <String>['شکریہ', 'شیروں'], emoji: '🙏'),
  UrduLetter(name: 'صاد', sound: 'saad', isolated: 'ص', initial: 'صـ', medial: 'ـصـ', finalForm: 'ـص', words: <String>['صباح', 'صورت'], emoji: '🌅'),
  UrduLetter(name: 'ضاد', sound: 'daad', isolated: 'ض', initial: 'ضـ', medial: 'ـضـ', finalForm: 'ـض', words: <String>['ضبط', 'ضد'], emoji: '📏'),
  UrduLetter(name: 'طے', sound: 'tay', isolated: 'ط', initial: 'طـ', medial: 'ـطـ', finalForm: 'ـط', words: <String>['طیارہ', 'طور'], emoji: '✈️'),
  UrduLetter(name: 'ظے', sound: 'zay', isolated: 'ظ', initial: 'ظـ', medial: 'ـظـ', finalForm: 'ـظ', words: <String>['ظاہر', 'ظلم'], emoji: '👁️'),
  UrduLetter(name: 'عین', sound: 'ain', isolated: 'ع', initial: 'عـ', medial: 'ـعـ', finalForm: 'ـع', words: <String>['عصر', 'عینک'], emoji: '🕰️'),
  UrduLetter(name: 'غین', sound: 'ghain', isolated: 'غ', initial: 'غـ', medial: 'ـغـ', finalForm: 'ـغ', words: <String>['غصہ', 'غنڈہ'], emoji: '😔'),
  UrduLetter(name: 'فے', sound: 'fe', isolated: 'ف', initial: 'فـ', medial: 'ـفـ', finalForm: 'ـف', words: <String>['فتح', 'فصلہ'], emoji: '📚'),
  UrduLetter(name: 'قاف', sound: 'qaaf', isolated: 'ق', initial: 'قـ', medial: 'ـقـ', finalForm: 'ـق', words: <String>['قلم', 'قلب'], emoji: '🖊️'),
  UrduLetter(name: 'کاف', sound: 'kaaf', isolated: 'ک', initial: 'کـ', medial: 'ـکـ', finalForm: 'ـک', words: <String>['کتاب', 'کام'], emoji: '📕'),
  UrduLetter(name: 'گاف', sound: 'gaaf', isolated: 'گ', initial: 'گـ', medial: 'ـگـ', finalForm: 'ـگ', words: <String>['گھر', 'گلاب'], emoji: '🏠'),
  UrduLetter(name: 'لام', sound: 'laam', isolated: 'ل', initial: 'لـ', medial: 'ـلـ', finalForm: 'ـل', words: <String>['لالہ', 'لکھا'], emoji: '🌺'),
  UrduLetter(name: 'میم', sound: 'meem', isolated: 'م', initial: 'مـ', medial: 'ـمـ', finalForm: 'ـم', words: <String>['مکان', 'میل'], emoji: '🏠'),
  UrduLetter(name: 'نون', sound: 'noon', isolated: 'ن', initial: 'نـ', medial: 'ـنـ', finalForm: 'ـن', words: <String>['نہر', 'نماز'], emoji: '🌊'),
  UrduLetter(name: 'واو', sound: 'waw', isolated: 'و', initial: 'وـ', medial: 'نہیں', finalForm: 'نہیں', words: <String>['وقت', 'ورزش'], emoji: '⏰'),
  UrduLetter(name: 'ہے', sound: 'heh', isolated: 'ہ', initial: 'ہـ', medial: 'ـہـ', finalForm: 'ـہ', words: <String>['ہم', 'ہندوستان'], emoji: '🇮🇳'),
  UrduLetter(name: 'ہمزہ', sound: 'hamza', isolated: 'ء', initial: 'ءـ', medial: 'ـءـ', finalForm: 'ـء', words: <String>['سائل', 'مسئلہ'], emoji: '❓'),
  UrduLetter(name: 'یہ', sound: 'ye', isolated: 'ی', initial: 'یـ', medial: 'ـیـ', finalForm: 'ـی', words: <String>['یہ', 'یوم'], emoji: '👉'),
  UrduLetter(name: 'ھے', sound: 'do chashmi', isolated: 'ھ', initial: 'ھـ', medial: 'ـھـ', finalForm: 'ـھ', words: <String>['ھڈکی', 'محبت'], emoji: '💗'),
  UrduLetter(name: 'ے', sound: 'bare ye', isolated: 'ے', initial: 'نہیں', medial: 'نہیں', finalForm: 'نہیں', words: <String>['ہے', 'کے'], emoji: '🔚'),
];

const List<String> urduShapes = <String>[
  'اکیلا حرف',
  'شروع میں آتا ہے',
  'بیچ میں آتا ہے',
  'آخر میں آتا ہے',
];

const Map<String, List<WordItem>> urduWords = <String, List<WordItem>>{
  '۱ تا ۲ لفظ': <WordItem>[
    WordItem('آب', 'پانی', sentence: 'مجھے پانی چاہیے۔', emoji: '💧'),
    WordItem('دل', 'دل', sentence: 'میرا دل بڑا ہے۔', emoji: '💗'),
    WordItem('گھر', 'گھر', sentence: 'یہ میرا گھر ہے۔', emoji: '🏠'),
    WordItem('نام', 'نام', sentence: 'میرا نام راحل ہے۔', emoji: '🏷️'),
    WordItem('کام', 'کام', sentence: 'میں کام کرتا ہوں۔', emoji: '🛠️'),
    WordItem('وقت', 'وقت', sentence: 'وقت بہت قیمتی ہے۔', emoji: '⏰'),
    WordItem('پھول', 'پھول', sentence: 'پھول خوشبو دیتا ہے۔', emoji: '🌸'),
  ],
  '۳ تا ۴ لفظ': <WordItem>[
    WordItem('میرا گھر', 'میرے کا گھر', sentence: 'میرا گھر پاکستان میں ہے۔', emoji: '🏡'),
    WordItem('یہ میرا گھر ہے', 'یہ گھر میرا ہے', sentence: 'یہ میرا گھر ہے۔', emoji: '🏠'),
    WordItem('میں سکول جاتا ہوں', 'روز اسکول جانا', sentence: 'میں روز سکول جاتا ہوں۔', emoji: '🏫'),
    WordItem('پانی پیتا ہوں', 'پانی پینا', sentence: 'میں صبح پانی پیتا ہوں۔', emoji: '🥤'),
    WordItem('کتاب پڑھتا ہوں', 'کتاب پڑھنا', sentence: 'میں کتاب پڑھتا ہوں۔', emoji: '📖'),
    WordItem('ماں کو سلام', 'ماں کو سلام کرنا', sentence: 'ہر روز ماں کو سلام کرتا ہوں۔', emoji: '🙏'),
  ],
  '۵ سے ۱۰ لفظ': <WordItem>[
    WordItem('ہر روز صبح اٹھ کر کھانا کھاتا ہوں', 'صبح اٹھ کر ناشتہ', sentence: 'ہر روز صبح اٹھ کر کھانا کھاتا ہوں۔', emoji: '🌅'),
    WordItem('میں اپنے والدین کا احترام کرتا ہوں', 'ماں باپ کا احترام', sentence: 'میں اپنے والدین کا احترام کرتا ہوں۔', emoji: '👨‍👩‍👦'),
    WordItem('ہمارا ملک پاکستان ہے', 'وطن پاکستان', sentence: 'ہمارا ملک پاکستان ہے۔', emoji: '🇵🇰'),
    WordItem('آپ کا شکریہ بہت زیادہ ہے', 'بہت زیادہ شکریہ', sentence: 'آپ کا شکریہ بہت زیادہ ہے۔', emoji: '🙏'),
    WordItem('مجھے اردی زبان بھت پسند ہے', 'اردو زبان پسند', sentence: 'مجھے اردی زبان بہت پسند ہے۔', emoji: '📖'),
    WordItem('کھانا کھانے کے بعد ہاتھ دھو لیں', 'کھانے کے بعد صفائی', sentence: 'کھانا کھانے کے بعد ہاتھ دھو لیں۔', emoji: '🧼'),
  ],
};

const List<String> urduSentences = <String>[
  'یہ میرا گھر ہے۔',
  'میں ہندوستان میں رہتا ہوں۔',
  'میں روز صبح اٹھتا ہوں۔',
  'ماں نے کھانا بنایا۔',
  'میں سکول جاتا ہوں۔',
  'یہ کتاب بہت اچھی ہے۔',
  'میں نے پانی پیا۔',
  'آپ کا شکریہ۔',
  'معاف کیجیے گا۔',
  'یہ کام بہت مشکل ہے۔',
  'میں تم سے محبت کرتا ہوں۔',
  'آج دھن سنی ہے۔',
  'کل بارش ہوگی۔',
  'مری ماں بہت اچھی ہے۔',
  'ہم سب مل کر کام کریں گے۔',
  'وقت بہت قیمتی ہے۔',
  'محنت کا پھل میٹھا ہوتا ہے۔',
  'پڑھائی سے آگے بڑھتے رہیں۔',
  'یہ میری کتاب ہے۔',
  'میں گھر جا رہا ہوں۔',
];

const List<LessonBlock> urduGrammar = <LessonBlock>[
  LessonBlock('اسم', 'کسی کا نام — رحمہ، گھر، کتاب۔', example: 'یہ میرا گھر ہے۔', emoji: '🏷️'),
  LessonBlock('ضمیر', 'اسم کی جگہ آنے والا لفظ — میں، تم، وہ، ہم۔', example: 'وہ میرا بھائی ہے۔', emoji: '👤'),
  LessonBlock('صفت', 'اسم کی خوبی بتانے والا لفظ — بڑا، اچھا، سرخ۔', example: 'میرا چھوٹا بھائی ہے۔', emoji: '🎨'),
  LessonBlock('فعل', 'کام کا بیان — جانا، آنا، کھانا، پڑھنا۔', example: 'میں سکول جاتا ہوں۔', emoji: '🏃'),
  LessonBlock('تعداد', 'لفظ ایک ہو یا بہت سے۔', example: 'لڑکی / لڑکیاں', emoji: '1️⃣'),
  LessonBlock('جنس', 'اسم مردانا، مؤنث یا بے جنس ہوتا ہے۔', example: 'ماں (مؤنث)، گھر (بے جنس)', emoji: '♀️'),
  LessonBlock('زمانہ', 'کام کے وقت کا بیان — اب، گزشتہ، آئندہ۔', example: 'میں جاتا ہوں / گیا / جاؤں گا', emoji: '⏰'),
  LessonBlock('حرف جر', 'جگہ، وقت یا سمت دکھانے والا لفظ — میں، پر، سے، تک۔', example: 'کتاب میز پر ہے۔', emoji: '📍'),
  LessonBlock('حرف ربط', 'دو جملے ملانے والا لفظ — اور، لیکن، یا، کیونکہ۔', example: 'وہ تھک گیا لیکن پڑھتا رہا۔', emoji: '🔗'),
  LessonBlock('جوڑی الفاظ', 'دو لفظ مل کر نئے معنی بنائیں۔', example: 'چلو + گئے = چلے گئے', emoji: '🧩'),
  LessonBlock('محاورات', 'مکمل مطلب دینے والی چھوٹی باتیں۔', example: 'ہاتھ سے آنکھ', emoji: '💬'),
  LessonBlock('تھوک اور بھولیاں', 'مجلسوں اور مشہور جملے۔', example: 'جہاں چاہے وہاں رہے', emoji: '🗣️'),
  LessonBlock('انشا', 'شاعری کا خوبصورت اثر۔', example: 'غزل، نظم، مثنوی', emoji: '🎵'),
  LessonBlock('مکتوبہ لکھائی', 'کسی کو لکھا گیا خط۔', example: 'محترم بھائی، السلام علیکم۔', emoji: '✉️'),
  LessonBlock('مضمون', 'کسی موضوع پر لکھا گیا انشا۔', example: 'میرے ملک کے بارے میں', emoji: '📄'),
  LessonBlock('کہانی', ' واقعات کا ترتیب سے بیان۔', example: 'چنگاری کا کینجی', emoji: '📖'),
];

const Map<String, List<WordItem>> urduDaily = <String, List<WordItem>>{
  'سلام و تعارف': <WordItem>[
    WordItem('سلام', 'السلام علیکم', sentence: 'سلام! کیسے ہیں؟', emoji: '🤝'),
    WordItem('السلام علیکم', 'مسلم سلام', sentence: 'السلام علیکم ورحمۃ اللہ۔', emoji: '🕌'),
    WordItem('کیسے ہیں', 'حال پوچھنا', sentence: 'آپ کیسے ہیں؟', emoji: '❓'),
    WordItem('اچھے ہیں', 'اچھی حالت', sentence: 'میں ٹھیک ہوں، شکریہ۔', emoji: '😊'),
    WordItem('خدا حافظ', 'الوداع', sentence: 'خدا حافظ!', emoji: '👋'),
  ],
  'شکریہ و معذرت': <WordItem>[
    WordItem('شکریہ', 'شکریہ ادا کرنا', sentence: 'بہت شکریہ۔', emoji: '🙏'),
    WordItem('جزاک اللہ خیر', 'اللہ آپ کو بھلا دے', sentence: 'جزاک اللہ خیر۔', emoji: '💐'),
    WordItem('معاف کیجیے', 'معافی مانگنا', sentence: 'معاف کیجیے، میری غلطی ہوئی۔', emoji: '😅'),
    WordItem('معذرت', 'معذرت لینا', sentence: 'میں معذرت چاہتا ہوں۔', emoji: '🕊️'),
    WordItem('کوئی بات نہیں', 'کوئی گھٹا نہیں', sentence: 'کوئی بات نہیں۔', emoji: '👌'),
  ],
  'سوال جواب': <WordItem>[
    WordItem('آپ کا نام کیا ہے', 'نام پوچھنا', sentence: 'آپ کا نام کیا ہے؟', emoji: '❓'),
    WordItem('میرا نام', 'اپنا نام', sentence: 'میرا نام احمد ہے۔', emoji: '🏷️'),
    WordItem('کہاں رہتے ہیں', 'رہائش کا پتہ', sentence: 'آپ کہاں رہتے ہیں؟', emoji: '📍'),
    WordItem('کب آئیں گے', 'آنے کا وقت', sentence: 'آپ کب آئیں گے؟', emoji: '📅'),
    WordItem('یہ کتنا ہے', 'قیمت پوچھنا', sentence: 'یہ کتنا ہے؟', emoji: '💰'),
    WordItem('مجھے سمجھ نہیں آیا', 'نہ سمجھ آنا', sentence: 'مجھے سمجھ نہیں آیا۔', emoji: '🤔'),
  ],
  'خاندان': <WordItem>[
    WordItem('گھر', 'رہائش', sentence: 'ہمارا گھر بڑا ہے۔', emoji: '🏠'),
    WordItem('والد', 'ابو', sentence: 'والد جا چکے ہیں۔', emoji: '👨'),
    WordItem('والدہ', 'امی', sentence: 'والدہ نے کھانا بنایا۔', emoji: '👩'),
    WordItem('بھائی', 'بھائی', sentence: 'میرا ایک بھائی ہے۔', emoji: '👦'),
    WordItem('بہن', 'بہن', sentence: 'بہن پڑھتی ہے۔', emoji: '👧'),
    WordItem('دادا', 'دادا', sentence: 'دادا کی کہانیاں سنائیں۔', emoji: '👴'),
    WordItem('نانی', 'نانی', sentence: 'نانی کو پانی پلائیں۔', emoji: '👵'),
    WordItem('خاندان', 'خاندان', sentence: 'خاندان ساتھ بیٹھا ہے۔', emoji: '👨‍👩‍👧'),
  ],
  'روزمرہ الفاظ': <WordItem>[
    WordItem('کھانا', 'خوراک', sentence: 'وقت پر کھانا کھائیں۔', emoji: '🍽️'),
    WordItem('پانی', 'پانی', sentence: 'دن میں پانی پئیں۔', emoji: '💧'),
    WordItem('گھر', 'رہائش', sentence: 'گھر جائیں۔', emoji: '🏠'),
    WordItem('سکول', 'اسکول', sentence: 'بچے سکول جاتے ہیں۔', emoji: '🏫'),
    WordItem('کام', 'کام', sentence: 'کام وقت پر شروع کریں۔', emoji: '🛠️'),
    WordItem('سونا', 'سونا', sentence: 'وقت پر سونا چاہیے۔', emoji: '😴'),
    WordItem('محبت', 'محبت', sentence: 'محبت سے کام کریں۔', emoji: '❤️'),
    WordItem('دوست', 'دوست', sentence: 'دوست میں مدد کرتا ہے۔', emoji: '🤝'),
  ],
};

String urTableLine(int n, int m) {
  const mult = <String>[
    'ایک', 'دو', 'تین', 'چار', 'پانچ', 'چھ', 'سات', 'آٹھ', 'نو', 'دس',
  ];
  return '${urName(n)} ${mult[m - 1]} ${urName(n * m)}';
}

String urTableLineEn(int n, int m) =>
    '${enName(n)} times ${enName(m)} is ${enName(n * m).toLowerCase()}';

List<NumberTable> urduTables() =>
    buildTables(List<int>.generate(100, (i) => i + 1))
        .map((t) => NumberTable(
              t.n,
              t.rows
                  .map((r) => TableRow(r.mul, r.ans, urTableLine(t.n, r.mul),
                      urTableLineEn(t.n, r.mul)))
                  .toList(),
            ))
        .toList();

List<CountItem> urduCounts() => List<CountItem>.generate(
      100,
      (i) => CountItem(i + 1, urName(i + 1), '', '🔢'),
    );
