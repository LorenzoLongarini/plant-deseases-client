import 'package:flutter/material.dart';
import 'package:plant_deseases_client/features/buttons/button_builder.dart';

class GenericButton extends StatelessWidget {
  const GenericButton({
    super.key,
    required this.title,
    this.onPressed,
    this.padding,
    this.margin,
    this.width,
    this.height,
  });
  final String title;
  final void Function()? onPressed;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return ButtonBuilder(
      padding: padding,
      margin: margin,
      height: height ?? 50,
      width: width ?? MediaQuery.of(context).size.width / 2.0,
      borderRadius: 5,
      onPressed: onPressed,
      child: Text(
        title,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
