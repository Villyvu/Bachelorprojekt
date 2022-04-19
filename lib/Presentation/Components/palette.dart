import 'package:flutter/material.dart';
class Palette {
  static const MaterialColor kTrueBlue = const MaterialColor(
    0xFF0192CE, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    const <int, Color>{
      50: const Color(0xff0183b9),//10%
      100: const Color(0xff0175a5),//20%
      200: const Color(0xff016690),//30%
      300: const Color(0xff01587c),//40%
      400: const Color(0xff014967),//50%
      500: const Color(0xff003a52),//60%
      600: const Color(0xff002c3e),//70%
      700: const Color(0xff001d29),//80%
      800: const Color(0xff000f15),//90%
      900: const Color(0xff000000),//100%
    },
  );
}