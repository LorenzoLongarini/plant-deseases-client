import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:plant_deseases_client/common/navigation/router/routes.dart';
import 'package:plant_deseases_client/common/utils/colors.dart';
import 'package:plant_deseases_client/common/utils/env_vars.dart';

class Login extends StatefulWidget {
  const Login({
    super.key,
  });

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  Future<String?> _onSignUp(BuildContext context, SignupData data) async {
    try {
      return await Amplify.Auth.signUp(
        username: data.name!,
        password: data.password!,
        options: SignUpOptions(
          userAttributes: {
            AuthUserAttributeKey.email: data.name!,
          },
        ),
      ).then((value) => null);
    } on AuthException catch (e) {
      return 'Error signing up: ${e.message}';
    }
  }

  Future<String?> _onLogin(BuildContext context, LoginData data) async {
    try {
      final session = await Amplify.Auth.fetchAuthSession();
      if (session.isSignedIn) {
        Amplify.Auth.signOut().then((value) async {
          return await Amplify.Auth.signIn(
            username: data.name,
            password: data.password,
          );
        }).then((value) => null);
      } else {
        return await Amplify.Auth.signIn(
          username: data.name,
          password: data.password,
        ).then((value) => null);
      }
    } on AuthException catch (e) {
      return 'Error login: ${e.message}';
    }
    return null;
  }

  Future<String?> _onRecoverPassword(String email) async {
    try {
      return await Amplify.Auth.resetPassword(username: email)
          .then((value) => null);
    } on AuthException catch (e) {
      return 'Error reset password: ${e.message}';
    }
  }

  Future<String?> _onConfirmRecover(
      {required LoginData data, required String code}) async {
    try {
      return await Amplify.Auth.confirmResetPassword(
        username: data.name,
        newPassword: data.password,
        confirmationCode: code,
      ).then((value) => null);
    } on AuthException catch (e) {
      return 'Error confirm recover: ${e.message}';
    }
  }

  Future<String?> _verifyCode({
    required LoginData data,
    required String code,
  }) async {
    try {
      final res = await Amplify.Auth.confirmSignUp(
        username: data.name,
        confirmationCode: code,
      );
      if (res.isSignUpComplete) {
        return await Amplify.Auth.signIn(
                username: data.name, password: data.password)
            .then((value) => null);
      }
      return null;
    } on AuthException catch (e) {
      return 'Error verify code: ${e.message}';
    }
  }

  Future<String?> _resendCode(SignupData data) async {
    try {
      return await Amplify.Auth.resendSignUpCode(username: data.name!)
          .then((value) => null);
    } on AuthException catch (e) {
      return 'Error resend code: ${e.message}';
    }
  }

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      key: widget.key,
      savedEmail: EnvVars.username,
      savedPassword: EnvVars.password,
      theme: LoginTheme(
        pageColorLight: Palette.white,
        cardTopPosition: MediaQuery.of(context).size.height / 5,
        inputTheme: InputDecorationTheme(
          fillColor: Palette.lightGreen,
          labelStyle: TextStyle(
            color: Palette.primary,
          ),
          prefixIconColor: Palette.primary,
          suffixIconColor: Palette.primary,
        ),
        cardTheme: CardTheme(
          color: Palette.white,
          shadowColor: Palette.white,
          surfaceTintColor: Palette.white,
        ),
      ),
      headerWidget: Align(
        alignment: Alignment.center,
        child: SizedBox(
          height: 220,
          child: Lottie.asset("assets/lottie/login.json"),
        ),
      ),
      onLogin: (LoginData data) {
        return _onLogin(context, data);
      },
      onSignup: (SignupData data) {
        return _onSignUp(context, data);
      },
      onConfirmSignup: (code, data) async {
        return _verifyCode(
          data: data,
          code: code,
        );
      },
      onRecoverPassword: (String data) {
        return _onRecoverPassword(data);
      },
      onConfirmRecover: (code, data) async {
        return _onConfirmRecover(code: code, data: data);
      },
      onResendCode: (data) async {
        return _resendCode(data);
      },
      onSubmitAnimationCompleted: () async {
        final session = await Amplify.Auth.fetchAuthSession();

        session.isSignedIn
            ? context.goNamed(AppRoute.home.name)
            : context.goNamed(
                AppRoute.login.name,
              );
      },
    );
  }
}
