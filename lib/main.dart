import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app.dart';
import 'core/app_state.dart';
import 'core/tts_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final state = await AppState.load();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<AppState>.value(value: state),
        ChangeNotifierProvider<TtsService>(
          create: (_) => TtsService()..applyFrom(state),
        ),
      ],
      child: const PehlaKadamApp(),
    ),
  );
}
