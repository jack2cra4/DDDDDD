import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/app_models.dart';
import '../../core/app_state.dart';
import '../../core/theme.dart';
import '../../core/tts_service.dart';
import '../../data/numbers_data.dart';
import '../../widgets/common.dart';

class SoundListScreen extends StatelessWidget {
  const SoundListScreen({
    super.key,
    required this.title,
    required this.items,
    required this.chapterId,
    this.lang = 'en-US',
  });

  final String title;
  final List<SoundItem> items;
  final String chapterId;
  final String lang;

  @override
  Widget build(BuildContext context) {
    final state = context.watch<AppState>();
    final tts = context.read<TtsService>();
    final scheme = Theme.of(context).colorScheme;
    return PageShell(
      title: title,
      child: ListView(
        children: <Widget>[
          Text(
            'हर ध्वनि पर टच करो — नीचे शब्द सुनाओ।',
            style: TextStyle(color: scheme.onSurfaceVariant),
          ),
          const SizedBox(height: 10),
          ...items.map(
            (s) {
              final id = '$chapterId:${s.key}';
              return Card(
                margin: const EdgeInsets.only(bottom: 10),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(12, 10, 8, 10),
                  child: Row(
                    children: <Widget>[
                      GestureDetector(
                        onTap: () => tts.speakRaw(s.key, lang: lang, force: true),
                        child: Container(
                          width: 62,
                          height: 62,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: scheme.primary.withValues(alpha: 0.13),
                            borderRadius: BorderRadius.circular(18),
                          ),
                          child: Text(
                            s.key,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.w900,
                              color: scheme.primary,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Text(s.emoji, style: const TextStyle(fontSize: 15)),
                                const SizedBox(width: 6),
                                Text(
                                  s.type,
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                    color: scheme.tertiary,
                                  ),
                                ),
                                if (state.isDone(id)) ...<Widget>[
                                  const SizedBox(width: 6),
                                  Icon(Icons.check_circle, size: 15, color: scheme.primary),
                                ],
                              ],
                            ),
                            const SizedBox(height: 4),
                            Text(
                              s.hint,
                              style: TextStyle(fontSize: 12.5, color: scheme.onSurfaceVariant),
                            ),
                            const SizedBox(height: 6),
                            Wrap(
                              spacing: 6,
                              runSpacing: 6,
                              children: s.examples
                                  .map(
                                    (w) => GestureDetector(
                                      onTap: () =>
                                          tts.speakRaw(w, lang: lang, force: true),
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 10,
                                          vertical: 5,
                                        ),
                                        decoration: BoxDecoration(
                                          color: scheme.surfaceContainerHighest,
                                          borderRadius: BorderRadius.circular(999),
                                        ),
                                        child: Text(
                                          w,
                                          style: const TextStyle(
                                            fontSize: 13.5,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                  .toList(),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        children: <Widget>[
                          SpeakButton(
                            text: s.key,
                            lang: lang,
                            size: 40,
                            tooltip: 'साउंड सुनो',
                          ),
                          const SizedBox(height: 6),
                          GestureDetector(
                            onTap: () => state.markDone(id),
                            child: Icon(
                              state.isDone(id)
                                  ? Icons.check_circle
                                  : Icons.radio_button_unchecked,
                              color: state.isDone(id) ? scheme.primary : scheme.outline,
                              size: 22,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          DoneButton(id: chapterId, label: 'यह अध्याय पूरा हुआ'),
        ],
      ),
    );
  }
}

class WordGroupsScreen extends StatelessWidget {
  const WordGroupsScreen({
    super.key,
    required this.title,
    required this.groups,
    required this.lang,
    required this.chapterId,
  });

  final String title;
  final Map<String, List<WordItem>> groups;
  final String lang;
  final String chapterId;

  @override
  Widget build(BuildContext context) {
    return PageShell(
      title: title,
      child: ListView(
        children: <Widget>[
          for (final entry in groups.entries) ...<Widget>[
            SectionTitle(entry.key, icon: Icons.folder_copy_rounded),
            ...entry.value.map((w) => WordCard(item: w, lang: lang)),
            const SizedBox(height: 6),
          ],
          DoneButton(id: chapterId, label: 'यह अध्याय पूरा हुआ'),
        ],
      ),
    );
  }
}

class SentenceListScreen extends StatelessWidget {
  const SentenceListScreen({
    super.key,
    required this.title,
    required this.sentences,
    required this.lang,
    required this.chapterId,
  });

  final String title;
  final List<String> sentences;
  final String lang;
  final String chapterId;

  @override
  Widget build(BuildContext context) {
    final tts = context.read<TtsService>();
    final scheme = Theme.of(context).colorScheme;
    return PageShell(
      title: title,
      actions: <Widget>[
        IconButton(
          tooltip: 'सब सुनो',
          icon: const Icon(Icons.play_arrow_rounded),
          onPressed: () => tts.speakRaw(sentences.join(' '), lang: lang, force: true),
        ),
        const SizedBox(width: 4),
      ],
      child: ListView(
        children: <Widget>[
          for (var i = 0; i < sentences.length; i++)
            Card(
              margin: const EdgeInsets.only(bottom: 8),
              child: ListTile(
                leading: CircleAvatar(
                  radius: 17,
                  backgroundColor: scheme.primary.withValues(alpha: 0.13),
                  child: Text('${i + 1}', style: TextStyle(color: scheme.primary, fontWeight: FontWeight.w800)),
                ),
                title: Text(
                  sentences[i],
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700, height: 1.4),
                ),
                trailing: SpeakButton(text: sentences[i], lang: lang, size: 40),
                onTap: () => tts.speakRaw(sentences[i], lang: lang, force: true),
              ),
            ),
          DoneButton(id: chapterId, label: 'यह अध्याय पूरा हुआ'),
        ],
      ),
    );
  }
}

class LessonListScreen extends StatelessWidget {
  const LessonListScreen({
    super.key,
    required this.title,
    required this.blocks,
    required this.chapterId,
    this.lang,
    this.ttsLangOverride,
  });

  final String title;
  final List<LessonBlock> blocks;
  final String chapterId;
  final String? lang;
  final String? ttsLangOverride;

  @override
  Widget build(BuildContext context) {
    return PageShell(
      title: title,
      child: ListView(
        children: <Widget>[
          ...blocks.map((b) => LessonTile(block: b, lang: ttsLangOverride ?? lang)),
          DoneButton(id: chapterId, label: 'यह अध्याय पूरा हुआ'),
        ],
      ),
    );
  }
}

class CountScreen extends StatelessWidget {
  const CountScreen({
    super.key,
    required this.title,
    required this.counts,
    required this.chapterId,
    this.showEnglish = true,
  });

  final String title;
  final List<CountItem> counts;
  final String chapterId;
  final bool showEnglish;

  @override
  Widget build(BuildContext context) {
    return PageShell(
      title: title,
      child: ListView.builder(
        padding: const EdgeInsets.only(top: 6),
        itemCount: counts.length + 1,
        itemBuilder: (context, i) {
          if (i == counts.length) {
            return DoneButton(id: chapterId, label: 'गिनती पूरी हुई');
          }
          return CountTile(item: counts[i], showEnglish: showEnglish);
        },
      ),
    );
  }
}

class CountTile extends StatelessWidget {
  const CountTile({super.key, required this.item, this.showEnglish = true});

  final CountItem item;
  final bool showEnglish;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final tts = context.read<TtsService>();
    final book = BookTheme.of(context);
    final primary = book.book == BookId.urdu ? urName(item.n) : hiName(item.n);
    final secondary = book.book == BookId.urdu ? enName(item.n) : enName(item.n);
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: InkWell(
        borderRadius: BorderRadius.circular(22),
        onTap: () => tts.speakRaw(
          showEnglish ? '$primary, $secondary' : primary,
          lang: book.ttsLang,
          force: true,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          child: Row(
            children: <Widget>[
              SizedBox(
                width: 56,
                child: Text(
                  '${item.n}',
                  style: TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.w900,
                    color: scheme.primary,
                  ),
                ),
              ),
              Text(item.emoji, style: const TextStyle(fontSize: 26)),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      primary,
                      style: const TextStyle(fontSize: 19, fontWeight: FontWeight.w800),
                    ),
                    if (showEnglish)
                      Text(
                        secondary,
                        style: TextStyle(fontSize: 14, color: scheme.onSurfaceVariant),
                      ),
                  ],
                ),
              ),
              SpeakButton(
                text: showEnglish ? '$primary, $secondary' : primary,
                lang: book.ttsLang,
                size: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TableIndexScreen extends StatelessWidget {
  const TableIndexScreen({
    super.key,
    required this.title,
    required this.chapterId,
    this.lang = 'hi-IN',
    this.hindiFirst = true,
  });

  final String title;
  final String chapterId;
  final String lang;
  final bool hindiFirst;

  @override
  Widget build(BuildContext context) {
    return PageShell(
      title: title,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 5,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 1.05,
        ),
        itemCount: 100,
        itemBuilder: (context, i) {
          final n = i + 1;
          return Card(
            clipBehavior: Clip.antiAlias,
            child: InkWell(
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute<void>(
                  builder: (_) => TableDetailScreen(
                    n: n,
                    chapterId: chapterId,
                    lang: lang,
                    hindiFirst: hindiFirst,
                  ),
                ),
              ),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      '$n',
                      style: const TextStyle(fontSize: 26, fontWeight: FontWeight.w900),
                    ),
                    Text(
                      'का पहाड़ा',
                      style: TextStyle(
                        fontSize: 10,
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class TableDetailScreen extends StatelessWidget {
  const TableDetailScreen({
    super.key,
    required this.n,
    required this.chapterId,
    this.lang = 'hi-IN',
    this.hindiFirst = true,
  });

  final int n;
  final String chapterId;
  final String lang;
  final bool hindiFirst;

  @override
  Widget build(BuildContext context) {
    final t = buildTable(n);
    final scheme = Theme.of(context).colorScheme;
    return PageShell(
      title: '$n का पहाड़ा',
      child: ListView(
        children: <Widget>[
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('$n × 1 = $n', style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w900)),
                  const SizedBox(width: 16),
                  SpeakButton(text: t.rows.first.hindi, lang: 'hi-IN', label: 'सुनो'),
                ],
              ),
            ),
          ),
          const SizedBox(height: 8),
          for (final r in t.rows)
            Card(
              margin: const EdgeInsets.only(bottom: 8),
              child: InkWell(
                borderRadius: BorderRadius.circular(22),
                onTap: () => ttsSpeak(context, r),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(14, 10, 8, 10),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              '$n × ${r.mul} = ${r.ans}',
                              style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              r.hindi,
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                                color: scheme.primary,
                              ),
                            ),
                            Text(
                              r.english,
                              style: TextStyle(fontSize: 13.5, color: scheme.onSurfaceVariant),
                            ),
                          ],
                        ),
                      ),
                      VoiceToggle(showEnglish: true, showHindi: true),
                    ],
                  ),
                ),
              ),
            ),
          DoneButton(id: '$chapterId:$n', label: 'यह पहाड़ा याद हो गया'),
        ],
      ),
    );
  }

  void ttsSpeak(BuildContext context, TableRow r) {
    final tts = context.read<TtsService>();
    tts.speakRaw(
      tts.mode == VoiceLang.hindi ? r.hindi : r.english,
      lang: tts.mode == VoiceLang.hindi ? 'hi-IN' : 'en-US',
      force: true,
    );
  }
}

class OpCardScreen extends StatelessWidget {
  const OpCardScreen({
    super.key,
    required this.title,
    required this.cards,
    required this.chapterId,
  });

  final String title;
  final List<OpCard> cards;
  final String chapterId;

  @override
  Widget build(BuildContext context) {
    final tts = context.read<TtsService>();
    return PageShell(
      title: title,
      child: ListView(
        children: <Widget>[
          for (final c in cards)
            Card(
              margin: const EdgeInsets.only(bottom: 10),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(14, 12, 8, 12),
                child: Row(
                  children: <Widget>[
                    Text(c.emoji, style: const TextStyle(fontSize: 26)),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            c.expr,
                            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w900),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            c.hindi,
                            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                          ),
                          Text(
                            c.english,
                            style: TextStyle(
                              fontSize: 13.5,
                              color: Theme.of(context).colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SpeakButton(
                      text: '${c.hindi}। ${c.english}',
                      lang: tts.mode == VoiceLang.hindi ? 'hi-IN' : 'en-US',
                      size: 40,
                    ),
                  ],
                ),
              ),
            ),
          DoneButton(id: chapterId, label: 'यह अध्याय पूरा हुआ'),
        ],
      ),
    );
  }
}
