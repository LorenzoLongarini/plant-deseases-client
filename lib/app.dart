import 'package:amplify_authenticator/amplify_authenticator.dart';
import 'package:flutter/material.dart';
import 'package:plant_deseases_client/common/navigation/router/router.dart';
import 'package:plant_deseases_client/common/utils/colors.dart' as colors;

class App extends StatelessWidget {
  const App({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Authenticator(
      child: MaterialApp.router(
        routerConfig: router,
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
