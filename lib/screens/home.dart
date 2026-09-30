import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../core/app_models.dart';
import '../core/app_state.dart';
import '../core/theme.dart';
import '../widgets/common.dart';
import 'books/book_shell.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future<void>.delayed(const Duration(milliseconds: 1200), () {
      if (!mounted) return;
      context.go('/auth');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Theme.of(context).colorScheme.primaryContainer,
              Theme.of(context).colorScheme.surface,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                width: 110,
                height: 110,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.circular(32),
                  boxShadow: [
                    BoxShadow(
                      color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.25),
                      blurRadius: 30,
                      offset: const Offset(0, 14),
                    ),
                  ],
                ),
                child: const Icon(Icons.menu_book_rounded, color: Colors.white, size: 58),
              ),
              const SizedBox(height: 24),
              Text(
                'पहला कदम',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.w900,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                'सीखो, खेलो और आगे बढ़ो',
                style: TextStyle(
                  fontSize: 15,
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: 36),
              const CircularProgressIndicator(),
            ],
          ),
        ),
      ),
    );
  }
}

class AuthGateScreen extends StatelessWidget {
  const AuthGateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<AppState>();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const Spacer(),
              Text(
                'पहला कदम',
                style: const TextStyle(fontSize: 36, fontWeight: FontWeight.w900),
              ),
              const SizedBox(height: 8),
              Text(
                'अपने बच्चे की पढ़ाई शुरू करें',
                style: TextStyle(color: Theme.of(context).colorScheme.onSurfaceVariant),
              ),
              const SizedBox(height: 40),
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: () {
                    context.read<AppState>().signIn(name: "गेस्ट", guest: true);
                    context.go('/home');
                  },
                  child: const Text('गेस्ट के रूप में शुरू करें'),
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () => context.go('/home'),
                  child: const Text('सीधे शुरू करें'),
                ),
              ),
              const Spacer(),
              Text(
                'ऑफ़लाइन • सुरक्षित • बच्चे के लिए सुरक्षित',
                style: TextStyle(fontSize: 12, color: Theme.of(context).colorScheme.outline),
              ),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const _books = <_Book>[
    _Book(BookId.hindi, '/hindi', 'हिंदी किताब', 'स्वर से वाक्य तक', Icons.abc_rounded),
    _Book(BookId.english, '/english', 'English Book', 'Alphabet to reading', Icons.translate_rounded),
    _Book(BookId.math, '/math', 'गणित किताब', 'गिनती से ज्यामिति तक', Icons.calculate_rounded),
    _Book(BookId.urdu, '/urdu', 'اردو کتاب', 'حروف سے جملوں تک', Icons.menu_book_rounded),
    _Book(BookId.language, '/languages', 'भाषाएँ', 'दुनिया की 10 भाषाएँ', Icons.public_rounded),
    _Book(BookId.coding, '/coding', 'कोडिंग', 'C, C++, Java, Python', Icons.code_rounded),
    _Book(BookId.realWorld, '/extras', 'असली दुनिया', 'पढ़ने की अभ्यास', Icons.newspaper_rounded),
    _Book(BookId.game, '/extras', 'खेल और क्विज़', 'मज़ेदार सीख', Icons.sports_esports_rounded),
  ];

  @override
  Widget build(BuildContext context) {
    final state = context.watch<AppState>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('पहला कदम'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.checklist_rounded),
            tooltip: 'प्रगति',
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute<void>(builder: (_) => const ProgressScreen()),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.settings_rounded),
            tooltip: 'सेटिंग',
            onPressed: () => context.push('/settings'),
          ),
          const SizedBox(width: 4),
        ],
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(16, 10, 16, 26),
          children: <Widget>[
            _StreakCard(state: state),
            const SectionTitle('किताबें चुनो', icon: Icons.auto_stories_rounded),
            for (final b in _books)
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: ChapterCard(
                  title: b.title,
                  subtitle: b.subtitle,
                  icon: b.icon,
                  color: colorFor(b.id),
                  done: state.bookProgress(b.id) >= 1,
                  onTap: () => context.push(b.route),
                ),
              ),
            const SizedBox(height: 6),
            Text(
              'सभी किताबें पूरी तरह ऑफ़लाइन हैं — इंटरनेट की ज़रूरत नहीं।',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12.5,
                color: Theme.of(context).colorScheme.outline,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _StreakCard extends StatelessWidget {
  const _StreakCard({required this.state});

  final AppState state;

  @override
  Widget build(BuildContext context) {
    final ratio = state.overallProgress;
    final scheme = Theme.of(context).colorScheme;
    return Card(
      color: scheme.primaryContainer,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                const Text('🔥', style: TextStyle(fontSize: 26)),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    '${state.streak} दिन की लय बनी',
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
                  ),
                ),
                Text(
                  '${(ratio * 100).round()}%',
                  style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w900),
                ),
              ],
            ),
            const SizedBox(height: 12),
            ProgressBarLine(value: ratio, color: scheme.primary, height: 14),
            const SizedBox(height: 6),
            Text(
              '${state.doneTotal} अध्याय पूरे हुए',
              style: TextStyle(fontSize: 13, color: scheme.onPrimaryContainer),
            ),
          ],
        ),
      ),
    );
  }
}

class _Book {
  const _Book(this.id, this.route, this.title, this.subtitle, this.icon);

  final BookId id;
  final String route;
  final String title;
  final String subtitle;
  final IconData icon;
}
