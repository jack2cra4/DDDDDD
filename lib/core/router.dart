import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../screens/books/coding_book.dart';
import '../screens/books/english_book.dart';
import '../screens/books/extras_book.dart';
import '../screens/books/hindi_book.dart';
import '../screens/books/languages_book.dart';
import '../screens/books/math_book.dart';
import '../screens/books/urdu_book.dart';
import '../screens/home.dart';
import '../screens/settings.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) => const SplashScreen(),
    ),
    GoRoute(
      path: '/auth',
      builder: (BuildContext context, GoRouterState state) => const AuthGateScreen(),
    ),
    GoRoute(
      path: '/home',
      builder: (BuildContext context, GoRouterState state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/settings',
      builder: (BuildContext context, GoRouterState state) => const SettingsScreen(),
    ),
    GoRoute(
      path: '/hindi',
      builder: (BuildContext context, GoRouterState state) => const HindiBookScreen(),
    ),
    GoRoute(
      path: '/english',
      builder: (BuildContext context, GoRouterState state) => const EnglishBookScreen(),
    ),
    GoRoute(
      path: '/math',
      builder: (BuildContext context, GoRouterState state) => const MathBookScreen(),
    ),
    GoRoute(
      path: '/urdu',
      builder: (BuildContext context, GoRouterState state) => const UrduBookScreen(),
    ),
    GoRoute(
      path: '/languages',
      builder: (BuildContext context, GoRouterState state) => const LanguagesBookScreen(),
    ),
    GoRoute(
      path: '/coding',
      builder: (BuildContext context, GoRouterState state) => const CodingBookScreen(),
    ),
    GoRoute(
      path: '/extras',
      builder: (BuildContext context, GoRouterState state) => const ExtrasBookScreen(),
    ),
  ],
);
