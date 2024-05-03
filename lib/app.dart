import 'package:amplify_authenticator/amplify_authenticator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:plant_deseases_client/common/navigation/router/router.dart';
import 'package:plant_deseases_client/common/services/system_service.dart';
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
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final systemProvider = ref.watch(systemServiceProvider);
        return Authenticator(
          child: MaterialApp.router(
            routerConfig: router,
            themeMode: systemProvider ? ThemeMode.light : ThemeMode.dark,
            theme: ThemeData(
              iconTheme: IconThemeData(
                color: Palette.primary,
              ),
              colorScheme: ColorScheme.fromSwatch(
                primarySwatch: colors.primaryColor,
              ).copyWith(
                background: systemProvider ? Palette.white : Colors.black,
              ),
              appBarTheme: AppBarTheme(
                backgroundColor: systemProvider ? Palette.white : Colors.black,
                foregroundColor: systemProvider ? Colors.black : Colors.white,
              ),
            ),
          ),
        );
      },
    );
  }
}
