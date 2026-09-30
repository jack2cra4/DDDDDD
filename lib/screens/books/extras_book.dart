import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/app_models.dart';
import '../../core/app_state.dart';
import '../../core/theme.dart';
import '../../core/tts_service.dart';
import '../../data/extras_data.dart';
import '../../widgets/common.dart';
import '../chapters/simple_chapters.dart';
import 'book_shell.dart';

class ExtrasBookScreen extends StatelessWidget {
  const ExtrasBookScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BookShell(
      book: BookId.game,
      title: 'खेल और अभ्यास',
      subtitle: 'मज़ेदार सीख — गेम, असली दुनिया, क्विज़',
      child: Column(
        children: <Widget>[
          BookChapterTile(
            id: 'extras_games',
            title: '🎮 बच्चों के खेल',
            subtitle: 'जानवर, फल, रंग, आकार, वाहन',
            icon: Icons.sports_esports_rounded,
            child: const GamesScreen(),
          ),
          BookChapterTile(
            id: 'extras_realworld',
            title: '📱 असली दुनिया',
            subtitle: 'WhatsApp, अख़बार, किताब, साइन बोर्ड',
            icon: Icons.newspaper_rounded,
            child: const RealWorldScreen(),
          ),
          BookChapterTile(
            id: 'extras_forms',
            title: '📝 फ़ॉर्म भरना सीखो',
            subtitle: 'नाम, पता, फ़ोन नंबर, दस्तखत',
            icon: Icons.assignment_rounded,
            child: LessonListScreen(
              title: 'फ़ॉर्म भरना',
              blocks: realWorldForms,
              chapterId: 'extras_forms',
              lang: 'hi-IN',
            ),
          ),
          BookChapterTile(
            id: 'extras_typing',
            title: '⌨️ टाइपिंग अभ्यास',
            subtitle: 'कीबोर्ड की सही जगह सीखो',
            icon: Icons.keyboard_rounded,
            child: LessonListScreen(
              title: 'टाइपिंग अभ्यास',
              blocks: typingPractice,
              chapterId: 'extras_typing',
              lang: 'hi-IN',
            ),
          ),
          BookChapterTile(
            id: 'extras_plan15',
            title: '📅 15 दिन की योजना',
            subtitle: 'रोज़ क्या पढ़ना है — चेकलिस्ट के साथ',
            icon: Icons.calendar_month_rounded,
            child: const Plan15Screen(),
          ),
          const SectionTitle('क्विज़', icon: Icons.quiz_rounded),
          _quizTile(context, 'quiz_hindi', 'हिंदी अक्षर क्विज़', '🔤', quizHindiLetters),
          _quizTile(context, 'quiz_english', 'English Letters Quiz', '🔡', quizEnglishLetters),
          _quizTile(context, 'quiz_counting', 'गिनती क्विज़', '🔢', quizCounting),
          _quizTile(context, 'quiz_tables', 'पहाड़े का क्विज़', '✖️', quizTables),
          _quizTile(context, 'quiz_whatsapp', 'WhatsApp पढ़ने का क्विज़', '💬', quizWhatsApp),
        ],
      ),
    );
  }

  Widget _quizTile(
    BuildContext context,
    String id,
    String title,
    String emoji,
    List<QuizItem> items,
  ) {
    final state = context.watch<AppState>();
    final best = state.best(id);
    return ChapterCard(
      title: '$emoji  $title',
      subtitle: best == 0
          ? '${items.length} सवाल — अभी खेला नहीं'
          : '${items.length} सवाल • सर्वश्रेष्ठ स्कोर: $best',
      icon: Icons.emoji_events_rounded,
      color: colorFor(BookId.quiz),
      done: best > 0,
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute<void>(builder: (_) => QuizScreen(id: id, title: title, items: items)),
      ),
    );
  }
}

