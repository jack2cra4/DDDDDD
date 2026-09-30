import '../core/app_models.dart';
import 'numbers_data.dart';

const List<String> mathTopics = <String>[
  '🔢 काउंटिंग (1 से 100)',
  '✖️ टेबल (1 से 100)',
  '➕ जोड़',
  '➖ घटाव',
  '✖️ गुणा',
  '➗ भाग',
  '🔢 भिन्न, दशमलव, प्रतिशत',
  '📐 आकृतियाँ, माप',
  '📊 बीजगणित, ज्यामिति',
];

const List<OpCard> mathAddition = <OpCard>[
  OpCard(expr: '1 + 1 = 2', answer: 2, hindi: 'एक और एक दो', english: 'One plus one is two', emoji: '➕'),
  OpCard(expr: '2 + 2 = 4', answer: 4, hindi: 'दो और दो चार', english: 'Two plus two is four', emoji: '➕'),
  OpCard(expr: '3 + 3 = 6', answer: 6, hindi: 'तीन और तीन छह', english: 'Three plus three is six', emoji: '➕'),
  OpCard(expr: '4 + 4 = 8', answer: 8, hindi: 'चार और चार आठ', english: 'Four plus four is eight', emoji: '➕'),
  OpCard(expr: '5 + 3 = 8', answer: 8, hindi: 'पाँच और तीन आठ', english: 'Five plus three is eight', emoji: '➕'),
  OpCard(expr: '6 + 4 = 10', answer: 10, hindi: 'छह और चार दस', english: 'Six plus four is ten', emoji: '➕'),
  OpCard(expr: '7 + 5 = 12', answer: 12, hindi: 'सात और पाँच बारह', english: 'Seven plus five is twelve', emoji: '➕'),
  OpCard(expr: '8 + 6 = 14', answer: 14, hindi: 'आठ और छह चौदह', english: 'Eight plus six is fourteen', emoji: '➕'),
  OpCard(expr: '9 + 7 = 16', answer: 16, hindi: 'नौ और सात सोलह', english: 'Nine plus seven is sixteen', emoji: '➕'),
  OpCard(expr: '10 + 10 = 20', answer: 20, hindi: 'दस और दस बीस', english: 'Ten plus ten is twenty', emoji: '➕'),
  OpCard(expr: '12 + 15 = 27', answer: 27, hindi: 'बारह और पंद्रह सत्ताईस', english: 'Twelve plus fifteen is twenty seven', emoji: '➕'),
  OpCard(expr: '25 + 18 = 43', answer: 43, hindi: 'पच्चीस और अठारह तैंतालीस', english: 'Twenty five plus eighteen is forty three', emoji: '➕'),
  OpCard(expr: '34 + 27 = 61', answer: 61, hindi: 'चौंतीस और सत्ताईस इकसठ', english: 'Thirty four plus twenty seven is sixty one', emoji: '➕'),
  OpCard(expr: '48 + 39 = 87', answer: 87, hindi: 'अड़तालीस और उनतालीस सत्तासी', english: 'Forty eight plus thirty nine is eighty seven', emoji: '➕'),
  OpCard(expr: '56 + 44 = 100', answer: 100, hindi: 'छप्पन और चवालीस सौ', english: 'Fifty six plus forty four is hundred', emoji: '➕'),
  OpCard(expr: '99 + 1 = 100', answer: 100, hindi: 'निन्यानवे और एक सौ', english: 'Ninety nine plus one is hundred', emoji: '➕'),
  OpCard(expr: '123 + 456 = 579', answer: 579, hindi: 'एक सौ तेईस और चार सौ छप्पन पाँच सौ उनहत्तर', english: 'One hundred twenty three plus four hundred fifty six is five hundred seventy nine', emoji: '➕'),
  OpCard(expr: '789 + 111 = 900', answer: 900, hindi: 'सात सौ निन्यासी और एक सौ ग्यारह नौ सौ', english: 'Seven hundred eighty nine plus one hundred eleven is nine hundred', emoji: '➕'),
];

