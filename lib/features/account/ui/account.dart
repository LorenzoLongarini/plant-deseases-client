import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:plant_deseases_client/common/navigation/router/routes.dart';

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  AuthUser? _user;
  @override
  void initState() {
    super.initState();
    Amplify.Auth.getCurrentUser().then(
      (user) => setState(() {
        _user = user;
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.logout),
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
      body: Center(
        child: Text(
          _user == null ? 'Nessun Account trovato' : _user!.username,
        ),
      ),
    );
  }
}
