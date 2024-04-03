import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:plant_deseases_client/features/buttons/generic_button.dart';
import 'package:plant_deseases_client/features/textfield/email_textfield.dart';
import 'package:plant_deseases_client/style/palette.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 3,
            width: MediaQuery.of(context).size.height / 1.2,
            child: Lottie.asset("assets/lottie/login.json"),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: const Text(
                'Password \nDimenticata',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          EmailTexField(
            controller: emailController,
          ),
          GenericButton(
            title: 'Reset Password',
            width: MediaQuery.of(context).size.width - 30,
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Sei già registrato? ',
                style: TextStyle(
                  fontSize: 10,
                ),
              ),
              GestureDetector(
                child: Text(
                  'Effettua il Login',
                  style: TextStyle(
                      fontSize: 10,
                      color: Palette.primary,
                      fontWeight: FontWeight.bold),
                ),
                onTap: () => context.go('/login'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
