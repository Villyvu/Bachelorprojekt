import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import './Components/constants.dart';
import 'Views/main_menu.dart';

//TO-DO:
//Extract første view fra main-klassen (MyHomePage metoden)
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
        primarySwatch: Constants.kBlueColor,
        textTheme: GoogleFonts.robotoTextTheme(Theme.of(context).textTheme),
      ),
      home: main_menu(),
    );
  }
}