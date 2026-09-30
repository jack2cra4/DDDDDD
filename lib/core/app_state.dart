import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app_models.dart';
import 'tts_service.dart';

class AppState extends ChangeNotifier {
  AppState(this._prefs);

  final SharedPreferences _prefs;

  ThemeMode _themeMode = ThemeMode.system;
  double _textScale = 1.0;
  double _voiceRate = 0.48;
  bool _repeat = false;
  bool _signedIn = false;
  String _displayName = '';
  String _phone = '';
  String _email = '';
  final Set<String> _done = <String>{};
  final Map<String, int> _quizBest = <String, int>{};
  final Set<String> _planDays = <String>{};
  int _streak = 0;
  String _lastActive = '';

  ThemeMode get themeMode => _themeMode;
  double get textScale => _textScale;
  double get voiceRate => _voiceRate;
  bool get repeat => _repeat;
  bool get signedIn => _signedIn;
  bool get guest => _signedIn && _phone.isEmpty && _email.isEmpty;
  String get displayName => _displayName;
  String get phone => _phone;
  String get email => _email;
  Set<String> get done => _done;
  int get streak => _streak;
  int get doneTotal => _done.length;

  int best(String key) => _quizBest[key] ?? 0;

  bool isDone(String id) => _done.contains(id);

  int doneCount(String prefix) =>
      _done.where((e) => e.startsWith(prefix)).length;

  double progressOf(Iterable<String> ids) {
    final list = ids.toList();
    if (list.isEmpty) return 0;
    final n = list.where(_done.contains).length;
    return n / list.length;
  }

  static Future<AppState> load() async {
    final p = await SharedPreferences.getInstance();
    final s = AppState(p);
    s._themeMode = ThemeMode.values[p.getInt('themeMode') ?? 0];
    s._textScale = p.getDouble('textScale') ?? 1.0;
    s._voiceRate = p.getDouble('voiceRate') ?? 0.48;
    s._repeat = p.getBool('repeat') ?? false;
    s._signedIn = p.getBool('signedIn') ?? false;
    s._displayName = p.getString('displayName') ?? '';
    s._phone = p.getString('phone') ?? '';
    s._email = p.getString('email') ?? '';
    s._done.addAll(p.getStringList('done') ?? const <String>[]);
    final best = p.getString('quizBest') ?? '';
    if (best.isNotEmpty) {
      for (final pair in best.split(',')) {
        final i = pair.indexOf(':');
        if (i > 0) {
          s._quizBest[pair.substring(0, i)] =
              int.tryParse(pair.substring(i + 1)) ?? 0;
        }
      }
    }
    s._planDays.addAll(p.getStringList('planDays') ?? const <String>[]);
    s._streak = p.getInt('streak') ?? 0;
    s._lastActive = p.getString('lastActive') ?? '';
    s.touchStreak();
    return s;
  }

  void _saveDone() => _prefs.setStringList('done', _done.toList());

  void setThemeMode(ThemeMode m) {
    _themeMode = m;
    _prefs.setInt('themeMode', m.index);
    notifyListeners();
  }

  void setTextScale(double v) {
    _textScale = v.clamp(0.9, 1.7);
    _prefs.setDouble('textScale', _textScale);
    notifyListeners();
  }

  void setVoiceRate(double v) {
    _voiceRate = v.clamp(0.2, 1.0);
    _prefs.setDouble('voiceRate', _voiceRate);
    notifyListeners();
  }

  void setRepeat(bool v) {
    _repeat = v;
    _prefs.setBool('repeat', v);
    notifyListeners();
  }

  void signIn({String? name, String? phone, String? email, bool guest = false}) {
    _signedIn = true;
    if (name != null) _displayName = name;
    if (phone != null) _phone = phone;
    if (email != null) _email = email;
    if (guest || _displayName.isEmpty) {
      _displayName = guest ? 'मेहमान' : (_displayName.isEmpty ? 'सीखने वाले' : _displayName);
    }
    _prefs.setBool('signedIn', true);
    _prefs.setString('displayName', _displayName);
    _prefs.setString('phone', _phone);
    _prefs.setString('email', _email);
    notifyListeners();
  }

