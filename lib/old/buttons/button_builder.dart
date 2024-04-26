import 'package:flutter/material.dart';
import 'package:plant_deseases_client/old/style/palette.dart';

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
    this.padding,
    this.margin,
    this.borderWidth,
  });
  final double width;
  final double height;
  final double elevation;
  final double? borderWidth;
  final Color? backgroundColor;
  final Color borderColor;
  final double borderRadius;
  final Widget? child;
  final void Function()? onPressed;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      margin: margin,
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
                width: borderWidth ?? 1.0,
              ),
            ),
          ),
        ),
        child: child,
      ),
    );
  }
}
