import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:plant_deseases_client/common/navigation/router/routes.dart';

class Login extends StatefulWidget {
  const Login({
    super.key,
  });

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  SignupData? _signupData;
  bool _isSignedIn = false;

  @override
  void initState() {
    super.initState();
  }

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
  }

  Future<String> _onLogin(BuildContext context, LoginData data) async {
    try {
      final res = await Amplify.Auth.signIn(
          username: data.name, password: data.password);
      _isSignedIn = res.isSignedIn;
      return '';
    } on AuthException catch (e) {
      return 'Error login: ${e.message}';
    }
  }

  Future<String> _onRecoverPassword(String email) async {
    try {
      final res = await Amplify.Auth.resetPassword(username: email);
      if (res.nextStep.updateStep.name == 'confirmResetPasswordWithCode') {
        context.goNamed(AppRoute.reset.name, extra: email);
      }
      return '';
    } on AuthException catch (e) {
      return 'Error reset password: ${e.message}';
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      key: widget.key,
      //TODO: centralize colors
      theme: LoginTheme(
        // logoWidth: 30,
        // beforeHeroFontSize: 32,
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
      onLogin: (LoginData data) => _onLogin(context, data),
      onSignup: (SignupData data) => _onSignUp(context, data),
      onSubmitAnimationCompleted: () {
        _isSignedIn
            ? context.goNamed(AppRoute.home.name)
            : context.goNamed(AppRoute.confirm.name, extra: _signupData);
      },
      // termsOfService: [TermOfService(id: '1', mandatory: true, text: 'prova')],
      onRecoverPassword: (String data) {
        return _onRecoverPassword(data);
      },
    );
  }
}
