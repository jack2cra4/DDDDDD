import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/app_models.dart';
import '../../core/theme.dart';
import '../../core/tts_service.dart';
import '../../data/urdu_data.dart';
import '../../widgets/common.dart';
import '../chapters/simple_chapters.dart';
import 'book_shell.dart';

class UrduBookScreen extends StatelessWidget {
  const UrduBookScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BookShell(
      book: BookId.urdu,
      title: 'اردو کتاب',
      subtitle: 'حروف سے جملوں تک — پوری کتاب اردو میں',
      child: Column(
        children: <Widget>[
          BookChapterTile(
            id: 'urdu_letters',
            title: 'حروف تہجی',
            subtitle: '۱۸ حروف اور ان کی چار شکلیں',
            icon: Icons.abc_rounded,
            child: const UrduLetterScreen(),
          ),
          BookChapterTile(
            id: 'urdu_shapes',
            title: 'حروف کی شکلیں',
            subtitle: 'اکیلا، شروع میں، بیچ میں، آخر میں',
            icon: Icons.category_rounded,
            child: SentenceListScreen(
              title: 'حروف کی شکلیں',
              sentences: urduShapes,
              lang: 'ur-PK',
              chapterId: 'urdu_shapes',
            ),
          ),
          BookChapterTile(
            id: 'urdu_words',
            title: 'الفاظ',
            subtitle: '۱ سے ۱۰ حروف والے الفاظ',
            icon: Icons.dictionary_rounded,
            child: WordGroupsScreen(
              title: 'الفاظ',
              groups: urduWords,
              lang: 'ur-PK',
              chapterId: 'urdu_words',
            ),
          ),
          BookChapterTile(
            id: 'urdu_sentences',
            title: 'جملے',
            subtitle: 'روزمرہ کے جملے',
            icon: Icons.short_text_rounded,
            child: SentenceListScreen(
              title: 'جملے',
              sentences: urduSentences,
              lang: 'ur-PK',
              chapterId: 'urdu_sentences',
            ),
          ),
          BookChapterTile(
            id: 'urdu_grammar',
            title: 'قواعد',
            subtitle: 'اسم، صفت، فعل، زمانہ',
            icon: Icons.school_rounded,
            child: LessonListScreen(
              title: 'اردو قواعد',
              blocks: urduGrammar,
              chapterId: 'urdu_grammar',
              lang: 'ur-PK',
            ),
          ),
          BookChapterTile(
            id: 'urdu_daily',
            title: 'روزمرہ',
            subtitle: 'ہر دن کے لیے الفاظ اور جملے',
            icon: Icons.wb_sunny_rounded,
            child: WordGroupsScreen(
              title: 'روزمرہ',
              groups: urduDaily,
              lang: 'ur-PK',
              chapterId: 'urdu_daily',
            ),
          ),
          BookChapterTile(
            id: 'urdu_counting',
            title: 'گنتی ۱ تا ۱۰۰',
            subtitle: '۱ سے ۱۰۰ تک گنتی',
            icon: Icons.pin_rounded,
            child: CountScreen(
              title: 'گنتی ۱–۱۰۰',
              counts: urduCounts(),
              chapterId: 'urdu_counting',
              showEnglish: false,
            ),
          ),
          BookChapterTile(
            id: 'urdu_tables',
            title: 'ضرب کے جدول',
            subtitle: '۱ سے ۱۰۰ تک',
            icon: Icons.grid_on_rounded,
            child: TableIndexScreen(
              title: 'ضرب کے جدول',
              chapterId: 'urdu_tables',
              lang: 'ur-PK',
              hindiFirst: false,
            ),
          ),
        ],
      ),
    );
  }
}

class UrduLetterScreen extends StatelessWidget {
  const UrduLetterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return PageShell(
      title: 'حروف تہجی',
      child: ListView(
        children: <Widget>[
          for (final l in urduAlphabet)
            Card(
              margin: const EdgeInsets.only(bottom: 10),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(12, 10, 8, 10),
                child: Row(
                  children: <Widget>[
                    GestureDetector(
                      onTap: () => context.read<TtsService>().speakRaw(
                            l.isolated,
                            lang: 'ur-PK',
                            force: true,
                          ),
                      child: Container(
                        width: 66,
                        height: 66,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: colorFor(BookId.urdu).withValues(alpha: 0.13),
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: Text(
                          l.isolated,
                          style: TextStyle(
                            fontSize: 34,
                            fontWeight: FontWeight.w800,
                            color: colorFor(BookId.urdu),
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
                              Text(l.emoji, style: const TextStyle(fontSize: 15)),
                              const SizedBox(width: 6),
                              Text(
                                l.name,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 6),
                          _forms(context, l, scheme),
                          const SizedBox(height: 6),
                          Text(
                            l.words.join(' • '),
                            style: TextStyle(
                              fontSize: 13.5,
                              color: scheme.onSurfaceVariant,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SpeakButton(
                      text: '${l.isolated}، ${l.words.join('، ')}',
                      lang: 'ur-PK',
                      size: 40,
                    ),
                  ],
                ),
              ),
            ),
          DoneButton(id: 'urdu_letters', label: 'حروف یاد ہو گئے'),
        ],
      ),
    );
  }

  Widget _forms(BuildContext context, UrduLetter l, ColorScheme scheme) {
    Widget cell(String label, String form) {
      return GestureDetector(
        onTap: () =>
            context.read<TtsService>().speakRaw(form, lang: 'ur-PK', force: true),
        child: Container(
          margin: const EdgeInsets.only(right: 6),
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
          decoration: BoxDecoration(
            color: scheme.surfaceContainerHighest,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: <Widget>[
              Text(
                form,
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
              Text(
                label,
                style: TextStyle(fontSize: 9.5, color: scheme.onSurfaceVariant),
              ),
            ],
          ),
        ),
      );
    }

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          cell('اکیلا', l.isolated),
          cell('شروع', l.initial),
          cell('بیچ', l.medial),
          cell('آخر', l.finalForm),
        ],
      ),
    );
  }
}
