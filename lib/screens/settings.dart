import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../core/app_state.dart';
import '../core/tts_service.dart';
import 'books/book_shell.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<AppState>();
    final tts = context.watch<TtsService>();
    final scheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(title: const Text('सेटिंग')),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 30),
          children: <Widget>[
            if (!state.signedIn)
              Card(
                child: ListTile(
                  leading: const Icon(Icons.person_add_alt_rounded),
                  title: const Text('लॉगिन करें'),
                  subtitle: const Text('अपनी प्रगति फ़ोन से सिंच करें'),
                  trailing: const Icon(Icons.chevron_right_rounded),
                  onTap: () => context.go('/auth'),
                ),
              )
            else
              Card(
                child: ListTile(
                  leading: CircleAvatar(
                    child: Text(
                      state.displayName.isEmpty ? '👤' : state.displayName.characters.first,
                    ),
                  ),
                  title: Text(state.displayName.isEmpty ? 'सीखने वाले' : state.displayName),
                  subtitle: Text(
                    state.guest
                        ? 'गेस्ट मोड'
                        : [if (state.phone.isNotEmpty) state.phone, if (state.email.isNotEmpty) state.email]
                            .join(' • '),
                  ),
                  trailing: TextButton(
                    onPressed: state.signOut,
                    child: const Text('लॉग आउट'),
                  ),
                ),
              ),
            const SizedBox(height: 16),
            _header(context, '🎨 दिखावट'),
            Card(
              child: Column(
                children: <Widget>[
                  RadioListTile<ThemeMode>(
                    value: ThemeMode.system,
                    groupValue: state.themeMode,
                    onChanged: (m) => state.setThemeMode(m ?? ThemeMode.system),
                    title: const Text('सिस्टम के अनुसार'),
                    secondary: const Icon(Icons.brightness_auto_rounded),
                  ),
                  RadioListTile<ThemeMode>(
                    value: ThemeMode.light,
                    groupValue: state.themeMode,
                    onChanged: (m) => state.setThemeMode(m ?? ThemeMode.light),
                    title: const Text('हमेशा दिन'),
                    secondary: const Icon(Icons.light_mode_rounded),
                  ),
                  RadioListTile<ThemeMode>(
                    value: ThemeMode.dark,
                    groupValue: state.themeMode,
                    onChanged: (m) => state.setThemeMode(m ?? ThemeMode.dark),
                    title: const Text('हमेशा रात'),
                    secondary: const Icon(Icons.dark_mode_rounded),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            _header(context, '🔠 अक्षर का आकार'),
            Card(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 12, 16, 6),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        const Text('छोटा', style: TextStyle(fontSize: 13)),
                        const Spacer(),
                        Text(
                          '${(state.textScale * 100).round()}%',
                          style: const TextStyle(fontWeight: FontWeight.w800),
                        ),
                        const Spacer(),
                        const Text('बड़ा', style: TextStyle(fontSize: 18)),
                      ],
                    ),
                    Slider(
                      value: state.textScale,
                      min: 0.9,
                      max: 1.7,
                      divisions: 8,
                      label: '${(state.textScale * 100).round()}%',
                      onChanged: state.setTextScale,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(bottom: 8),
                      child: Text(
                        'नमूना: यह लिखावट बच्चों के लिए साफ़ है।',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            _header(context, '🔊 आवाज़'),
            Card(
              child: Column(
                children: <Widget>[
                  ListTile(
                    leading: const Icon(Icons.speed_rounded),
                    title: const Text('बोलने की रफ़्तार'),
                    subtitle: Slider(
                      value: state.voiceRate,
                      min: 0.2,
                      max: 1.0,
                      divisions: 8,
                      onChanged: (v) {
                        state.setVoiceRate(v);
                        tts.setRate(v);
                      },
                    ),
                    trailing: Text(
                      state.voiceRate.toStringAsFixed(2),
                      style: const TextStyle(fontWeight: FontWeight.w800),
                    ),
                  ),
                  SwitchListTile(
                    secondary: const Icon(Icons.repeat_rounded),
                    title: const Text('दोहराएँ'),
                    subtitle: const Text('वही बात फिर से बोले'),
                    value: state.repeat,
                    onChanged: (v) {
                      state.setRepeat(v);
                      tts.setRepeat(v);
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.volume_up_rounded),
                    title: const Text('आवाज़ जाँचो'),
                    subtitle: Text(
                      'इंजन: ${tts.ready ? 'तैयार' : 'लोड हो रहा है'} • भाषा: ${tts.lang}',
                    ),
                    trailing: IconButton(
                      icon: const Text('🔊', style: TextStyle(fontSize: 22)),
                      onPressed: () => tts.speakRaw(
                        'नमस्ते, मैं पहला कदम हूँ।',
                        lang: 'hi-IN',
                        force: true,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            _header(context, '📊 प्रगति'),
            Card(
              child: Column(
                children: <Widget>[
                  ListTile(
                    leading: const Icon(Icons.insights_rounded),
                    title: const Text('मेरी प्रगति'),
                    subtitle: Text('${state.doneTotal} अध्याय पूरे • ${state.streak} दिन'),
                    trailing: const Icon(Icons.chevron_right_rounded),
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute<void>(builder: (_) => const ProgressScreen()),
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.restart_alt_rounded, color: scheme.error),
                    title: Text(
                      'सारी प्रगति मिटाएँ',
                      style: TextStyle(color: scheme.error),
                    ),
                    onTap: () => _confirmReset(context, state),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: Text(
                'पहला कदम • v1.0.0\nऑफ़लाइन — कोई इंटरनेट नहीं चाहिए',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12, color: scheme.outline),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _header(BuildContext context, String t) => Padding(
        padding: const EdgeInsets.fromLTRB(4, 8, 4, 8),
        child: Text(
          t,
          style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w900),
        ),
      );

  Future<void> _confirmReset(BuildContext context, AppState state) async {
    final ok = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('सारी प्रगति मिटाएँ?'),
        content: const Text('यह वापस नहीं आएगी।'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('रहने दो'),
          ),
          FilledButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('हाँ, मिटाओ'),
          ),
        ],
      ),
    );
    if (ok == true) state.reset();
  }
}
