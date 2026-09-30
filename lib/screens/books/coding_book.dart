import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/app_models.dart';
import '../../core/app_state.dart';
import '../../core/theme.dart';
import '../../data/coding_data.dart';
import '../../widgets/common.dart';
import 'book_shell.dart';

class CodingBookScreen extends StatelessWidget {
  const CodingBookScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BookShell(
      book: BookId.coding,
      title: 'कोडिंग किताब',
      subtitle: 'C, C++, Java, Python — सरल भाषा में',
      child: Column(
        children: <Widget>[
          for (final u in codingUnits)
            BookChapterTile(
              id: 'coding_${u.key}',
              title: '${u.badge}  ${u.name}',
              subtitle: '${u.lessons.length} पाठ — शुरू से अंत तक',
              icon: Icons.code_rounded,
              child: _UnitScreen(unit: u),
            ),
        ],
      ),
    );
  }
}

class _UnitScreen extends StatelessWidget {
  const _UnitScreen({required this.unit});

  final CodeUnit unit;

  @override
  Widget build(BuildContext context) {
    final state = context.watch<AppState>();
    return PageShell(
      title: '${unit.badge} ${unit.name}',
      child: ListView(
        children: <Widget>[
          for (var i = 0; i < unit.lessons.length; i++)
            Card(
              margin: const EdgeInsets.only(bottom: 10),
              child: ExpansionTile(
                initiallyExpanded: i == 0,
                leading: CircleAvatar(
                  backgroundColor: unit.color.withValues(alpha: 0.15),
                  child: Text(
                    '${i + 1}',
                    style: TextStyle(
                      color: unit.color,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                title: Text(
                  unit.lessons[i].title,
                  style: const TextStyle(fontWeight: FontWeight.w800),
                ),
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          unit.lessons[i].note,
                          style: const TextStyle(fontSize: 14, height: 1.45),
                        ),
                        const SizedBox(height: 10),
                        _CodeBlock(
                          lines: unit.lessons[i].lines,
                          color: unit.color,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          DoneButton(id: 'coding_${unit.key}', label: '${unit.name} पूरा हुआ'),
        ],
      ),
    );
  }
}

class _CodeBlock extends StatelessWidget {
  const _CodeBlock({required this.lines, required this.color});

  final List<String> lines;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final tts = context.read<TtsService>();
    final state = context.watch<AppState>();
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(12, 10, 6, 10),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              const Text('💻', style: TextStyle(fontSize: 14)),
              const SizedBox(width: 6),
              const Expanded(
                child: Text(
                  'code',
                  style: TextStyle(
                    color: Color(0xFF9CDCFE),
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              InkWell(
                onTap: () => tts.speakRaw(
                  lines.join(' '),
                  lang: 'hi-IN',
                  force: true,
                ),
                child: const Padding(
                  padding: EdgeInsets.all(6),
                  child: Text('🔊', style: TextStyle(fontSize: 15)),
                ),
              ),
              InkWell(
                onTap: () => state.setRepeat(!state.repeat),
                child: Padding(
                  padding: const EdgeInsets.all(6),
                  child: Text(
                    state.repeat ? '🔂' : '🔁',
                    style: TextStyle(
                      fontSize: 15,
                      color: state.repeat ? Colors.amber : Colors.white54,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          for (var i = 0; i < lines.length; i++)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 1.5),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    width: 22,
                    child: Text(
                      '${i + 1}',
                      textAlign: TextAlign.right,
                      style: const TextStyle(
                        color: Color(0xFF6A9955),
                        fontSize: 12,
                        fontFamily: 'monospace',
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      lines[i],
                      style: const TextStyle(
                        color: Color(0xFFD4D4D4),
                        fontSize: 13,
                        height: 1.5,
                        fontFamily: 'monospace',
                      ),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
