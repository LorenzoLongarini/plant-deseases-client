import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:plant_deseases_client/features/buttons/generic_button.dart';
import 'package:plant_deseases_client/providers/llm_provider.dart';
import 'package:plant_deseases_client/src/navigation/router.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

MaterialColor mainAppColor = const MaterialColor(
  0xFF2e6442,
  <int, Color>{
    50: Color(0xFF89cfbe),
    100: Color(0xFF89cfbe),
    200: Color(0xFF89cfbe),
    300: Color(0xFF89cfbe),
    400: Color(0xFF89cfbe),
    500: Color(0xFF89cfbe),
    600: Color(0xFF89cfbe),
    700: Color(0xFF89cfbe),
    800: Color(0xFF89cfbe),
    900: Color(0xFF89cfbe),
  },
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
        value: LlmProvider(),
        child: MaterialApp.router(
          routerConfig: router,
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: mainAppColor,
          ),
          // home: const HomePage(title: ''),
        ));
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
              title: "Login",
              onPressed: () => context.go('/login'),
              margin: const EdgeInsets.only(bottom: 10),
            ),
            GenericButton(
              title: "Signup",
              onPressed: () => context.go('/signup'),
            ),
          ],
        ),
      ),
    );
  }
}
