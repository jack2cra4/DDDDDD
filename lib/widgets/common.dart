import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../core/app_models.dart';
import '../core/app_state.dart';
import '../core/theme.dart';
import '../core/tts_service.dart';

class SpeakButton extends StatelessWidget {
  const SpeakButton({
    super.key,
    required this.text,
    this.lang,
    this.label,
    this.size = 46,
    this.color,
    this.tooltip = 'सुनो',
  });

  final String text;
  final String? lang;
  final String? label;
  final double size;
  final Color? color;
  final String tooltip;

  @override
  Widget build(BuildContext context) {
    final tts = context.read<TtsService>();
    final c = color ?? Theme.of(context).colorScheme.primary;
    final button = Semantics(
      button: true,
      label: tooltip,
      child: Material(
        color: c.withValues(alpha: 0.12),
        shape: const CircleBorder(),
        child: InkWell(
          customBorder: const CircleBorder(),
          onTap: () => tts.speakRaw(text, lang: lang, force: true),
          child: SizedBox(
            width: size,
            height: size,
            child: Center(
              child: Text('🔊', style: TextStyle(fontSize: size * 0.45)),
            ),
          ),
        ),
      ),
    );
    if (label == null) return button;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        button,
        const SizedBox(width: 8),
        Text(label!, style: TextStyle(color: c, fontWeight: FontWeight.w700)),
      ],
    );
  }
}

class RepeatButton extends StatelessWidget {
  const RepeatButton({super.key, this.size = 46, this.color});

  final double size;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final tts = context.read<TtsService>();
    final c = color ?? Theme.of(context).colorScheme.secondary;
    return Semantics(
      button: true,
      label: 'फिर से सुनो',
      child: Material(
        color: c.withValues(alpha: 0.12),
        shape: const CircleBorder(),
        child: InkWell(
          customBorder: const CircleBorder(),
          onTap: () => tts.speakAgain(),
          child: SizedBox(
            width: size,
            height: size,
            child: Center(
              child: Text('🔁', style: TextStyle(fontSize: size * 0.42)),
            ),
          ),
        ),
      ),
    );
  }
}

class PageShell extends StatelessWidget {
  const PageShell({
    super.key,
    required this.child,
    this.title,
    this.actions,
    this.floating,
    this.padded = true,
  });

  final Widget child;
  final String? title;
  final List<Widget>? actions;
  final Widget? floating;
  final bool padded;

  @override
  Widget build(BuildContext context) {
    final book = BookTheme.of(context);
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: title == null
          ? null
          : AppBar(
              title: Text(title!),
              actions: actions,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back_rounded),
                tooltip: 'वापस',
                onPressed: () => Navigator.of(context).maybePop(),
              ),
            ),
      floatingActionButton: floating,
      body: Directionality(
        textDirection: book.book.isRtl ? TextDirection.rtl : TextDirection.ltr,
        child: padded
            ? SafeArea(child: Padding(padding: const EdgeInsets.fromLTRB(14, 8, 14, 24), child: child))
            : SafeArea(child: child),
      ),
    );
  }
}

class ChapterCard extends StatelessWidget {
  const ChapterCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.onTap,
    required this.color,
    this.done = false,
    this.trailing,
  });

  final String title;
  final String subtitle;
  final IconData icon;
  final VoidCallback onTap;
  final Color color;
  final bool done;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final scale = context.select<AppState, double>((s) => s.textScale);
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
          child: Row(
            children: <Widget>[
              Container(
                width: 52,
                height: 52,
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Icon(icon, color: color, size: 28),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 17 * scale,
                        fontWeight: FontWeight.w800,
                        color: scheme.onSurface,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 13 * scale,
                        color: scheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
              if (done)
                Icon(Icons.check_circle_rounded, color: color, size: 26)
              else
                trailing ?? Icon(Icons.chevron_right_rounded, color: scheme.outline),
            ],
          ),
        ),
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  const SectionTitle(this.text, {super.key, this.icon, this.color});

  final String text;
  final IconData? icon;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final c = color ?? Theme.of(context).colorScheme.primary;
    return Padding(
      padding: const EdgeInsets.fromLTRB(4, 18, 4, 10),
      child: Row(
        children: <Widget>[
          if (icon != null) ...<Widget>[
            Icon(icon, color: c, size: 22),
            const SizedBox(width: 8),
          ],
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.w900,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProgressBarLine extends StatelessWidget {
  const ProgressBarLine({super.key, required this.value, this.color, this.height = 12});

  final double value;
  final Color? color;
  final double height;

  @override
  Widget build(BuildContext context) {
    final c = color ?? Theme.of(context).colorScheme.primary;
    return ClipRRect(
      borderRadius: BorderRadius.circular(height),
      child: TweenAnimationBuilder<double>(
        tween: Tween<double>(begin: 0, end: value.clamp(0, 1)),
        duration: const Duration(milliseconds: 650),
        curve: Curves.easeOutCubic,
        builder: (context, v, _) => LinearProgressIndicator(
          value: v,
          minHeight: height,
          backgroundColor: c.withValues(alpha: 0.15),
          valueColor: AlwaysStoppedAnimation<Color>(c),
        ),
      ),
    );
  }
}

class VoiceToggle extends StatelessWidget {
  const VoiceToggle({super.key, this.showEnglish = true, this.showHindi = true});

  final bool showEnglish;
  final bool showHindi;

  @override
  Widget build(BuildContext context) {
    final tts = context.watch<TtsService>();
    if (!showEnglish || !showHindi) return const SizedBox.shrink();
    return Container(
      padding: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(999),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          _chip(context, tts, VoiceLang.hindi, '🇮🇳'),
          _chip(context, tts, VoiceLang.english, '🇬🇧'),
        ],
      ),
    );
  }

  Widget _chip(BuildContext context, TtsService tts, VoiceLang v, String flag) {
    final active = tts.mode == v;
    final scheme = Theme.of(context).colorScheme;
    return GestureDetector(
      onTap: () => tts.setMode(v),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
        decoration: BoxDecoration(
          color: active ? scheme.primary : Colors.transparent,
          borderRadius: BorderRadius.circular(999),
        ),
        child: Text(
          '$flag ${v.short}',
          style: TextStyle(
            color: active ? scheme.onPrimary : scheme.onSurfaceVariant,
            fontWeight: FontWeight.w800,
            fontSize: 13,
          ),
        ),
      ),
    );
  }
}

