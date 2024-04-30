import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

const Map<int, Color> primarySwatch = {
  50: Color.fromRGBO(255, 207, 68, .1),
  100: Color.fromRGBO(255, 207, 68, .2),
  200: Color.fromRGBO(255, 207, 68, .3),
  300: Color.fromRGBO(255, 207, 68, .4),
  400: Color.fromRGBO(255, 207, 68, .5),
  500: Color.fromRGBO(255, 207, 68, .6),
  600: Color.fromRGBO(255, 207, 68, .7),
  700: Color.fromRGBO(255, 207, 68, .8),
  800: Color.fromRGBO(255, 207, 68, .9),
  900: Color.fromRGBO(255, 207, 68, 1),
};

class Palette {
  static Color get primary =>
      SchedulerBinding.instance.platformDispatcher.platformBrightness ==
              Brightness.dark
          ? const Color.fromARGB(255, 46, 100, 66)
          : const Color.fromARGB(255, 46, 100, 66);
  static Color get secundary =>
      SchedulerBinding.instance.platformDispatcher.platformBrightness ==
              Brightness.dark
          ? const Color.fromARGB(255, 181, 121, 69)
          : const Color.fromARGB(255, 181, 121, 69);
  static Color get lighGreen =>
      SchedulerBinding.instance.platformDispatcher.platformBrightness ==
              Brightness.dark
          ? const Color.fromARGB(255, 207, 214, 210)
          : const Color.fromARGB(255, 207, 214, 210);
  static Color get white =>
      SchedulerBinding.instance.platformDispatcher.platformBrightness ==
              Brightness.dark
          ? Colors.white
          : Colors.white;
  static Color get deselected =>
      SchedulerBinding.instance.platformDispatcher.platformBrightness ==
              Brightness.dark
          ? const Color.fromARGB(255, 215, 215, 215)
          : const Color.fromARGB(255, 215, 215, 215);
}

// MaterialColor primarySwatch = const MaterialColor(
//   0xFF2e6442,
//   <int, Color>{
//     50: Color.fromRGBO(255, 207, 68, .1),
//     100: Color.fromRGBO(255, 207, 68, .2),
//     200: Color.fromRGBO(255, 207, 68, .3),
//     300: Color.fromRGBO(255, 207, 68, .4),
//     400: Color.fromRGBO(255, 207, 68, .5),
//     500: Color.fromRGBO(255, 207, 68, .6),
//     600: Color.fromRGBO(137, 207, 90, .4),
//     700: Color.fromRGBO(137, 207, 90, .3),
//     800: Color.fromRGBO(137, 207, 90, .2),
//     900: Color.fromRGBO(137, 207, 90, .1),
//   },
// );

MaterialColor primaryColor = MaterialColor(0xFFFFCF44, primarySwatch);
const int primaryColorDark = 0xFFFD9725;
