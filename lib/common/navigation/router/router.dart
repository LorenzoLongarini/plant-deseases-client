import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:go_router/go_router.dart';
import 'package:plant_deseases_client/app.dart';
import 'package:plant_deseases_client/common/ui/confirm.dart';
import 'package:plant_deseases_client/common/ui/login.dart';
// import 'package:plant_deseases_client/features/signup.dart';
import 'package:plant_deseases_client/main.dart';
import 'package:plant_deseases_client/src/llm_view.dart';

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
            routes: <RouteBase>[
              GoRoute(
                path: 'confirm',
                builder: (BuildContext context, GoRouterState state) {
                  SignupData signupData = state.extra as SignupData;
                  return ConfirmScreen(signupData: signupData);
                },
              ),
            ]),
        // GoRoute(
        //   path: 'reset',
        //   builder: (BuildContext context, GoRouterState state) {
        //     return const ResetPassword();
        //   },
        // ),
        // GoRoute(
        //   path: 'signup',
        //   builder: (BuildContext context, GoRouterState state) {
        //     return const Login();
        //   },
        // ),
      ],
    ),
  ],
  errorBuilder: (context, state) => Scaffold(
    body: Center(
      child: Text(state.error.toString()),
    ),
  ),
);
