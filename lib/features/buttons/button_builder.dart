import 'package:flutter/material.dart';
import 'package:plant_deseases_client/style/palette.dart';

class ButtonBuilder extends StatelessWidget {
  const ButtonBuilder({
    super.key,
    this.width = 250,
    this.height = 40,
    this.elevation = 0,
    this.onPressed,
    this.borderRadius = 15,
    this.child,
    this.backgroundColor,
    this.borderColor = Colors.transparent,
  });
  final double width;
  final double height;
  final double elevation;
  final Color? backgroundColor;
  final Color borderColor;
  final double borderRadius;
  final Widget? child;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          elevation: MaterialStateProperty.all<double>(elevation),
          backgroundColor: MaterialStateProperty.all<Color>(
            backgroundColor ?? Palette.primary,
          ),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              side: BorderSide(
                color: borderColor,
              ),
            ),
          ),
        ),
        child: child,
      ),
    );
  }
}
