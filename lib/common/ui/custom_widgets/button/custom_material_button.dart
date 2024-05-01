import 'package:flutter/material.dart';
import 'package:plant_deseases_client/common/utils/colors.dart';

class CustomMaterialButton extends StatelessWidget {
  const CustomMaterialButton({
    super.key,
    this.onPressed,
    this.isEnabled = true,
  });
  final void Function()? onPressed;
  final bool? isEnabled;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 40,
      minWidth: 120,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      onPressed: isEnabled! ? onPressed : null,
      elevation: 4,
      color: Palette.primary,
      disabledColor: Palette.disabledButton,
      child: Text(
        'RESET',
        style: TextStyle(
          color: Palette.white,
          fontSize: 14,
        ),
      ),
    );
  }
}