class LessonTile extends StatelessWidget {
  const LessonTile({super.key, required this.block, this.lang, this.onTap});

  final LessonBlock block;
  final String? lang;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Card(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(22),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(14, 12, 8, 12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(block.emoji, style: const TextStyle(fontSize: 26)),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      block.heading,
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w800,
                        color: scheme.onSurface,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      block.body,
                      style: TextStyle(fontSize: 14, color: scheme.onSurfaceVariant, height: 1.45),
                    ),
                    if (block.example.isNotEmpty) ...<Widget>[
                      const SizedBox(height: 8),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 9),
                        decoration: BoxDecoration(
                          color: scheme.surfaceContainerHighest.withValues(alpha: 0.6),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          block.example,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: scheme.primary,
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              SpeakButton(text: '${block.heading}. ${block.body}. ${block.example}', lang: lang),
            ],
          ),
        ),
      ),
    );
  }
}

class WordCard extends StatelessWidget {
  const WordCard({super.key, required this.item, this.lang, this.color});

  final WordItem item;
  final String? lang;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final c = color ?? scheme.primary;
    final tts = context.read<TtsService>();
    return Card(
      child: InkWell(
        borderRadius: BorderRadius.circular(22),
        onTap: () => tts.speakRaw(
          item.sentence.isNotEmpty ? item.sentence : item.word,
          lang: lang,
          force: true,
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(14, 12, 8, 12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: 46,
                height: 46,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: c.withValues(alpha: 0.13),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Text(item.emoji, style: const TextStyle(fontSize: 24)),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      item.word,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                        color: scheme.onSurface,
                      ),
                    ),
                    if (item.meaning.isNotEmpty)
                      Text(
                        item.meaning,
                        style: TextStyle(fontSize: 13, color: scheme.onSurfaceVariant),
                      ),
                    if (item.sentence.isNotEmpty) ...<Widget>[
                      const SizedBox(height: 6),
                      Text(
                        item.sentence,
                        style: TextStyle(
                          fontSize: 14.5,
                          height: 1.4,
                          color: scheme.onSurface,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              SpeakButton(text: item.word, lang: lang, size: 40),
            ],
          ),
        ),
      ),
    );
  }
}

class EmptyNote extends StatelessWidget {
  const EmptyNote(this.text, {super.key, this.emoji = '📘'});

  final String text;
  final String emoji;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(28),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(emoji, style: const TextStyle(fontSize: 44)),
            const SizedBox(height: 12),
            Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DoneButton extends StatelessWidget {
  const DoneButton({super.key, required this.id, required this.label});

  final String id;
  final String label;

  @override
  Widget build(BuildContext context) {
    final state = context.watch<AppState>();
    final done = state.isDone(id);
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 20, 0, 8),
      child: FilledButton.icon(
        onPressed: () => done ? state.unmark(id) : state.markDone(id),
        style: FilledButton.styleFrom(
          backgroundColor:
              done ? Theme.of(context).colorScheme.tertiary : Theme.of(context).colorScheme.primary,
        ),
        icon: Icon(done ? Icons.check_circle_rounded : Icons.radio_button_unchecked),
        label: Text(done ? 'पूरा हो गया ✓' : label),
      ),
    );
  }
}
