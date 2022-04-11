import 'package:flutter/material.dart';
class Palette {
  static const MaterialColor kTrueBlue = const MaterialColor(
    0xff0091cf, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    const <int, Color>{
      50: const Color(0xff0083ba),//10%
      100: const Color(0xff0074a6),//20%
      200: const Color(0xff006691),//30%
      300: const Color(0xff00577c),//40%
      400: const Color(0xff004968),//50%
      500: const Color(0xff003a53),//60%
      600: const Color(0xff002b3e),//70%
      700: const Color(0xff001d29),//80%
      800: const Color(0xff000e15),//90%
      900: const Color(0xff000000),//100%
    },
  );
}