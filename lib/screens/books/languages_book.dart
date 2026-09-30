import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/app_models.dart';
import '../../core/app_state.dart';
import '../../core/theme.dart';
import '../../data/languages_data.dart';
import '../../widgets/common.dart';
import 'book_shell.dart';

class LanguagesBookScreen extends StatelessWidget {
  const LanguagesBookScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<AppState>();
    return BookShell(
      book: BookId.language,
      title: 'भाषाएँ',
      subtitle: 'दुनिया की 10 भाषाएँ — हर भाषा अपनी आवाज़ में',
      child: Column(
        children: <Widget>[
          for (final l in worldLanguages)
            ChapterCard(
              title: '${l.flag}  ${l.name}',
              subtitle: '${l.native} • ${l.sections.length} पाठ',
              icon: Icons.translate_rounded,
              color: colorFor(BookId.language),
              done: state.isDone('lang_${l.code}'),
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute<void>(builder: (_) => LanguageDetailScreen(lang: l)),
              ),
            ),
          BookChapterTile(
            id: 'lang_world',
            title: 'अंग्रेज़ी पढ़ने के नियम',
            subtitle: 'Magic e, silent letters, 6 बड़े नियम',
            icon: Icons.rule_rounded,
            child: LessonListScreen(
              title: 'अंग्रेज़ी पढ़ने के नियम',
              blocks: englishReadingRules,
              chapterId: 'lang_world',
              lang: 'en-US',
            ),
          ),
        ],
      ),
    );
  }
}

class LanguageDetailScreen extends StatelessWidget {
  const LanguageDetailScreen({super.key, required this.lang});

  final ForeignLang lang;

  @override
  Widget build(BuildContext context) {
    final tts = context.read<TtsService>();
    final rtl = lang.rtl;
    return PageShell(
      title: '${lang.flag} ${lang.name}',
      child: ListView(
        children: <Widget>[
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          lang.native,
                          style: const TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'यह भाषा ${lang.tts} में सुनाई जाएगी',
                          style: TextStyle(
                            fontSize: 13,
                            color: Theme.of(context).colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SpeakButton(
                    text: lang.native,
                    lang: lang.tts,
                    label: 'सुनो',
                    size: 48,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          for (final b in lang.sections)
            Card(
              margin: const EdgeInsets.only(bottom: 10),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(14, 12, 8, 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text(b.emoji, style: const TextStyle(fontSize: 22)),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            b.heading,
                            style: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                        SpeakButton(
                          text: b.example.isEmpty ? b.body : b.example,
                          lang: lang.tts,
                          size: 38,
                        ),
                      ],
                    ),
                    if (b.body.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(top: 6),
                        child: Text(
                          b.body,
                          style: TextStyle(
                            fontSize: 14,
                            color: Theme.of(context).colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ),
                    if (b.example.isNotEmpty)
                      GestureDetector(
                        onTap: () => tts.speakRaw(
                          b.example,
                          lang: lang.tts,
                          force: true,
                        ),
                        child: Container(
                          width: double.infinity,
                          margin: const EdgeInsets.only(top: 8),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 10,
                          ),
                          decoration: BoxDecoration(
                            color: colorFor(BookId.language)
                                .withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Directionality(
                            textDirection:
                                rtl ? TextDirection.rtl : TextDirection.ltr,
                            child: Text(
                              b.example,
                              style: const TextStyle(
                                fontSize: 14.5,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          DoneButton(id: 'lang_${lang.code}', label: 'यह भाषा सीख ली'),
        ],
      ),
    );
  }
}
