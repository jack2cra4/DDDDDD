import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/app_state.dart';
import 'core/router.dart';
import 'core/theme.dart';

class PehlaKadamApp extends StatelessWidget {
  const PehlaKadamApp({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<AppState>();
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'पहला कदम',
      theme: buildTheme(Brightness.light, state.textScale),
      darkTheme: buildTheme(Brightness.dark, state.textScale),
      themeMode: state.themeMode,
      routerConfig: appRouter,
    );
  }
}
