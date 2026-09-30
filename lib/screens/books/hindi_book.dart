import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/app_models.dart';
import '../../core/app_state.dart';
import '../../core/theme.dart';
import '../../core/tts_service.dart';
import '../../data/hindi_data.dart';
import '../../widgets/common.dart';
import '../chapters/letter_chapter.dart';
import '../chapters/simple_chapters.dart';
import 'book_shell.dart';

class HindiBookScreen extends StatelessWidget {
  const HindiBookScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BookShell(
      book: BookId.hindi,
      title: 'हिंदी किताब',
      subtitle: 'स्वर से वाक्य तक — पूरी तरह हिंदी में',
      child: Column(
        children: <Widget>[
          BookChapterTile(
            id: 'hindi_swar',
            title: 'स्वर (Vowels)',
            subtitle: 'अ, आ, इ, ई … अः — हर स्वर की आवाज़',
            icon: Icons.record_voice_over_rounded,
            child: LetterGridScreen(
              title: 'स्वर',
              items: hindiSwar,
              lang: 'hi-IN',
              chapterId: 'hindi_swar',
              columns: 5,
            ),
          ),
          BookChapterTile(
            id: 'hindi_vargas',
            title: 'व्यंजन — वर्ग (क से ङ)',
            subtitle: 'क वर्ग, ख वर्ग, ग वर्ग, घ वर्ग, ङ वर्ग',
            icon: Icons.grid_view_rounded,
            child: LetterGridScreen(
              title: 'व्यंजन — वर्ग',
              items: hindiVargas,
              lang: 'hi-IN',
              chapterId: 'hindi_vargas',
            ),
          ),
          BookChapterTile(
            id: 'hindi_anusvar',
            title: 'अनुस्वार और विसर्ग',
            subtitle: 'ं और ः — दोनों की पहचान',
            icon: Icons.blur_on_rounded,
            child: LetterGridScreen(
              title: 'अनुस्वार और विसर्ग',
              items: hindiAnusvar,
              lang: 'hi-IN',
              chapterId: 'hindi_anusvar',
              columns: 2,
            ),
          ),
          BookChapterTile(
            id: 'hindi_matra',
            title: 'मात्राएँ',
            subtitle: 'ा की ो की ई की उ की — हर मात्रा',
            icon: Icons.brush_rounded,
            child: LetterGridScreen(
              title: 'मात्राएँ',
              items: hindiMatra,
              lang: 'hi-IN',
              chapterId: 'hindi_matra',
              columns: 4,
            ),
          ),
          BookChapterTile(
            id: 'hindi_conjunct',
            title: 'संयुक्ताक्षर',
            subtitle: 'क्ष, त्र, ज्ञ, श्र — जुड़े हुए अक्षर',
            icon: Icons.link_rounded,
            child: LetterGridScreen(
              title: 'संयुक्ताक्षर',
              items: hindiConjuncts,
              lang: 'hi-IN',
              chapterId: 'hindi_conjunct',
            ),
          ),
          BookChapterTile(
            id: 'hindi_barakhadi',
            title: 'बारहखड़ी',
            subtitle: 'हर अक्षर की अपनी पंक्ति',
            icon: Icons.format_list_numbered_rounded,
            child: _BarakhadiScreen(),
          ),
          BookChapterTile(
            id: 'hindi_words',
            title: 'शब्दावली',
            subtitle: 'रोज़ की ज़रूरी शब्दावली',
            icon: Icons.menu_book_rounded,
            child: WordGroupsScreen(
              title: 'शब्दावली',
              groups: hindiWordGroups,
              lang: 'hi-IN',
              chapterId: 'hindi_words',
            ),
          ),
          BookChapterTile(
            id: 'hindi_sentences',
            title: 'वाक्य',
            subtitle: 'छोटे-छोटे वाक्य बनाओ और सुनो',
            icon: Icons.short_text_rounded,
            child: SentenceListScreen(
              title: 'वाक्य',
              sentences: hindiSentences,
              lang: 'hi-IN',
              chapterId: 'hindi_sentences',
            ),
          ),
          BookChapterTile(
            id: 'hindi_grammar',
            title: 'व्याकरण',
            subtitle: 'वर्ण, शब्द, वाक्य की समझ',
            icon: Icons.school_rounded,
            child: LessonListScreen(
              title: 'हिंदी व्याकरण',
              blocks: hindiGrammar,
              chapterId: 'hindi_grammar',
              lang: 'hi-IN',
            ),
          ),
          BookChapterTile(
            id: 'hindi_daily',
            title: 'रोज़ का अभ्यास',
            subtitle: 'हर दिन के लिए छोटे पाठ',
            icon: Icons.wb_sunny_rounded,
            child: WordGroupsScreen(
              title: 'रोज़ का अभ्यास',
              groups: hindiDaily,
              lang: 'hi-IN',
              chapterId: 'hindi_daily',
            ),
          ),
        ],
      ),
    );
  }
}

class _BarakhadiScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final letters = hindiBarakhadiLetters();
    return PageShell(
      title: 'बारहखड़ी',
      child: ListView(
        children: <Widget>[
          Text(
            'नीचे से अपना अक्षर चुनो — उसकी पूरी पंक्ति दिखेगी।',
            style: TextStyle(color: Theme.of(context).colorScheme.onSurfaceVariant),
          ),
          const SizedBox(height: 10),
          ...letters.map(
            (l) => Card(
              margin: const EdgeInsets.only(bottom: 8),
              child: ExpansionTile(
                leading: CircleAvatar(
                  backgroundColor: colorFor(BookId.hindi).withValues(alpha: 0.14),
                  child: Text(
                    l.glyph,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w900,
                      color: colorFor(BookId.hindi),
                    ),
                  ),
                ),
                title: Text(
                  l.glyph,
                  style: const TextStyle(fontSize: 19, fontWeight: FontWeight.w900),
                ),
                subtitle: Text(l.words.first, style: const TextStyle(fontSize: 13.5)),
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(14, 0, 14, 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          l.hint,
                          style: const TextStyle(fontSize: 14.5, fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(height: 8),
                        ...hindiBarakhadiFor(l.glyph).map(
                          (w) => Padding(
                            padding: const EdgeInsets.only(bottom: 6),
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  child: Text(
                                    '${w.word}  —  ${w.meaning}',
                                    style: const TextStyle(fontSize: 14),
                                  ),
                                ),
                                SpeakButton(text: w.word, lang: 'hi-IN', size: 36),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          DoneButton(id: 'hindi_barakhadi', label: 'बारहखड़ी पूरी हुई'),
        ],
      ),
    );
  }
}