const List<OpCard> mathSubtraction = <OpCard>[
  OpCard(expr: '2 - 1 = 1', answer: 1, hindi: 'दो में से एक एक', english: 'Two minus one is one', emoji: '➖'),
  OpCard(expr: '5 - 2 = 3', answer: 3, hindi: 'पाँच में से दो तीन', english: 'Five minus two is three', emoji: '➖'),
  OpCard(expr: '10 - 4 = 6', answer: 6, hindi: 'दस में से चार छह', english: 'Ten minus four is six', emoji: '➖'),
  OpCard(expr: '9 - 3 = 6', answer: 6, hindi: 'नौ में से तीन छह', english: 'Nine minus three is six', emoji: '➖'),
  OpCard(expr: '8 - 5 = 3', answer: 3, hindi: 'आठ में से पाँच तीन', english: 'Eight minus five is three', emoji: '➖'),
  OpCard(expr: '20 - 10 = 10', answer: 10, hindi: 'बीस में से दस दस', english: 'Twenty minus ten is ten', emoji: '➖'),
  OpCard(expr: '15 - 7 = 8', answer: 8, hindi: 'पंद्रह में से सात आठ', english: 'Fifteen minus seven is eight', emoji: '➖'),
  OpCard(expr: '30 - 12 = 18', answer: 18, hindi: 'तीस में से बारह अठारह', english: 'Thirty minus twelve is eighteen', emoji: '➖'),
  OpCard(expr: '50 - 27 = 23', answer: 23, hindi: 'पचास में से सत्ताईस तेईस', english: 'Fifty minus twenty seven is twenty three', emoji: '➖'),
  OpCard(expr: '45 - 18 = 27', answer: 27, hindi: 'पैंतालीस में से अठारह सत्ताईस', english: 'Forty five minus eighteen is twenty seven', emoji: '➖'),
  OpCard(expr: '100 - 1 = 99', answer: 99, hindi: 'सौ में से एक निन्यानवे', english: 'Hundred minus one is ninety nine', emoji: '➖'),
  OpCard(expr: '78 - 36 = 42', answer: 42, hindi: 'अठहत्तर में से छत्तीस बयालीस', english: 'Seventy eight minus thirty six is forty two', emoji: '➖'),
  OpCard(expr: '64 - 29 = 35', answer: 35, hindi: 'चौंसठ में से उनतीस पैंतीस', english: 'Sixty four minus twenty nine is thirty five', emoji: '➖'),
  OpCard(expr: '90 - 55 = 35', answer: 35, hindi: 'नब्बे में से पचपन पैंतीस', english: 'Ninety minus fifty five is thirty five', emoji: '➖'),
  OpCard(expr: '500 - 250 = 250', answer: 250, hindi: 'पाँच सौ में से दो सौ पचास दो सौ पचास', english: 'Five hundred minus two hundred fifty is two hundred fifty', emoji: '➖'),
  OpCard(expr: '1234 - 432 = 802', answer: 802, hindi: 'एक हज़ार दो सौ चौंतीस में से चार सौ बत्तीस आठ सौ दो', english: 'One thousand two hundred thirty four minus four hundred thirty two is eight hundred two', emoji: '➖'),
];

const List<OpCard> mathMultiply = <OpCard>[
  OpCard(expr: '2 × 1 = 2', answer: 2, hindi: 'दो गुणा एक दो', english: 'Two times one is two', emoji: '✖️'),
  OpCard(expr: '2 × 2 = 4', answer: 4, hindi: 'दो गुणा दो चार', english: 'Two times two is four', emoji: '✖️'),
  OpCard(expr: '3 × 3 = 9', answer: 9, hindi: 'तीन गुणा तीन नौ', english: 'Three times three is nine', emoji: '✖️'),
  OpCard(expr: '4 × 5 = 20', answer: 20, hindi: 'चार गुणा पाँच बीस', english: 'Four times five is twenty', emoji: '✖️'),
  OpCard(expr: '5 × 6 = 30', answer: 30, hindi: 'पाँच गुणा छह तीस', english: 'Five times six is thirty', emoji: '✖️'),
  OpCard(expr: '7 × 8 = 56', answer: 56, hindi: 'सात गुणा आठ छप्पन', english: 'Seven times eight is fifty six', emoji: '✖️'),
  OpCard(expr: '9 × 9 = 81', answer: 81, hindi: 'नौ गुणा नौ इक्यासी', english: 'Nine times nine is eighty one', emoji: '✖️'),
  OpCard(expr: '10 × 10 = 100', answer: 100, hindi: 'दस गुणा दस सौ', english: 'Ten times ten is hundred', emoji: '✖️'),
  OpCard(expr: '12 × 12 = 144', answer: 144, hindi: 'बारह गुणा बारह एक सौ चवालीस', english: 'Twelve times twelve is one hundred forty four', emoji: '✖️'),
  OpCard(expr: '15 × 4 = 60', answer: 60, hindi: 'पंद्रह गुणा चार साठ', english: 'Fifteen times four is sixty', emoji: '✖️'),
  OpCard(expr: '25 × 4 = 100', answer: 100, hindi: 'पच्चीस गुणा चार सौ', english: 'Twenty five times four is hundred', emoji: '✖️'),
  OpCard(expr: '50 × 2 = 100', answer: 100, hindi: 'पचास गुणा दो सौ', english: 'Fifty times two is hundred', emoji: '✖️'),
  OpCard(expr: '100 × 100 = 10000', answer: 10000, hindi: 'सौ गुणा सौ दस हज़ार', english: 'Hundred times hundred is ten thousand', emoji: '✖️'),
];

