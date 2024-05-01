import 'package:chat_bubbles/bubbles/bubble_special_three.dart';
import 'package:flutter/material.dart';
import 'package:plant_deseases_client/common/utils/colors.dart';
import 'package:plant_deseases_client/features/chatbot/utils/constants/user_type.dart';

class BubbleMessage extends StatelessWidget {
  const BubbleMessage({
    super.key,
    required this.message,
    required this.userType,
    this.isTail = false,
    this.textStyle = const TextStyle(fontSize: 15, color: Colors.white),
  });
  final String message;
  final bool? isTail;
  final TextStyle? textStyle;
  final UserType userType;

  @override
  Widget build(BuildContext context) {
    return BubbleSpecialThree(
      text: message,
      tail: isTail!,
      textStyle: textStyle!,
      color: userType == UserType.sender ? Palette.primary : Palette.secundary,
    );
  }
}
