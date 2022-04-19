import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Views/main_menu.dart';
import './Components/palette.dart';

//TO-DO:
//Extract cards fra de klasse de bliver brugt (se JustRandom)

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Palette.kTrueBlue,
        textTheme: GoogleFonts.robotoTextTheme(Theme.of(context).textTheme),
      ),
      home: Main_menu(),
    );
  }
}