const List<OpCard> mathDivide = <OpCard>[
  OpCard(expr: '4 ÷ 2 = 2', answer: 2, hindi: 'चार बटे दो दो', english: 'Four divided by two is two', emoji: '➗'),
  OpCard(expr: '10 ÷ 5 = 2', answer: 2, hindi: 'दस बटे पाँच दो', english: 'Ten divided by five is two', emoji: '➗'),
  OpCard(expr: '6 ÷ 3 = 2', answer: 2, hindi: 'छह बटे तीन दो', english: 'Six divided by three is two', emoji: '➗'),
  OpCard(expr: '8 ÷ 4 = 2', answer: 2, hindi: 'आठ बटे चार दो', english: 'Eight divided by four is two', emoji: '➗'),
  OpCard(expr: '9 ÷ 3 = 3', answer: 3, hindi: 'नौ बटे तीन तीन', english: 'Nine divided by three is three', emoji: '➗'),
  OpCard(expr: '12 ÷ 4 = 3', answer: 3, hindi: 'बारह बटे चार तीन', english: 'Twelve divided by four is three', emoji: '➗'),
  OpCard(expr: '15 ÷ 5 = 3', answer: 3, hindi: 'पंद्रह बटे पाँच तीन', english: 'Fifteen divided by five is three', emoji: '➗'),
  OpCard(expr: '20 ÷ 10 = 2', answer: 2, hindi: 'बीस बटे दस दो', english: 'Twenty divided by ten is two', emoji: '➗'),
  OpCard(expr: '25 ÷ 5 = 5', answer: 5, hindi: 'पच्चीस बटे पाँच पाँच', english: 'Twenty five divided by five is five', emoji: '➗'),
  OpCard(expr: '36 ÷ 6 = 6', answer: 6, hindi: 'छत्तीस बटे छह छह', english: 'Thirty six divided by six is six', emoji: '➗'),
  OpCard(expr: '100 ÷ 10 = 10', answer: 10, hindi: 'सौ बटे दस दस', english: 'Hundred divided by ten is ten', emoji: '➗'),
  OpCard(expr: '100 ÷ 2 = 50', answer: 50, hindi: 'सौ बटे दो पचास', english: 'Hundred divided by two is fifty', emoji: '➗'),
];

const List<LessonBlock> mathFractions = <LessonBlock>[
  LessonBlock('1/2 = आधा', 'आधा', example: 'आधा केला', emoji: '½'),
  LessonBlock('1/3 = एक तिहाई', 'एक तिहाई', example: 'एक तिहाई पानी', emoji: '⅓'),
  LessonBlock('1/4 = चौथाई', 'चौथाई', example: 'चौथाई चीनी', emoji: '¼'),
  LessonBlock('1/5 = पाँचवाँ भाग', 'पाँचवाँ भाग', example: 'पाँचवाँ भाग रोटी', emoji: '⅕'),
  LessonBlock('2/4 = आधा', 'दो चौथाई = आधा', example: 'दो चौथाई = आधा', emoji: '↔️'),
  LessonBlock('3/4 = तीन चौथाई', 'तीन चौथाई', example: 'तीन चौथाई चाय', emoji: '¾'),
  LessonBlock('0.5 = शून्य दशमलव पाँच', 'आधा', example: '0.5 = 1/2', emoji: '0.5'),
  LessonBlock('0.25 = शून्य दशमलव पच्चीस', 'चौथाई', example: '0.25 = 1/4', emoji: '0.25'),
  LessonBlock('0.75 = शून्य दशमलव पचहत्तर', 'तीन चौथाई', example: '0.75 = 3/4', emoji: '0.75'),
  LessonBlock('50% = पचास प्रतिशत', 'आधा', example: '50% = 1/2 = 0.5', emoji: '50%'),
  LessonBlock('25% = पच्चीस प्रतिशत', 'चौथाई', example: '25% = 1/4 = 0.25', emoji: '25%'),
  LessonBlock('100% = सौ प्रतिशत', 'पूरा', example: '100% = 1', emoji: '100%'),
  LessonBlock('अनुपात', 'दो संख्याओं का तुलनात्मक संबंध।', example: '2:4 = 1:2', emoji: '⚖️'),
];