  void signOut() {
    _signedIn = false;
    _prefs.setBool('signedIn', false);
    notifyListeners();
  }

  void markDone(String id) {
    if (_done.add(id)) {
      _saveDone();
      notifyListeners();
    }
  }

  void unmark(String id) {
    if (_done.remove(id)) {
      _saveDone();
      notifyListeners();
    }
  }

  void markAll(Iterable<String> ids) {
    var changed = false;
    for (final id in ids) {
      if (_done.add(id)) changed = true;
    }
    if (changed) {
      _saveDone();
      notifyListeners();
    }
  }

  void reset() => resetProgress();

  void resetProgress() {
    _done.clear();
    _planDays.clear();
    _quizBest.clear();
    _streak = 0;
    _prefs.remove('done');
    _prefs.remove('planDays');
    _prefs.remove('quizBest');
    _prefs.setInt('streak', 0);
    notifyListeners();
  }

  void saveQuiz(String key, int score) {
    if (score > (_quizBest[key] ?? 0)) {
      _quizBest[key] = score;
      final encoded =
          _quizBest.entries.map((e) => '${e.key}:${e.value}').join(',');
      _prefs.setString('quizBest', encoded);
      notifyListeners();
    }
  }

  bool planDone(int day) => _planDays.contains('$day');

  void togglePlanDay(int day) {
    final k = '$day';
    if (!_planDays.remove(k)) _planDays.add(k);
    _prefs.setStringList('planDays', _planDays.toList());
    notifyListeners();
  }

  void touchStreak() {
    final now = DateTime.now();
    final today =
        '${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}';
    if (_lastActive == today) return;
    final y = now.subtract(const Duration(days: 1));
    final yesterday =
        '${y.year}-${y.month.toString().padLeft(2, '0')}-${y.day.toString().padLeft(2, '0')}';
    _streak = (_lastActive == yesterday) ? _streak + 1 : 1;
    _lastActive = today;
    _prefs.setInt('streak', _streak);
    _prefs.setString('lastActive', today);
  }

  void applyVoice(TtsService tts) {
    tts.setRate(_voiceRate);
    tts.setRepeat(_repeat);
  }

  double bookProgress(BookId book) {
    final ids = chapterIdsFor(book);
    return progressOf(ids);
  }

  double get overallProgress {
    final all = <String>[];
    for (final b in BookId.values) {
      all.addAll(chapterIdsFor(b));
    }
    return progressOf(all);
  }
}

/// Flat, stable list of every progress-tracked chapter id in a book.
/// Kept here so the progress screen, book banners and DoneButton all agree.
List<String> chapterIdsFor(BookId book) {
  switch (book) {
    case BookId.hindi:
      return const <String>[
        'hindi_swar', 'hindi_vargas', 'hindi_anusvar', 'hindi_matra',
        'hindi_conjunct', 'hindi_barakhadi', 'hindi_words',
        'hindi_sentences', 'hindi_grammar', 'hindi_daily',
      ];
    case BookId.english:
      return const <String>[
        'eng_capital', 'eng_small', 'eng_phonics', 'eng_sight',
        'eng_words', 'eng_sentences', 'eng_grammar', 'eng_rules', 'eng_daily',
      ];
    case BookId.math:
      return const <String>[
        'math_counting', 'math_tables', 'math_add', 'math_sub', 'math_mul',
        'math_div', 'math_fractions', 'math_shapes', 'math_algebra',
      ];
    case BookId.urdu:
      return const <String>[
        'urdu_letters', 'urdu_shapes', 'urdu_words', 'urdu_sentences',
        'urdu_grammar', 'urdu_daily', 'urdu_counting', 'urdu_tables',
      ];
    case BookId.language:
      return const <String>['lang_world'];
    case BookId.coding:
      return const <String>[
        'coding_c', 'coding_cpp', 'coding_java', 'coding_python',
      ];
    case BookId.game:
      return const <String>['extras_games'];
    case BookId.realWorld:
      return const <String>[
        'extras_realworld', 'extras_forms', 'extras_typing',
      ];
    case BookId.quiz:
      return const <String>[
        'quiz_hindi', 'quiz_english', 'quiz_counting', 'quiz_tables',
        'quiz_whatsapp',
      ];
  }
}
