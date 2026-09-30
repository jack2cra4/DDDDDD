import '../core/app_models.dart';

const List<String> hindiNum = <String>[
  'एक', 'दो', 'तीन', 'चार', 'पाँच', 'छह', 'सात', 'आठ', 'नौ', 'दस',
  'ग्यारह', 'बारह', 'तेरह', 'चौदह', 'पंद्रह', 'सोलह', 'सत्रह', 'अठारह', 'उन्नीस', 'बीस',
  'इक्कीस', 'बाईस', 'तेईस', 'चौबीस', 'पच्चीस', 'छब्बीस', 'सत्ताईस', 'अट्ठाईस', 'उनतीस', 'तीस',
  'इकतीस', 'बत्तीस', 'तैंतीस', 'चौंतीस', 'पैंतीस', 'छत्तीस', 'सैंतीस', 'अड़तीस', 'उनतालीस', 'चालीस',
  'इकतालीस', 'बयालीस', 'तैंतालीस', 'चवालीस', 'पैंतालीस', 'छियालीस', 'सैंतालीस', 'अड़तालीस', 'उनचास', 'पचास',
  'इक्यावन', 'बावन', 'तिरेपन', 'चौवन', 'पचपन', 'छप्पन', 'सत्तावन', 'अट्ठावन', 'उनसठ', 'साठ',
  'इकसठ', 'बासठ', 'तिरसठ', 'चौंसठ', 'पैंसठ', 'छियासठ', 'सड़सठ', 'अड़सठ', 'उनहत्तर', 'सत्तर',
  'इकहत्तर', 'बहत्तर', 'तिहत्तर', 'चौहत्तर', 'पचहत्तर', 'छिहत्तर', 'सतहत्तर', 'अठहत्तर', 'उनासी', 'अस्सी',
  'इक्यासी', 'बयासी', 'तिरासी', 'चौरासी', 'पचासी', 'छियासी', 'सत्तासी', 'अट्ठासी', 'नवासी', 'नब्बे',
  'इक्यानवे', 'बानवे', 'तिरानवे', 'चौरानवे', 'पचानवे', 'छियानवे', 'सत्तानवे', 'अट्ठानवे', 'निन्यानवे', 'सौ',
];

const List<String> englishNum = <String>[
  'One', 'Two', 'Three', 'Four', 'Five', 'Six', 'Seven', 'Eight', 'Nine', 'Ten',
  'Eleven', 'Twelve', 'Thirteen', 'Fourteen', 'Fifteen', 'Sixteen', 'Seventeen', 'Eighteen', 'Nineteen', 'Twenty',
  'Twenty One', 'Twenty Two', 'Twenty Three', 'Twenty Four', 'Twenty Five', 'Twenty Six', 'Twenty Seven', 'Twenty Eight', 'Twenty Nine', 'Thirty',
  'Thirty One', 'Thirty Two', 'Thirty Three', 'Thirty Four', 'Thirty Five', 'Thirty Six', 'Thirty Seven', 'Thirty Eight', 'Thirty Nine', 'Forty',
  'Forty One', 'Forty Two', 'Forty Three', 'Forty Four', 'Forty Five', 'Forty Six', 'Forty Seven', 'Forty Eight', 'Forty Nine', 'Fifty',
  'Fifty One', 'Fifty Two', 'Fifty Three', 'Fifty Four', 'Fifty Five', 'Fifty Six', 'Fifty Seven', 'Fifty Eight', 'Fifty Nine', 'Sixty',
  'Sixty One', 'Sixty Two', 'Sixty Three', 'Sixty Four', 'Sixty Five', 'Sixty Six', 'Sixty Seven', 'Sixty Eight', 'Sixty Nine', 'Seventy',
  'Seventy One', 'Seventy Two', 'Seventy Three', 'Seventy Four', 'Seventy Five', 'Seventy Six', 'Seventy Seven', 'Seventy Eight', 'Seventy Nine', 'Eighty',
  'Eighty One', 'Eighty Two', 'Eighty Three', 'Eighty Four', 'Eighty Five', 'Eighty Six', 'Eighty Seven', 'Eighty Eight', 'Eighty Nine', 'Ninety',
  'Ninety One', 'Ninety Two', 'Ninety Three', 'Ninety Four', 'Ninety Five', 'Ninety Six', 'Ninety Seven', 'Ninety Eight', 'Ninety Nine', 'Hundred',
];

