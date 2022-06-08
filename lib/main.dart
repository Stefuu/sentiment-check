import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:worth_the_read/pages/home.dart';
import 'package:worth_the_read/pages/score.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);

  static const String title = 'Sentiment Check';

  @override
  Widget build(BuildContext context) => MaterialApp.router(
        routeInformationParser: _router.routeInformationParser,
        routerDelegate: _router.routerDelegate,
        title: title,
      );

  final GoRouter _router = GoRouter(
    routes: <GoRoute>[
      GoRoute(
        path: '/',
        builder: (
          BuildContext context,
          GoRouterState state,
        ) =>
            HomePage(appTitle: title),
      ),
      GoRoute(
        path: '/score',
        builder: (
          BuildContext context,
          GoRouterState state,
        ) =>
            const ScorePage(
          appTitle: title,
        ),
      ),
    ],
  );
}
