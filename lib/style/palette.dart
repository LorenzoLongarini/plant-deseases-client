import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

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
}