const List<String> urduNum = <String>[
  'ایک', 'دو', 'تین', 'چار', 'پانچ', 'چھ', 'سات', 'آٹھ', 'نو', 'دس',
  'گیارہ', 'بارہ', 'تیرہ', 'چودہ', 'پندرہ', 'سولہ', 'سترہ', 'اٹھارہ', 'انیس', 'بیس',
  'اکیس', 'بائیس', 'تئیس', 'چوبیس', 'پچیس', 'چببیس', 'ستئیس', 'اٹھائیس', 'تیس', 'تیس',
  'اکتیس', 'بتیس', 'تہتیس', 'چونتیس', 'پنتیس', 'چھتیس', 'سنتیس', 'اٹھتیس', 'چالیس', 'چالیس',
  'اکتالیس', 'بیالیس', 'تینتالیس', 'چوالیس', 'पैंतालीس', 'چھیالیس', 'ساتتالیس', 'اٹھتالیس', 'اچاس', 'پچاس',
  'اکاون', 'باون', 'ترپن', 'چاورن', 'پچپن', 'چھپن', 'ستاون', 'اٹھاون', 'اونساٹھ', 'ساٹھ',
  'اکساٹھ', 'باساٹھ', 'ترساٹھ', 'چونساٹھ', 'پنساٹھ', 'چھیاساٹھ', 'سڑساٹھ', 'اٹھساٹھ', 'ونساٹھ', 'ستر',
  'اکہتر', 'بہتر', 'تیہتر', 'چوہتر', 'پچہتر', 'چھہتر', 'ساتہتر', 'اٹھہتر', 'وناسی', 'اسی',
  'اکیاسی', 'بیاسی', 'تراسی', 'چوراسی', 'پچاسی', 'چھیاسی', 'ستاسی', 'اٹھاسی', 'نواسی', 'نوے',
  'اکیانوے', 'بانوے', 'ترانوے', 'چورانوے', 'پچانوے', 'چھیانوے', 'ستانوے', 'اٹھانوے', 'ننیانوے', 'سو',
];

String hiName(int n) => hindiNum[(n - 1).clamp(0, 99)];
String enName(int n) => englishNum[(n - 1).clamp(0, 99)];
String urName(int n) => urduNum[(n - 1).clamp(0, 99)];

const List<String> hiMultiplier = <String>[
  'एकम', 'दूनी', 'तिया', 'चौके', 'पंजे', 'छक्के', 'सत्ते', 'अट्ठे', 'नौवें', 'दहाए',
];

const List<String> hiOp = <String>['जोड़', 'घटाव', 'गुणा', 'भाग'];

const List<String> fruitEmoji = <String>[
  '', '', '🍎', '🍐', '🍊', '🍋', '🍌', '🍉', '🍇', '🍓',
  '🫐', '🍈', '🍒', '🍑', '🥭', '🍍', '🥥', '🥝', '🍅', '🍆',
  '🥑', '🥦', '🥬', '🥒', '🌶️', '🌽', '🥕', '🧄', '🧅', '🥔',
  '🍠', '🥐', '🥯', '🍞', '🥖', '🧀', '🥚', '🍳', '🥞', '🧇',
  '🥓', '🍔', '🍟', '🍕', '🌭', '🥪', '🌮', '🌯', '🧆', '🥘',
  '🍝', '🍜', '🍲', '🍣', '🍱', '🥟', '🍤', '🍙', '🍚', '🍘',
  '🍥', '🥠', '🥮', '🍢', '🍡', '🍧', '🍨', '🍦', '🥧', '🧁',
  '🍰', '🎂', '🍮', '🍭', '🍬', '🍫', '🍿', '🍩', '🍪', '🌰',
  '🍯', '🥛', '🍼', '☕', '🍵', '🧃', '🥤', '🍶', '🍺', '🍻',
  '🥂', '🍷', '🥃', '🍸', '🍹', '🧉', '🍾', '🧊', '🫗',
];

String emojiFor(int n) =>
    (n >= 0 && n < fruitEmoji.length && fruitEmoji[n].isNotEmpty)
        ? fruitEmoji[n]
        : (n % 7 == 0 ? '🍎' : '🔢');

List<CountItem> buildCounts() {
  return List<CountItem>.generate(
    100,
    (i) => CountItem(i + 1, hiName(i + 1), enName(i + 1), emojiFor(i + 1)),
  );
}

String hiTableLine(int n, int m) {
  final mi = (m - 1).clamp(0, 9);
  return '${hiName(n)} ${hiMultiplier[mi]} ${hiName(n * m)}';
}

String enTableLine(int n, int m) =>
    '${enName(n)} ${m == 1 ? 'one' : _plural(m)} are ${enName(n * m).toLowerCase()}';

String _plural(int m) {
  if (m == 1) return 'one';
  if (m >= 3 && m <= 10) {
    const map = <int, String>{
      3: 'threes',
      4: 'fours',
      5: 'fives',
      6: 'sixes',
      7: 'sevens',
      8: 'eights',
      9: 'nines',
      10: 'tens',
    };
    return map[m] ?? '${m}s';
  }
  return '${m}s';
}

NumberTable buildTable(int n) {
  return NumberTable(
    n,
    List<TableRow>.generate(10, (i) {
      final m = i + 1;
      return TableRow(m, n * m, hiTableLine(n, m), enTableLine(n, m));
    }),
  );
}

List<NumberTable> buildTables(List<int> ns) => ns.map(buildTable).toList();
