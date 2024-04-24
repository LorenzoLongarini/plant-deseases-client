import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

class Login extends StatefulWidget {
  const Login({
    super.key,
  });

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  SignupData? _signupData;

  Future<String> _onSignUp(BuildContext context, SignupData data) async {
    try {
      await Amplify.Auth.signUp(
        username: data.name!,
        password: data.password!,
        options: SignUpOptions(
          userAttributes: {
            AuthUserAttributeKey.email: data.name!,
          },
        ),
      );
      _signupData = data;
      return '';
    } on AuthException catch (e) {
      return 'Error signing up: ${e.message}';
    }
    // return 'There was a problem signing up. Please try again.';
  }

  Future<String> _onLogin(BuildContext context, SignupData data) async {
    try {
      final result = await Amplify.Auth.signUp(
        username: data.name!,
        password: data.password!,
        options: SignUpOptions(
          userAttributes: {
            AuthUserAttributeKey.email: data.name!,
          },
        ),
      );
      return 'Sign up result: $result';
    } on AuthException catch (e) {
      return 'Error signing up: ${e.message}';
    }
  }

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      //TODO: centralize colors
      theme: LoginTheme(
        // logoWidth: 30,
        beforeHeroFontSize: 32,
        primaryColor: const Color.fromRGBO(137, 207, 90, .5),
        accentColor: const Color.fromRGBO(255, 207, 68, .2),
        // headerMargin: 0.0,
        // cardInitialHeight: 600,
        // authButtonPadding: EdgeInsets.symmetric(vertical: 0),

        /// Default: deviceSize.height / 2 - cardInitialHeight == 300 / 2
        cardTopPosition: MediaQuery.of(context).size.height / 5,
        buttonTheme: const LoginButtonTheme(
          backgroundColor: Color.fromRGBO(72, 119, 42, 1),
        ),

        cardTheme: const CardTheme(
            color: Colors.white, surfaceTintColor: Colors.white),
      ),
      headerWidget: Align(
        alignment: Alignment.center,
        child: SizedBox(
          height: 220,
          child: Lottie.asset("assets/lottie/login.json"),
        ),
      ),
      // logo: AssetImage("assets/img/login.png"),
      onLogin: (LoginData) {},
      onSignup: (SignupData data) => _onSignUp(context, data),
      onSubmitAnimationCompleted: () =>
          context.go('/login/confirm', extra: _signupData),
      // termsOfService: [TermOfService(id: '1', mandatory: true, text: 'prova')],
      onRecoverPassword: (String) {},
    );
  }
}
