import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_tts/flutter_tts.dart';

import 'app_state.dart';

enum VoiceLang { hindi, english }

extension VoiceLangInfo on VoiceLang {
  String get code => this == VoiceLang.hindi ? 'hi-IN' : 'en-US';
  String get label => this == VoiceLang.hindi ? 'हिंदी' : 'English';
  String get short => this == VoiceLang.hindi ? 'हिं' : 'Eng';
}

class TtsService extends ChangeNotifier {
  TtsService() {
    _boot();
  }

  final FlutterTts _tts = FlutterTts();
  bool _ready = false;
  bool _speaking = false;
  String _lang = 'hi-IN';
  double _rate = 0.48;
  double _pitch = 1.05;
  double _volume = 1.0;
  bool _repeat = false;
  int _lastSpokenHash = 0;
  String _lastSpoken = '';

  bool get ready => _ready;
  bool get speaking => _speaking;
  double get rate => _rate;
  double get pitch => _pitch;
  bool get repeat => _repeat;
  String get lang => _lang;

  VoiceLang get mode =>
      _lang.startsWith('hi') ? VoiceLang.hindi : VoiceLang.english;

  Future<void> _boot() async {
    try {
      await _tts.awaitSpeakCompletion(true);
      try {
        await _tts.setEngine('com.google.android.tts');
      } catch (_) {}
      await _tts.setVolume(_volume);
      await _tts.setSpeechRate(_rate);
      await _tts.setPitch(_pitch);
      await _tts.setQueueMode(0);
      await _tts.awaitSpeakCompletion(true);
      await _tts.setLanguage(_lang);
      final langs = await _tts.getLanguages;
      if (langs is List) {
        final has = langs.map((e) => '$e').toSet();
        if (!has.contains('ur-PK')) {
          if (has.contains('ur')) await _tts.setLanguage('ur');
        }
      }
      _ready = true;
    } catch (e) {
      _ready = true;
    }
    notifyListeners();
  }

  Future<void> setLang(String code) async {
    if (_lang == code) return;
    _lang = code;
    try {
      await _tts.setLanguage(code);
      await _tts.stop();
    } catch (_) {}
    notifyListeners();
  }

  Future<void> setMode(VoiceLang v) => setLang(v.code);

  Future<void> setRate(double r) async {
    _rate = r.clamp(0.2, 1.0);
    try {
      await _tts.setSpeechRate(_rate);
    } catch (_) {}
    notifyListeners();
  }

  Future<void> setPitch(double p) async {
    _pitch = p.clamp(0.5, 2.0);
    try {
      await _tts.setPitch(_pitch);
    } catch (_) {}
    notifyListeners();
  }

  void setRepeat(bool v) {
    _repeat = v;
    notifyListeners();
  }

  /// Push persisted user settings into the engine once it is constructed.
  void applyFrom(AppState state) {
    state.applyVoice(this);
  }

  Future<void> stop() async {
    try {
      await _tts.stop();
    } catch (_) {}
    _speaking = false;
    notifyListeners();
  }

  Future<void> speakRaw(String text, {String? lang, bool force = false}) async {
    final clean = text.trim();
    if (clean.isEmpty) return;
    if (lang != null && lang != _lang) {
      await setLang(lang);
    }
    final h = clean.hashCode;
    if (!force && h == _lastSpokenHash && _repeat) return;
    _lastSpokenHash = h;
    _lastSpoken = clean;
    try {
      await _tts.stop();
      _speaking = true;
      notifyListeners();
      final r = await _tts.speak(clean);
      if (r == 1) {
        _speaking = false;
        notifyListeners();
      }
    } catch (_) {
      _speaking = false;
      notifyListeners();
    }
  }

  Future<void> speakLetter(String glyph, {String? lang}) =>
      speakRaw(glyph, lang: lang, force: true);

  Future<void> speakAgain() => speakRaw(_lastSpoken, force: true);

  void disposeEngine() {
    try {
      _tts.stop();
    } catch (_) {}
  }
}
