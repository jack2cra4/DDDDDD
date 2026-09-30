import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app_models.dart';
import 'tts_service.dart';

const Color kHindi = Color(0xFFE65100);
const Color kEnglish = Color(0xFF1565C0);
const Color kMath = Color(0xFF1B7A3D);
const Color kUrdu = Color(0xFF6A1B9A);
const Color kLanguage = Color(0xFF00838F);
const Color kCoding = Color(0xFF37474F);
const Color kGame = Color(0xFFD81B60);
const Color kRealWorld = Color(0xFF6D4C41);
const Color kQuiz = Color(0xFF7B1FA2);
const Color kBrand = Color(0xFFF57C00);

Color colorFor(BookId id) => switch (id) {
      BookId.hindi => kHindi,
      BookId.english => kEnglish,
      BookId.math => kMath,
      BookId.urdu => kUrdu,
      BookId.language => kLanguage,
      BookId.coding => kCoding,
      BookId.game => kGame,
      BookId.realWorld => kRealWorld,
      BookId.quiz => kQuiz,
    };

ThemeData buildTheme(Brightness brightness, double textScale) {
  final scheme = ColorScheme.fromSeed(
    seedColor: kBrand,
    brightness: brightness,
  );
  final base = ThemeData(colorScheme: scheme, useMaterial3: true);
  final isLight = brightness == Brightness.light;

  return base.copyWith(
    scaffoldBackgroundColor:
        isLight ? const Color(0xFFFFFBF5) : const Color(0xFF15171C),
    textTheme: _scaleText(base.textTheme, textScale),
    appBarTheme: AppBarTheme(
      backgroundColor: isLight ? Colors.white : const Color(0xFF1D2027),
      foregroundColor: scheme.onSurface,
      elevation: 0,
      scrolledUnderElevation: 2,
      centerTitle: true,
      titleTextStyle: base.textTheme.titleLarge?.copyWith(
        fontWeight: FontWeight.w800,
        fontSize: (22 * textScale).clamp(18.0, 40.0),
        color: scheme.onSurface,
      ),
    ),
    cardTheme: CardThemeData(
      elevation: 0,
      color: isLight ? Colors.white : const Color(0xFF1D2027),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(22),
        side: BorderSide(
          color: scheme.outlineVariant.withValues(alpha: isLight ? 0.6 : 0.25),
        ),
      ),
      margin: EdgeInsets.zero,
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        minimumSize: Size.fromHeight(54 * textScale.clamp(1.0, 1.4)),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        textStyle: TextStyle(
          fontSize: 17 * textScale,
          fontWeight: FontWeight.w700,
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        minimumSize: Size.fromHeight(54 * textScale.clamp(1.0, 1.4)),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        side: BorderSide(color: scheme.outline, width: 1.6),
        textStyle: TextStyle(
          fontSize: 17 * textScale,
          fontWeight: FontWeight.w700,
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: isLight ? Colors.white : const Color(0xFF1D2027),
      contentPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: scheme.outlineVariant),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: scheme.outlineVariant),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: scheme.primary, width: 2),
      ),
    ),
    navigationBarTheme: NavigationBarThemeData(
      height: 70,
      backgroundColor: isLight ? Colors.white : const Color(0xFF1D2027),
      labelTextStyle: WidgetStatePropertyAll(
        TextStyle(fontSize: 12 * textScale.clamp(1.0, 1.3), fontWeight: FontWeight.w600),
      ),
    ),
    listTileTheme: const ListTileThemeData(
      contentPadding: EdgeInsets.symmetric(horizontal: 18, vertical: 6),
    ),
    dividerTheme: DividerThemeData(
      color: scheme.outlineVariant.withValues(alpha: 0.5),
      space: 1,
    ),
  );
}

TextTheme _scaleText(TextTheme t, double s) {
  TextStyle f(TextStyle? base, double size, FontWeight w) {
    final size2 = (size * s).clamp(11.0, 44.0);
    return (base ?? const TextStyle()).copyWith(fontSize: size2, fontWeight: w);
  }

  return t.copyWith(
    displayLarge: f(t.displayLarge, 52, FontWeight.w900),
    displayMedium: f(t.displayMedium, 42, FontWeight.w800),
    headlineLarge: f(t.headlineLarge, 32, FontWeight.w800),
    headlineMedium: f(t.headlineMedium, 27, FontWeight.w800),
    headlineSmall: f(t.headlineSmall, 23, FontWeight.w700),
    titleLarge: f(t.titleLarge, 20, FontWeight.w700),
    titleMedium: f(t.titleMedium, 17, FontWeight.w700),
    titleSmall: f(t.titleSmall, 15, FontWeight.w600),
    bodyLarge: f(t.bodyLarge, 16, FontWeight.w500),
    bodyMedium: f(t.bodyMedium, 15, FontWeight.w500),
    bodySmall: f(t.bodySmall, 13, FontWeight.w400),
    labelLarge: f(t.labelLarge, 15, FontWeight.w700),
  );
}

class BookTheme extends InheritedWidget {
  const BookTheme({super.key, required this.book, required super.child});

  final BookId book;

  Color get color => colorFor(book);
  String get ttsLang => switch (book) {
        BookId.hindi => 'hi-IN',
        BookId.english => 'en-US',
        BookId.urdu => 'ur-PK',
        BookId.math => 'hi-IN',
        BookId.language => 'en-US',
        BookId.coding => 'en-US',
        BookId.game => 'hi-IN',
        BookId.realWorld => 'hi-IN',
        BookId.quiz => 'hi-IN',
      };

  static BookTheme of(BuildContext context) {
    final w = context.dependOnInheritedWidgetOfExactType<BookTheme>();
    return w ?? const BookTheme(book: BookId.hindi, child: SizedBox.shrink());
  }

  @override
  bool updateShouldNotify(BookTheme oldWidget) => oldWidget.book != book;
}

/// Applies a [BookId] to a subtree AND points the TTS engine at that book's
/// language, so a language switch changes content, colour, text direction and
/// voice together. This is the single place that enforces "no mixing".
class BookScope extends StatefulWidget {
  const BookScope({super.key, required this.book, required this.child});

  final BookId book;
  final Widget child;

  @override
  State<BookScope> createState() => _BookScopeState();
}

class _BookScopeState extends State<BookScope> {
  String? _applied;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _sync();
  }

  @override
  void didUpdateWidget(covariant BookScope oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.book != widget.book) _sync();
  }

  void _sync() {
    final tts = context.read<TtsService>();
    if (_applied == tts.lang) return;
    _applied = tts.lang;
    unawaited(tts.setLang(_langFor(widget.book)));
  }

  static String _langFor(BookId book) {
    final scope = BookTheme(book: book, child: const SizedBox.shrink());
    return scope.ttsLang;
  }

  @override
  Widget build(BuildContext context) {
    return BookTheme(book: widget.book, child: widget.child);
  }
}
