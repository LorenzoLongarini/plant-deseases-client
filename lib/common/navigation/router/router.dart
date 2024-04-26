import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:go_router/go_router.dart';
import 'package:plant_deseases_client/common/navigation/router/routes.dart';
import 'package:plant_deseases_client/common/ui/base.dart';
import 'package:plant_deseases_client/features/login/ui/confirm.dart';
import 'package:plant_deseases_client/features/login/ui/login.dart';
import 'package:plant_deseases_client/old/src/llm_view.dart';

import '../../../features/login/ui/reset_pwd.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    //FIXME: need refactoring to manage base and login
    GoRoute(
      path: '/',
      name: AppRoute.login.name,
      builder: (BuildContext context, GoRouterState state) {
        return Login(key: UniqueKey());
      },
      // redirect: (context, state) async {
      //   //FIXME
      //   final user = await Amplify.Auth.fetchAuthSession();
      //   if (!user.isSignedIn) {
      //     return '/login';
      //   } else {
      //     return null;
      //   }
      // },
      routes: <RouteBase>[
        GoRoute(
          path: 'llm',
          builder: (BuildContext context, GoRouterState state) {
            return const LlmView();
          },
        ),
        GoRoute(
          path: 'base',
          name: AppRoute.home.name,
          builder: (BuildContext context, GoRouterState state) {
            return const Base();
          },
        ),
        GoRoute(
          path: 'confirm',
          name: AppRoute.confirm.name,
          builder: (BuildContext context, GoRouterState state) {
            SignupData signupData = state.extra as SignupData;
            return ConfirmScreen(signupData: signupData);
          },
        ),
        GoRoute(
          path: 'reset',
          name: AppRoute.reset.name,
          builder: (BuildContext context, GoRouterState state) {
            String email = state.extra as String;
            return ResetPassword(email: email);
          },
        ),
        // GoRoute(
        //     path: 'login',
        //     name: AppRoute.login.name,
        //     builder: (BuildContext context, GoRouterState state) {
        //       return const Login();
        //     },
        //     routes: <RouteBase>[
        //       GoRoute(
        //         path: 'confirm',
        //         name: AppRoute.confirm.name,
        //         builder: (BuildContext context, GoRouterState state) {
        //           SignupData signupData = state.extra as SignupData;
        //           return ConfirmScreen(signupData: signupData);
        //         },
        //       ),
        //     ]),
      ],
    ),
  ],
  errorBuilder: (context, state) => Scaffold(
    body: Center(
      child: Text(state.error.toString()),
    ),
  ),
);
