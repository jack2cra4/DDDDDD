import 'package:flutter/material.dart';

import '../../core/app_models.dart';
import '../../data/english_data.dart';
import '../chapters/letter_chapter.dart';
import '../chapters/simple_chapters.dart';
import 'book_shell.dart';

class EnglishBookScreen extends StatelessWidget {
  const EnglishBookScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BookShell(
      book: BookId.english,
      title: 'English Book',
      subtitle: 'A to Z — पूरी तरह English में',
      child: Column(
        children: <Widget>[
          BookChapterTile(
            id: 'eng_capital',
            title: 'Capital Letters (A–Z)',
            subtitle: 'A B C … Z — ऊँचे अक्षर',
            icon: Icons.text_fields_rounded,
            child: LetterGridScreen(
              title: 'Capital Letters',
              items: englishCapital,
              lang: 'en-US',
              chapterId: 'eng_capital',
              columns: 5,
            ),
          ),
          BookChapterTile(
            id: 'eng_small',
            title: 'Small Letters (a–z)',
            subtitle: 'a b c … z — छोटे अक्षर',
            icon: Icons.text_decrease_rounded,
            child: LetterGridScreen(
              title: 'Small Letters',
              items: englishSmall,
              lang: 'en-US',
              chapterId: 'eng_small',
              columns: 5,
            ),
          ),
          BookChapterTile(
            id: 'eng_phonics',
            title: 'Phonics Sounds (44)',
            subtitle: 'हर आवाज़ के साथ शब्द सुनो',
            icon: Icons.hearing_rounded,
            child: SoundListScreen(
              title: 'Phonics Sounds',
              items: englishPhonics,
              chapterId: 'eng_phonics',
              lang: 'en-US',
            ),
          ),
          BookChapterTile(
            id: 'eng_sight',
            title: 'Sight Words',
            subtitle: 'बिना decode किए पढ़ने वाले सबसे ज़रूरी शब्द',
            icon: Icons.visibility_rounded,
            child: SentenceListScreen(
              title: 'Sight Words',
              sentences: englishSightWords,
              lang: 'en-US',
              chapterId: 'eng_sight',
            ),
          ),
          BookChapterTile(
            id: 'eng_words',
            title: 'Word Groups',
            subtitle: '1-2 से 7-10 अक्षरों वाले शब्द',
            icon: Icons.menu_book_rounded,
            child: WordGroupsScreen(
              title: 'Word Groups',
              groups: englishWordGroups,
              lang: 'en-US',
              chapterId: 'eng_words',
            ),
          ),
          BookChapterTile(
            id: 'eng_sentences',
            title: 'Sentences',
            subtitle: 'छोटे-छोटे वाक्य बनाओ',
            icon: Icons.short_text_rounded,
            child: SentenceListScreen(
              title: 'Sentences',
              sentences: englishSentences,
              lang: 'en-US',
              chapterId: 'eng_sentences',
            ),
          ),
          BookChapterTile(
            id: 'eng_grammar',
            title: 'Grammar',
            subtitle: 'Noun, verb, tense — आसान भाषा में',
            icon: Icons.school_rounded,
            child: LessonListScreen(
              title: 'English Grammar',
              blocks: englishGrammar,
              chapterId: 'eng_grammar',
              lang: 'en-US',
            ),
          ),
          BookChapterTile(
            id: 'eng_daily',
            title: 'Daily Words',
            subtitle: 'रोज़ काम आने वाले शब्द',
            icon: Icons.wb_sunny_rounded,
            child: WordGroupsScreen(
              title: 'Daily Words',
              groups: englishDaily,
              lang: 'en-US',
              chapterId: 'eng_daily',
            ),
          ),
        ],
      ),
    );
  }
}
