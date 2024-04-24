import 'package:amplify_authenticator/amplify_authenticator.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:path/path.dart';
import 'package:plant_deseases_client/common/navigation/router/router.dart';
import 'package:plant_deseases_client/common/utils/colors.dart' as colors;
import 'package:plant_deseases_client/features/buttons/generic_button.dart';
import 'package:plant_deseases_client/src/login/login.dart';

class App extends StatelessWidget {
  const App({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Authenticator(
      // authenticatorBuilder: (BuildContext context, AuthenticatorState state) {
      //   switch (state.currentStep) {
      //     case AuthenticatorStep.signIn:
      //       return SignInForm();
      //     // Login();
      //     default:
      //       return const SizedBox.shrink();
      //   }
      // },
      child: MaterialApp.router(
        routerConfig: router,
        // builder: Authenticator.builder(),
        theme: ThemeData(
          colorScheme:
              ColorScheme.fromSwatch(primarySwatch: colors.primaryColor)
                  .copyWith(
            background: Colors.white,
          ),
        ),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key, this.title});
  final String? title;

  @override
  State<HomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(widget.title ?? ''),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            GenericButton(
              title: "Llm",
              onPressed: () => context.go('/llm'),
              margin: const EdgeInsets.only(bottom: 10),
            ),
            GenericButton(
              title: "Signup",
              onPressed: () => context.go('/login'),
              margin: const EdgeInsets.only(bottom: 10),
            ),
            // GenericButton(
            //   title: "Signup",
            //   onPressed: () => context.go('/signup'),
            // ),
          ],
        ),
      ),
    );
  }
}
