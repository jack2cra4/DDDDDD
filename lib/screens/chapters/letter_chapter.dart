import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/app_models.dart';
import '../../core/app_state.dart';
import '../../core/tts_service.dart';
import '../../widgets/common.dart';

class LetterGridScreen extends StatelessWidget {
  const LetterGridScreen({
    super.key,
    required this.title,
    required this.items,
    required this.lang,
    required this.chapterId,
    this.columns = 4,
  });

  final String title;
  final List<LetterItem> items;
  final String lang;
  final String chapterId;
  final int columns;

  @override
  Widget build(BuildContext context) {
    final state = context.watch<AppState>();
    return PageShell(
      title: title,
      actions: <Widget>[
        IconButton(
          tooltip: 'सब सुनो',
          icon: const Icon(Icons.play_arrow_rounded),
          onPressed: () {
            final tts = context.read<TtsService>();
            tts.speakRaw(
              items.map((e) => e.glyph).join(', '),
              lang: lang,
              force: true,
            );
          },
        ),
        const SizedBox(width: 4),
      ],
      child: ListView(
        children: <Widget>[
          Text(
            'किसी भी अक्षर पर टच करो — आवाज़ आएगी।',
            style: TextStyle(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 12),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: columns,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 0.92,
            ),
            itemCount: items.length,
            itemBuilder: (context, i) {
              final item = items[i];
              return _LetterTile(
                item: item,
                lang: lang,
                done: state.isDone('$chapterId:${item.glyph}'),
                onTap: () => _openDetail(context, item),
              );
            },
          ),
          const SizedBox(height: 8),
          DoneButton(id: chapterId, label: 'यह अध्याय पूरा हुआ'),
        ],
      ),
    );
  }

  void _openDetail(BuildContext context, LetterItem item) {
    context.read<TtsService>().speakLetter(item.glyph, lang: lang);
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) => LetterDetailScreen(item: item, lang: lang, chapterId: chapterId),
      ),
    );
  }
}

class _LetterTile extends StatelessWidget {
  const _LetterTile({
    required this.item,
    required this.lang,
    required this.onTap,
    required this.done,
  });

  final LetterItem item;
  final String lang;
  final VoidCallback onTap;
  final bool done;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Stack(
          children: <Widget>[
            Center(
              child: Text(
                item.glyph,
                style: TextStyle(
                  fontSize: 42,
                  fontWeight: FontWeight.w800,
                  color: scheme.onSurface,
                  height: 1.1,
                ),
              ),
            ),
            if (item.emoji.isNotEmpty)
              Positioned(
                right: 6,
                top: 4,
                child: Text(item.emoji, style: const TextStyle(fontSize: 15)),
              ),
            if (done)
              Positioned(
                left: 5,
                top: 5,
                child: Icon(Icons.check_circle, size: 16, color: scheme.primary),
              ),
            Positioned(
              right: 4,
              bottom: 4,
              child: Text('🔊', style: TextStyle(fontSize: 13, color: scheme.primary)),
            ),
          ],
        ),
      ),
    );
  }
}

class LetterDetailScreen extends StatelessWidget {
  const LetterDetailScreen({
    super.key,
    required this.item,
    required this.lang,
    required this.chapterId,
  });

  final LetterItem item;
  final String lang;
  final String chapterId;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final tts = context.read<TtsService>();
    return PageShell(
      title: item.glyph,
      child: ListView(
        children: <Widget>[
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      _big(item.glyph, scheme.primary),
                      Text('→', style: TextStyle(fontSize: 30, color: scheme.outline)),
                      _big(item.hint, scheme.tertiary, small: true),
                    ],
                  ),
                  const SizedBox(height: 14),
                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    alignment: WrapAlignment.center,
                    children: <Widget>[
                      FilledButton.icon(
                        onPressed: () => tts.speakLetter(item.glyph, lang: lang),
                        icon: const Text('🔊', style: TextStyle(fontSize: 18)),
                        label: const Text('सुनो'),
                      ),
                      OutlinedButton.icon(
                        onPressed: () => tts.speakRaw(
                          item.words.join(', '),
                          lang: lang,
                          force: true,
                        ),
                        icon: const Text('🗣️', style: TextStyle(fontSize: 18)),
                        label: const Text('उदाहरण सुनो'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 14),
          TraceCard(glyph: item.glyph),
          const SizedBox(height: 14),
          SectionTitle('उदाहरण शब्द', icon: Icons.abc_rounded),
          ...item.words.map(
            (w) => Card(
              margin: const EdgeInsets.only(bottom: 8),
              child: ListTile(
                leading: Text(item.emoji, style: const TextStyle(fontSize: 24)),
                title: Text(w, style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 18)),
                subtitle: Text('यह "$w" है — $w, $w'),
                trailing: SpeakButton(
                  text: '$w। $w, $w, $w',
                  lang: lang,
                  size: 40,
                ),
                onTap: () => tts.speakRaw('$w। $w, $w', lang: lang, force: true),
              ),
            ),
          ),
          DoneButton(id: '$chapterId:${item.glyph}', label: 'यह अक्षर सीख लिया'),
        ],
      ),
    );
  }

  Widget _big(String text, Color c, {bool small = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
      decoration: BoxDecoration(
        color: c.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: small ? 16 : 62,
          fontWeight: FontWeight.w900,
          color: c,
        ),
      ),
    );
  }
}