class GamesScreen extends StatelessWidget {
  const GamesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PageShell(
      title: 'बच्चों के खेल',
      child: ListView(
        children: <Widget>[
          const _GameIntro(),
          BookChapterTile(
            id: 'game_animals',
            title: '🐾 जानवर',
            subtitle: 'नाम सीखो और आवाज़ सुनो',
            icon: Icons.pets_rounded,
            child: LessonListScreen(
              title: 'जानवर',
              blocks: gameAnimals,
              chapterId: 'game_animals',
              lang: 'hi-IN',
            ),
          ),
          BookChapterTile(
            id: 'game_fruits',
            title: '🍎 फल',
            subtitle: 'फलों के नाम',
            icon: Icons.apple_rounded,
            child: LessonListScreen(
              title: 'फल',
              blocks: gameFruits,
              chapterId: 'game_fruits',
              lang: 'hi-IN',
            ),
          ),
          BookChapterTile(
            id: 'game_colors',
            title: '🎨 रंग',
            subtitle: 'रंगों के नाम',
            icon: Icons.palette_rounded,
            child: LessonListScreen(
              title: 'रंग',
              blocks: gameColors,
              chapterId: 'game_colors',
              lang: 'hi-IN',
            ),
          ),
          BookChapterTile(
            id: 'game_shapes',
            title: '🔷 आकार',
            subtitle: 'आकारों के नाम',
            icon: Icons.category_rounded,
            child: LessonListScreen(
              title: 'आकार',
              blocks: gameShapes,
              chapterId: 'game_shapes',
              lang: 'hi-IN',
            ),
          ),
          BookChapterTile(
            id: 'game_vehicles',
            title: '🚗 वाहन',
            subtitle: 'गाड़ियों के नाम',
            icon: Icons.directions_car_rounded,
            child: LessonListScreen(
              title: 'वाहन',
              blocks: gameVehicles,
              chapterId: 'game_vehicles',
              lang: 'hi-IN',
            ),
          ),
        ],
      ),
    );
  }
}

class _GameIntro extends StatelessWidget {
  const _GameIntro();

  @override
  Widget build(BuildContext context) {
    return Card(
      color: colorFor(BookId.game).withValues(alpha: 0.12),
      child: const Padding(
        padding: EdgeInsets.all(14),
        child: Text(
          '🎯 हर खेल चुनो और सीखो — हर नाम सुनना न भूलो!',
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w800),
        ),
      ),
    );
  }
}

class RealWorldScreen extends StatelessWidget {
  const RealWorldScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PageShell(
      title: 'असली दुनिया',
      child: ListView(
        children: <Widget>[
          const Card(
            child: Padding(
              padding: EdgeInsets.all(14),
              child: Text(
                '📖 रोज़मर्रा की चीज़ों पर लेख पढ़ो — यही असली पढ़ाई है।',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
              ),
            ),
          ),
          _rw('WhatsApp', '💬', 'चैट और स्टेटस पढ़ो', realWorldWhatsApp, 'rw_whatsapp'),
          _rw('अख़बार', '📰', 'ख़बरें पढ़ो', realWorldNewspaper, 'rw_newspaper'),
          _rw('किताब', '📚', 'नाम, कहानी, लेखक', realWorldBook, 'rw_book'),
          _rw('साइन बोर्ड', '🪧', 'दुकान और जगह के नाम', realWorldSignboard, 'rw_signboard'),
        ],
      ),
    );
  }

  Widget _rw(String title, String emoji, String sub, List<WordItem> items, String id) {
    return BookChapterTile(
      id: id,
      title: '$emoji  $title',
      subtitle: sub,
      icon: Icons.article_rounded,
      child: WordGroupsScreen(
        title: title,
        groups: <String, List<WordItem>>{'$title': items},
        lang: 'hi-IN',
        chapterId: id,
      ),
    );
  }
}

class Plan15Screen extends StatelessWidget {
  const Plan15Screen({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<AppState>();
    final doneDays = plan15.where((d) => state.planDone(d.day)).length;
    return PageShell(
      title: '15 दिन की योजना',
      child: ListView(
        children: <Widget>[
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    '$doneDays / ${plan15.length} दिन पूरे',
                    style: const TextStyle(fontSize: 19, fontWeight: FontWeight.w900),
                  ),
                  const SizedBox(height: 10),
                  ProgressBarLine(
                    value: doneDays / plan15.length,
                    color: colorFor(BookId.game),
                    height: 14,
                  ),
                ],
              ),
            ),
          ),
          for (final d in plan15)
            Card(
              margin: const EdgeInsets.only(bottom: 10),
              child: CheckboxListTile(
                value: state.planDone(d.day),
                onChanged: (_) => state.togglePlanDay(d.day),
                title: Text(
                  'दिन ${d.day}: ${d.title}',
                  style: const TextStyle(fontWeight: FontWeight.w800),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(height: 4),
                    Text(d.goal),
                    const SizedBox(height: 6),
                    Wrap(
                      spacing: 6,
                      runSpacing: 6,
                      children: d.chapters
                          .map(
                            (c) => Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 3,
                              ),
                              decoration: BoxDecoration(
                                color: Theme.of(context)
                                    .colorScheme
                                    .surfaceContainerHighest,
                                borderRadius: BorderRadius.circular(999),
                              ),
                              child: Text(c, style: const TextStyle(fontSize: 11.5)),
                            ),
                          )
                          .toList(),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      '💡 ${d.tip}',
                      style: TextStyle(
                        fontSize: 13,
                        color: colorFor(BookId.game),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                secondary: CircleAvatar(
                  radius: 18,
                  backgroundColor: colorFor(BookId.game).withValues(alpha: 0.15),
                  child: Text(
                    '${d.day}',
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      color: colorFor(BookId.game),
                    ),
                  ),
                ),
              ),
            ),
          DoneButton(id: 'extras_plan15', label: 'योजना पूरी हुई'),
        ],
      ),
    );
  }
}

