import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';
import 'package:plant_deseases_client/features/buttons/login_button.dart';
import 'package:plant_deseases_client/features/textfield/email_textfield.dart';
import 'package:plant_deseases_client/features/textfield/password_textfield.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 3,
            width: MediaQuery.of(context).size.height / 1.2,
            child: Lottie.asset("assets/lottie/login.json"),
          ),
          const Text(
            'Login',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          EmailTexField(
            controller: emailController,
          ),
          PasswordTextField(
            controller: passwordController,
          ),
          LoginButton()
        ],
      ),
    );
  }
}
