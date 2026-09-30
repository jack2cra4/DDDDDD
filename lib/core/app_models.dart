import 'package:flutter/material.dart';

enum BookId { hindi, english, math, urdu, language, coding, game, realWorld, quiz }

extension BookIdInfo on BookId {
  String get key => switch (this) {
        BookId.hindi => 'hindi',
        BookId.english => 'english',
        BookId.math => 'math',
        BookId.urdu => 'urdu',
        BookId.language => 'language',
        BookId.coding => 'coding',
        BookId.game => 'game',
        BookId.realWorld => 'realworld',
        BookId.quiz => 'quiz',
      };

  bool get isRtl => this == BookId.urdu;
}

class Chapter {
  const Chapter({
    required this.id,
    required this.title,
    required this.blurb,
    required this.icon,
    required this.builder,
    this.ttsLang,
    this.days = const <int>[],
  });

  final String id;
  final String title;
  final String blurb;
  final IconData icon;
  final WidgetBuilder builder;
  final String? ttsLang;
  final List<int> days;
}

class LetterItem {
  const LetterItem({
    required this.glyph,
    required this.roman,
    required this.words,
    required this.hint,
    this.emoji = '🔤',
  });

  final String glyph;
  final String roman;
  final List<String> words;
  final String hint;
  final String emoji;
}

class SoundItem {
  const SoundItem({
    required this.key,
    required this.type,
    required this.examples,
    required this.hint,
    this.emoji = '🔡',
  });

  final String key;
  final String type;
  final List<String> examples;
  final String hint;
  final String emoji;
}

class WordItem {
  const WordItem(this.word, this.meaning, {this.sentence = '', this.emoji = ''});

  final String word;
  final String meaning;
  final String sentence;
  final String emoji;
}

class CountItem {
  const CountItem(this.n, this.hindi, this.english, this.emoji);

  final int n;
  final String hindi;
  final String english;
  final String emoji;
}

class TableRow {
  const TableRow(this.mul, this.ans, this.hindi, this.english);

  final int mul;
  final int ans;
  final String hindi;
  final String english;
}

class NumberTable {
  const NumberTable(this.n, this.rows);

  final int n;
  final List<TableRow> rows;
}

class LessonBlock {
  const LessonBlock(this.heading, this.body, {this.example = '', this.emoji = '📘'});

  final String heading;
  final String body;
  final String example;
  final String emoji;
}

class OpCard {
  const OpCard({
    required this.expr,
    required this.answer,
    required this.hindi,
    required this.english,
    this.emoji = '🧮',
  });

  final String expr;
  final int answer;
  final String hindi;
  final String english;
  final String emoji;
}

class UrduLetter {
  const UrduLetter({
    required this.name,
    required this.sound,
    required this.isolated,
    required this.initial,
    required this.medial,
    required this.finalForm,
    required this.words,
    required this.emoji,
  });

  final String name;
  final String sound;
  final String isolated;
  final String initial;
  final String medial;
  final String finalForm;
  final List<String> words;
  final String emoji;
}

class ForeignLang {
  const ForeignLang({
    required this.code,
    required this.name,
    required this.flag,
    required this.native,
    required this.tts,
    required this.rtl,
    required this.sections,
  });

  final String code;
  final String name;
  final String flag;
  final String native;
  final String tts;
  final bool rtl;
  final List<LessonBlock> sections;
}

class CodeLesson {
  const CodeLesson({required this.title, required this.note, required this.lines});

  final String title;
  final String note;
  final List<String> lines;
}

class CodeUnit {
  const CodeUnit({
    required this.key,
    required this.name,
    required this.badge,
    required this.color,
    required this.lessons,
  });

  final String key;
  final String name;
  final String badge;
  final Color color;
  final List<CodeLesson> lessons;
}

class QuizItem {
  const QuizItem({
    required this.prompt,
    required this.options,
    required this.answer,
    this.hint = '',
    this.speak = '',
  });

  final String prompt;
  final List<String> options;
  final int answer;
  final String hint;
  final String speak;
}

class PlanDay {
  const PlanDay(this.day, this.title, this.goal, this.chapters, this.tip);

  final int day;
  final String title;
  final String goal;
  final List<String> chapters;
  final String tip;
}
