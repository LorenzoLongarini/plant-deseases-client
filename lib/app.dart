import 'package:amplify_authenticator/amplify_authenticator.dart';
import 'package:flutter/material.dart';
import 'package:plant_deseases_client/common/navigation/router/router.dart';
import 'package:plant_deseases_client/common/utils/colors.dart' as colors;
import 'package:plant_deseases_client/common/utils/colors.dart';

class App extends StatefulWidget {
  const App({
    super.key,
  });

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  ThemeMode _themeMode = ThemeMode.system;
  void changeTheme(ThemeMode themeMode) {
    setState(() {
      _themeMode = themeMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Authenticator(
      child: MaterialApp.router(
        routerConfig: router,
        themeMode: _themeMode,
        theme: ThemeData(
          iconTheme: IconThemeData(
            color: Palette.primary,
          ),
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: colors.primaryColor,
          ).copyWith(
            background: Palette.white,
          ),
        ),
      ),
    );
  }
}
