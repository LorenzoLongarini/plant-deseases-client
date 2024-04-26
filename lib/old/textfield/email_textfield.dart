import 'package:flutter/material.dart';
import 'package:plant_deseases_client/old/textfield/textfield_builder.dart';
import 'package:plant_deseases_client/old/style/palette.dart';

class EmailTexField extends StatelessWidget {
  const EmailTexField({
    super.key,
    required this.controller,
  });
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return TextFieldBuilder(
      controller: controller,
      labelText: 'Email',
      prefixIcon: Align(
        widthFactor: 1,
        heightFactor: 1,
        child: Icon(
          Icons.alternate_email_outlined,
          color: Palette.primary,
        ),
      ),
    );
  }
}