class QuizScreen extends StatefulWidget {
  const QuizScreen({
    super.key,
    required this.id,
    required this.title,
    required this.items,
  });

  final String id;
  final String title;
  final List<QuizItem> items;

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  final math_ = math.Random();
  late List<QuizItem> _order;
  int _index = 0;
  int _score = 0;
  int? _picked;
  bool _finished = false;

  @override
  void initState() {
    super.initState();
    _order = List<QuizItem>.of(widget.items)..shuffle(math_);
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<AppState>();
    final tts = context.read<TtsService>();
    final q = _order[_index];

    if (_finished) {
      final best = state.best(widget.id);
      return PageShell(
        title: 'क्विज़ पूरा',
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  _score >= widget.items.length * 0.7 ? '🏆' : '💪',
                  style: const TextStyle(fontSize: 70),
                ),
                const SizedBox(height: 12),
                Text(
                  '$_score / ${widget.items.length}',
                  style: const TextStyle(fontSize: 40, fontWeight: FontWeight.w900),
                ),
                const SizedBox(height: 6),
                Text(
                  'सर्वश्रेष्ठ स्कोर: $best',
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: FilledButton.icon(
                    onPressed: () => setState(() {
                      _order = List<QuizItem>.of(widget.items)..shuffle(math_);
                      _index = 0;
                      _score = 0;
                      _picked = null;
                      _finished = false;
                    }),
                    icon: const Icon(Icons.replay_rounded),
                    label: const Text('फिर से खेलो'),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    return PageShell(
      title: widget.title,
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 12),
          child: Center(
            child: Text(
              '${_index + 1}/${widget.items.length}  •  ⭐$_score',
              style: const TextStyle(fontWeight: FontWeight.w800),
            ),
          ),
        ),
      ],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          ProgressBarLine(
            value: _index / widget.items.length,
            color: colorFor(BookId.quiz),
            height: 12,
          ),
          const SizedBox(height: 18),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: Column(
                children: <Widget>[
                  Text(
                    q.prompt,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w800),
                  ),
                  if (q.hint.isNotEmpty) ...<Widget>[
                    const SizedBox(height: 8),
                    Text(
                      q.hint,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                  if (q.speak.isNotEmpty) ...<Widget>[
                    const SizedBox(height: 10),
                    Center(
                      child: SpeakButton(
                        text: q.speak,
                        lang: 'hi-IN',
                        size: 44,
                        label: 'सुनो',
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
          const SizedBox(height: 14),
          for (var i = 0; i < q.options.length; i++)
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: _option(context, tts, i, q),
            ),
          if (_picked != null)
            Padding(
              padding: const EdgeInsets.only(top: 6),
              child: FilledButton.icon(
                onPressed: () => setState(() {
                  if (_index + 1 >= _order.length) {
                    _finished = true;
                    state.saveQuiz(widget.id, _score);
                  } else {
                    _index++;
                    _picked = null;
                  }
                }),
                icon: const Icon(Icons.arrow_forward_rounded),
                label: Text(
                  _index + 1 >= _order.length ? 'स्कोर देखो' : 'अगला सवाल',
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _option(BuildContext context, TtsService tts, int i, QuizItem q) {
    final scheme = Theme.of(context).colorScheme;
    final picked = _picked;
    final isAnswer = i == q.answer;
    Color? bg;
    Color? fg;
    if (picked != null) {
      if (isAnswer) {
        bg = const Color(0xFF1B7A3D);
        fg = Colors.white;
      } else if (i == picked) {
        bg = scheme.error;
        fg = Colors.white;
      }
    }
    return Card(
      color: bg,
      child: InkWell(
        borderRadius: BorderRadius.circular(22),
        onTap: picked != null
            ? null
            : () {
                final correct = isAnswer;
                if (correct) _score++;
                setState(() => _picked = i);
                if (correct && q.speak.isNotEmpty) {
                  tts.speakRaw(q.speak, lang: 'hi-IN', force: true);
                }
              },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  q.options[i],
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.w800,
                    color: fg ?? scheme.onSurface,
                  ),
                ),
              ),
              if (picked != null && isAnswer)
                const Text('✅', style: TextStyle(fontSize: 20)),
              if (picked != null && i == picked && !isAnswer)
                const Text('❌', style: TextStyle(fontSize: 20)),
            ],
          ),
        ),
      ),
    );
  }
}