class TraceCard extends StatefulWidget {
  const TraceCard({super.key, required this.glyph, this.height = 230});

  final String glyph;
  final double height;

  @override
  State<TraceCard> createState() => _TraceCardState();
}

class _TraceCardState extends State<TraceCard> {
  final List<List<Offset>> _strokes = <List<Offset>>[];
  List<Offset>? _current;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Text('✍️', style: TextStyle(fontSize: 20, color: scheme.primary)),
                const SizedBox(width: 8),
                const Expanded(
                  child: Text(
                    'उँगली से ट्रेस करो',
                    style: TextStyle(fontWeight: FontWeight.w800, fontSize: 16),
                  ),
                ),
                TextButton.icon(
                  onPressed: _strokes.isEmpty ? null : () => setState(_strokes.clear),
                  icon: const Text('🧹', style: TextStyle(fontSize: 16)),
                  label: const Text('साफ़'),
                ),
              ],
            ),
            const SizedBox(height: 8),
            SizedBox(
              height: widget.height,
              width: double.infinity,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: scheme.surfaceContainerHighest.withValues(alpha: 0.35),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: scheme.outlineVariant),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: GestureDetector(
                    onPanStart: (d) => setState(() {
                      _current = <Offset>[d.localPosition];
                      _strokes.add(_current!);
                    }),
                    onPanUpdate: (d) => setState(() => _current?.add(d.localPosition)),
                    onPanEnd: (_) => setState(() => _current = null),
                    child: CustomPaint(
                      painter: _TracePainter(
                        guide: widget.glyph,
                        strokes: _strokes,
                        guideColor: scheme.outlineVariant,
                        inkColor: scheme.primary,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TracePainter extends CustomPainter {
  _TracePainter({
    required this.guide,
    required this.strokes,
    required this.guideColor,
    required this.inkColor,
  });

  final String guide;
  final List<List<Offset>> strokes;
  final Color guideColor;
  final Color inkColor;

  @override
  void paint(Canvas canvas, Size size) {
    final tp = TextPainter(
      text: TextSpan(
        text: guide,
        style: TextStyle(
          fontSize: math.min(size.height * 0.66, size.width * 0.5),
          fontWeight: FontWeight.w800,
          color: guideColor.withValues(alpha: 0.5),
        ),
      ),
      textDirection: TextDirection.ltr,
    )..layout();
    tp.paint(canvas, Offset((size.width - tp.width) / 2, (size.height - tp.height) / 2));

    final guideDots = Paint()
      ..color = guideColor.withValues(alpha: 0.7)
      ..style = PaintingStyle.fill;
    for (var y = size.height * 0.2; y < size.height * 0.85; y += 14) {
      for (var x = size.width * 0.12; x < size.width * 0.88; x += 14) {
        canvas.drawCircle(Offset(x, y), 1.1, guideDots);
      }
    }

    final ink = Paint()
      ..color = inkColor
      ..strokeWidth = 9
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..style = PaintingStyle.stroke;
    for (final s in strokes) {
      if (s.length < 2) continue;
      final path = Path()..moveTo(s.first.dx, s.first.dy);
      for (final p in s.skip(1)) {
        path.lineTo(p.dx, p.dy);
      }
      canvas.drawPath(path, ink);
    }
  }

  @override
  bool shouldRepaint(covariant _TracePainter old) => true;
}
