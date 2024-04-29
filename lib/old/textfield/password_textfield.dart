import 'package:flutter/material.dart';
import 'package:plant_deseases_client/common/ui/custom_widgets/textfield_builder.dart';
import 'package:plant_deseases_client/old/style/palette.dart';

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({
    super.key,
    this.title = "Password",
    required this.controller,
  });
  final String title;
  final TextEditingController controller;

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return TextFieldBuilder(
      controller: widget.controller,
      labelText: widget.title,
      prefixIcon: Align(
        widthFactor: 1,
        heightFactor: 1,
        child: Icon(
          Icons.lock,
          color: Palette.primary,
        ),
      ),
      obscureText: obscureText,
      suffixIcon: IconButton(
        splashRadius: 0.1,
        icon: Icon(
          obscureText ? Icons.visibility : Icons.visibility_off,
          color: Palette.primary,
        ),
        onPressed: () => setState(() {
          obscureText = !obscureText;
        }),
      ),
    );
  }
}
