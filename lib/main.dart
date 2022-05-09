import 'package:eventlog/Presentation/Components/palette.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import './Presentation/Components/constants.dart';
import './Presentation/Views/main_menu.dart';
import 'injection_contaner.dart' as di;

//TO-DO:
//Extract første view fra main-klassen (MyHomePage metoden)
//Extract cards fra de klasse de bliver brugt (se JustRandom)

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
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