const List<LessonBlock> mathShapes = <LessonBlock>[
  LessonBlock('वर्ग (Square)', 'चार बराबर भुजा, चार समकोण।', example: 'खेल का मैदान वर्गाकार है।', emoji: '🟦'),
  LessonBlock('आयत (Rectangle)', 'चार भुजा, सम्मुख भुजा बराबर।', example: 'दरवाज़ा आयताकार है।', emoji: '▭'),
  LessonBlock('त्रिभुज (Triangle)', 'तीन भुजा, तीन कोण।', example: 'खेल का तीर त्रिभुज है।', emoji: '🔺'),
  LessonBlock('वृत्त (Circle)', 'गोल आकार, कोई भुजा नहीं।', example: 'गेंद गोल है।', emoji: '⭕'),
  LessonBlock('पंचभुज (Pentagon)', 'पाँच भुजा।', example: 'सड़क का चौपहिया पंचभुज है।', emoji: '⬠'),
  LessonBlock('षट्भुज (Hexagon)', 'छह भुजा।', example: 'मधुमक्खी का छत्ता षट्भुजी है।', emoji: '⬡'),
  LessonBlock('मीटर (Meter)', 'लंबाई की इकाई।', example: 'कमरा 5 मीटर लंबा है।', emoji: '📏'),
  LessonBlock('सेंटीमीटर (cm)', 'छोटी लंबाई की इकाई।', example: 'पेन्सिल 15 सेंटीमीटर है।', emoji: '📐'),
  LessonBlock('किलोमीटर (km)', 'बड़ी दूरी की इकाई।', example: 'दिल्ली से आगरा 200 किलोमीटर है।', emoji: '🛣️'),
  LessonBlock('किलोग्राम (kg)', 'वज़न की इकाई।', example: 'आम 1 किलोग्राम का है।', emoji: '⚖️'),
  LessonBlock('ग्राम (g)', 'छोटा वज़न।', example: 'चीनी 500 ग्राम है।', emoji: '🧂'),
  LessonBlock('लीटर (Litre)', 'तरल की माप।', example: 'जूस 1 लीटर है।', emoji: '🧃'),
];

const List<LessonBlock> mathAlgebra = <LessonBlock>[
  LessonBlock('चर (Variable)', 'जिसका मान बदल सकता है — जैसे x, y।', example: 'x + 5 = 10', emoji: '🔤'),
  LessonBlock('अचर (Constant)', 'जिसका मान नहीं बदलता — जैसे 5, 10।', example: '2 + 3 = 5', emoji: '🔒'),
  LessonBlock('समीकरण (Equation)', 'दोनों पक्ष बराबर हों।', example: 'x + 3 = 8', emoji: '⚖️'),
  LessonBlock('बीजगणित (Algebra)', 'अक्षरों के साथ संख्याओं का गणित।', example: '2x + 3 = 11', emoji: '🧮'),
  LessonBlock('रेखा (Line)', 'बिना मोटाई की सीधी रेखा।', example: 'कॉपी की मेज़ पर।', emoji: '➖'),
  LessonBlock('कोण (Angle)', 'दो रेखाओं के बीच का कोण।', example: '90° समकोण', emoji: '📐'),
  LessonBlock('त्रिभुज (Triangle)', 'तीन भुजा और तीन कोण।', example: 'त्रिभुज का योग 180° है।', emoji: '🔺'),
  LessonBlock('sin', 'लम्बाई / कर्ण — सामने का कोण।', example: 'sin 30° = 1/2', emoji: '📐'),
  LessonBlock('cos', 'आधार / कर्ण — समीपवर्ती कोण।', example: 'cos 60° = 1/2', emoji: '📐'),
  LessonBlock('tan', 'लम्बाई / आधार — सामने ÷ आधार।', example: 'tan 45° = 1', emoji: '📐'),
  LessonBlock('लघुगणक', 'घात के उलटा — जैसे log₂8 = 3', example: '2³ = 8 इसलिए log₂8 = 3', emoji: '🧠'),
];

List<NumberTable> allTables() => buildTables(List<int>.generate(100, (i) => i + 1));

List<CountItem> allCounts() => buildCounts();
