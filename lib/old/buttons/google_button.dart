import 'package:flutter/material.dart';
import 'package:plant_deseases_client/old/buttons/button_builder.dart';
import 'package:plant_deseases_client/old/style/palette.dart';

class GoogleButton extends StatelessWidget {
  const GoogleButton({
    super.key,
    this.title = "Registrati con Google",
    this.onPressed,
  });
  final String title;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ButtonBuilder(
      height: 60,
      width: MediaQuery.of(context).size.width - 30,
      borderRadius: 5,
      onPressed: onPressed,
      backgroundColor: Colors.transparent,
      borderColor: Palette.primary,
      borderWidth: 1.5,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ClipRRect(
            child: Image.asset(
              'assets/img/google_logo.png',
              height: 30,
            ),
          ),
          Text(
            title,
            style: TextStyle(
              color: Palette.primary,
            ),
          ),
        ],
      ),
    );
  }
}
