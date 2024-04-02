import 'package:flutter/material.dart';
import 'package:plant_deseases_client/features/buttons/button_builder.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    super.key,
    this.title = "Login",
    this.onPressed,
  });
  final String title;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ButtonBuilder(
      height: 50,
      width: MediaQuery.of(context).size.width - 30,
      borderRadius: 5,
      onPressed: onPressed,
      child: Text(
        title,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
