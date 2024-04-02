import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:plant_deseases_client/main.dart';
import 'package:plant_deseases_client/src/llm_view.dart';
import 'package:plant_deseases_client/src/login/login.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const HomePage();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'llm',
          builder: (BuildContext context, GoRouterState state) {
            return const LlmView();
          },
        ),
        GoRoute(
          path: 'login',
          builder: (BuildContext context, GoRouterState state) {
            return const Login();
          },
        ),
      ],
    ),
  ],
);
