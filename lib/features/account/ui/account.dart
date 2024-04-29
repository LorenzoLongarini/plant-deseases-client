import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:plant_deseases_client/app.dart';
import 'package:plant_deseases_client/common/navigation/router/routes.dart';
import 'package:plant_deseases_client/common/ui/custom_widgets/list_tile/list_tile.dart';
import 'package:plant_deseases_client/features/account/utils/constants.dart';

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  // AuthUser? _user;
  bool isDarkMode =
      SchedulerBinding.instance.platformDispatcher.platformBrightness ==
          Brightness.dark;

  @override
  void initState() {
    super.initState();
    // .then(
    //   (user) => setState(() {
    //     _user = user;
    //   }),
    // );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Amplify.Auth.getCurrentUser(),
        builder: (context, snapshot) {
          // _user = snapshot;
          return !snapshot.hasData
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Scaffold(
                  appBar: AppBar(
                    automaticallyImplyLeading: false,
                    title: const Text('Account'),
                    actions: <Widget>[
                      IconButton(
                        icon: Icon(isDarkMode
                            ? Icons.brightness_2
                            : Icons.brightness_4),
                        onPressed: () {
                          // isDarkMode ? App.switch (expression) {
                          //   pattern => value,
                          // }
                          // ? App.of(context).changeTheme(ThemeMode.light)
                          // : MyApp.of(context).changeTheme(ThemeMode.dark);
                          setState(() {
                            isDarkMode = !isDarkMode;
                          });
                        },
                      ),
                    ],
                  ),
                  body: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const CircleAvatar(
                            radius: 70,
                            backgroundColor: Color.fromARGB(255, 64, 120, 27),
                            child: CircleAvatar(
                              radius: 65,
                              backgroundImage:
                                  AssetImage('assets/img/default-avatar.jpg'),
                            ),
                          ),
                          Text(
                            snapshot.data!.username,
                            style: const TextStyle(
                                fontSize: 10,
                                color: Color.fromARGB(255, 210, 210, 210)),
                          ),
                        ],
                      ),

                      // AccountOptions.values.map((e) => null)
                      // ListView.separated()
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const CustomListTile(
                            icon: Icons.person,
                            text: 'My Profile',
                          ),
                          const CustomListTile(
                            icon: Icons.settings,
                            text: 'Settings',
                          ),
                          const CustomListTile(
                            icon: Icons.chat_bubble,
                            text: 'FAQs',
                          ),
                          const CustomListTile(
                            icon: Icons.person,
                            text: 'Info',
                          ),
                          MaterialButton(
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Logout',
                                  style: TextStyle(color: Colors.red),
                                ),
                                //   SizedBox(
                                //     width: 20,
                                //   ),
                                //   Icon(
                                //     Icons.logout,
                                //     color: Colors.red,
                                //   )
                              ],
                            ),
                            onPressed: () {
                              Amplify.Auth.signOut()
                                  .then(
                                    (value) => {
                                      context.goNamed(AppRoute.login.name),
                                    },
                                  )
                                  .then((_) => false);
                            },
                          ),
                        ],
                      ),
                    ],
                  )

                  // Center(
                  //   child: Text(
                  //     _user == null ? 'Nessun Account trovato' : _user!.username,
                  //   ),
                  // ),
                  );
        });
  }
}
