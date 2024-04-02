import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:plant_deseases_client/providers/llm_provider.dart';
import 'package:plant_deseases_client/src/llm_view.dart';
import 'package:plant_deseases_client/src/navigation/router.dart';
import 'package:plant_deseases_client/src/tasks.dart';
import 'package:plant_deseases_client/providers/todo_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

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
            primarySwatch: Colors.purple,
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
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(widget.title ?? ''),
        centerTitle: true,
      ),
      body: Column(
        children: [
          TextButton(
            onPressed: () => context.go('/llm'),
            child: const Text('Llm'),
          ),
          TextButton(
            onPressed: () => context.go('/login'),
            child: const Text('Login'),
          ),
        ],
      ),
    );
  }
}
