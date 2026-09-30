import 'package:flutter/material.dart';

import '../../core/app_models.dart';
import '../../data/math_data.dart';
import '../../data/numbers_data.dart';
import '../chapters/simple_chapters.dart';
import 'book_shell.dart';

class MathBookScreen extends StatelessWidget {
  const MathBookScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BookShell(
      book: BookId.math,
      title: 'गणित किताब',
      subtitle: 'गिनती से ज्यामिति तक',
      child: Column(
        children: <Widget>[
          BookChapterTile(
            id: 'math_counting',
            title: 'गिनती (1 से 100)',
            subtitle: 'गिनना सीखो — हर संख्या के साथ',
            icon: Icons.pin_rounded,
            child: CountScreen(
              title: 'गिनती 1–100',
              counts: buildCounts(),
              chapterId: 'math_counting',
            ),
          ),
          BookChapterTile(
            id: 'math_tables',
            title: 'पहाड़े (1 से 100)',
            subtitle: 'हर गुणा पहाड़ा अलग पन्ने पर',
            icon: Icons.grid_on_rounded,
            child: TableIndexScreen(title: 'गुणा पहाड़े', chapterId: 'math_tables'),
          ),
          BookChapterTile(
            id: 'math_add',
            title: '➕ जोड़ (Addition)',
            subtitle: 'जोड़ना सीखो',
            icon: Icons.add_circle_rounded,
            child: OpCardScreen(
              title: 'जोड़',
              cards: mathAddition,
              chapterId: 'math_add',
            ),
          ),
          BookChapterTile(
            id: 'math_sub',
            title: '➖ घटाव (Subtraction)',
            subtitle: 'घटाना सीखो',
            icon: Icons.remove_circle_rounded,
            child: OpCardScreen(
              title: 'घटाव',
              cards: mathSubtraction,
              chapterId: 'math_sub',
            ),
          ),
          BookChapterTile(
            id: 'math_mul',
            title: '✖️ गुणा (Multiplication)',
            subtitle: 'गुणा करना सीखो',
            icon: Icons.close_rounded,
            child: OpCardScreen(
              title: 'गुणा',
              cards: mathMultiply,
              chapterId: 'math_mul',
            ),
          ),
          BookChapterTile(
            id: 'math_div',
            title: '➗ भाग (Division)',
            subtitle: 'भाग करना सीखो',
            icon: Icons.pie_chart_rounded,
            child: OpCardScreen(
              title: 'भाग',
              cards: mathDivide,
              chapterId: 'math_div',
            ),
          ),
          BookChapterTile(
            id: 'math_fractions',
            title: 'भिन्न, दशमलव, प्रतिशत',
            subtitle: 'तिन्हें पहचानो',
            icon: Icons.pie_chart_outline_rounded,
            child: LessonListScreen(
              title: 'भिन्न, दशमलव, प्रतिशत',
              blocks: mathFractions,
              chapterId: 'math_fractions',
              lang: 'hi-IN',
            ),
          ),
          BookChapterTile(
            id: 'math_shapes',
            title: 'आकृतियाँ और माप',
            subtitle: 'तल, कोण, लंबाई, वज़न',
            icon: Icons.change_history_rounded,
            child: LessonListScreen(
              title: 'आकृतियाँ और माप',
              blocks: mathShapes,
              chapterId: 'math_shapes',
              lang: 'hi-IN',
            ),
          ),
          BookChapterTile(
            id: 'math_algebra',
            title: 'बीजगणित और ज्यामिति',
            subtitle: 'X, Y, Z — और आकार',
            icon: Icons.functions_rounded,
            child: LessonListScreen(
              title: 'बीजगणित और ज्यामिति',
              blocks: mathAlgebra,
              chapterId: 'math_algebra',
              lang: 'hi-IN',
            ),
          ),
        ],
      ),
    );
  }
}
