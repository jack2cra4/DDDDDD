import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/app_models.dart';
import '../../core/app_state.dart';
import '../../core/theme.dart';
import '../../widgets/common.dart';

class BookShell extends StatelessWidget {
  const BookShell({
    super.key,
    required this.book,
    required this.title,
    required this.child,
    this.subtitle = '',
  });

  final BookId book;
  final String title;
  final String subtitle;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BookScope(
      book: book,
      child: PageShell(
        title: title,
        actions: <Widget>[
          if (book == BookId.math) const _MathVoiceButton(),
          const _ProgressButton(),
          const SizedBox(width: 4),
        ],
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            _BookBanner(book: book, subtitle: subtitle),
            const SizedBox(height: 6),
            ..._flatten(child),
          ],
        ),
      ),
    );
  }

  List<Widget> _flatten(Widget w) {
    if (w is Column) return w.children;
    return <Widget>[w];
  }
}

class BookChapterTile extends StatelessWidget {
  const BookChapterTile({
    super.key,
    required this.id,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.child,
  });

  final String id;
  final String title;
  final String subtitle;
  final IconData icon;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final state = context.watch<AppState>();
    final book = BookTheme.of(context).book;
    return ChapterCard(
      title: title,
      subtitle: subtitle,
      icon: icon,
      color: colorFor(book),
      done: state.isDone(id),
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute<void>(builder: (_) => child),
      ),
    );
  }
}

class _BookBanner extends StatelessWidget {
  const _BookBanner({required this.book, required this.subtitle});

  final BookId book;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    final c = colorFor(book);
    final state = context.watch<AppState>();
    return Card(
      color: c.withValues(alpha: 0.12),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Row(
          children: <Widget>[
            Icon(Icons.translate_rounded, color: c, size: 30),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    subtitle.isEmpty ? 'यह किताब पूरी तरह ऑफ़लाइन है' : subtitle,
                    style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w800),
                  ),
                  const SizedBox(height: 8),
                  ProgressBarLine(value: state.bookProgress(book), color: c, height: 10),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ProgressButton extends StatelessWidget {
  const _ProgressButton();

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.checklist_rounded),
      tooltip: 'प्रगति',
      onPressed: () => Navigator.of(context).push(
        MaterialPageRoute<void>(builder: (_) => const ProgressScreen()),
      ),
    );
  }
}

class _MathVoiceButton extends StatelessWidget {
  const _MathVoiceButton();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: VoiceToggle(),
    );
  }
}

class ProgressScreen extends StatelessWidget {
  const ProgressScreen({super.key});

  static const _groups = <String, List<String>>{
    'हिंदी': <String>[
      'hindi_swar', 'hindi_vargas', 'hindi_anusvar', 'hindi_matra',
      'hindi_conjunct', 'hindi_barakhadi', 'hindi_words',
      'hindi_sentences', 'hindi_grammar', 'hindi_daily',
    ],
    'English': <String>[
      'eng_capital', 'eng_small', 'eng_phonics', 'eng_sight',
      'eng_words', 'eng_sentences', 'eng_grammar', 'eng_rules', 'eng_daily',
    ],
    'गणित': <String>[
      'math_counting', 'math_tables', 'math_add', 'math_sub',
      'math_mul', 'math_div', 'math_fractions', 'math_shapes', 'math_algebra',
    ],
    'اردو': <String>[
      'urdu_letters', 'urdu_shapes', 'urdu_words', 'urdu_sentences',
      'urdu_grammar', 'urdu_daily', 'urdu_counting', 'urdu_tables',
    ],
    'अन्य': <String>[
      'lang_world', 'coding_c', 'coding_cpp', 'coding_java', 'coding_python',
      'extras_games', 'extras_realworld', 'extras_forms', 'extras_typing',
      'extras_plan15', 'quiz_hindi', 'quiz_english', 'quiz_counting',
      'quiz_tables', 'quiz_whatsapp',
    ],
  };

  @override
  Widget build(BuildContext context) {
    final state = context.watch<AppState>();
    return PageShell(
      title: 'मेरी प्रगति',
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.restart_alt_rounded),
          tooltip: 'रीसेट',
          onPressed: () => _confirmReset(context, state),
        ),
        const SizedBox(width: 4),
      ],
      child: ListView(
        children: <Widget>[
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      const Text('🔥', style: TextStyle(fontSize: 26)),
                      const SizedBox(width: 8),
                      Text(
                        '${state.streak} दिन',
                        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
                      ),
                      const Spacer(),
                      Text(
                        '${(state.overallProgress * 100).round()}%',
                        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w900),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  ProgressBarLine(value: state.overallProgress, height: 16),
                ],
              ),
            ),
          ),
          for (final entry in _groups.entries) ...<Widget>[
            SectionTitle(entry.key, icon: Icons.folder_rounded),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(14),
                child: Column(
                  children: <Widget>[
                    ProgressBarLine(
                      value: _ratio(state, entry.value),
                      height: 10,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '${entry.value.where(state.isDone).length} / ${entry.value.length} अध्याय पूरे',
                      style: const TextStyle(fontSize: 13.5, fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),
            ),
          ],
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  double _ratio(AppState state, List<String> ids) {
    if (ids.isEmpty) return 0;
    return ids.where(state.isDone).length / ids.length;
  }

  Future<void> _confirmReset(BuildContext context, AppState state) async {
    final ok = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('सारी प्रगति मिटाएँ?'),
        content: const Text('यह वापस नहीं आएगी।'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('रहने दो'),
          ),
          FilledButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('हाँ, मिटाओ'),
          ),
        ],
      ),
    );
    if (ok == true) state.reset();
  }
}
