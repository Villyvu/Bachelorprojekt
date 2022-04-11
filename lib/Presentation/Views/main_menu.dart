import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'menu.dart';
import '../Components/constants.dart';

class main_menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            scaffoldBackgroundColor: Constants.kBlueColor,
            appBarTheme: AppBarTheme(
              systemOverlayStyle: SystemUiOverlayStyle.dark,
            )),
        home: Scaffold(
          body: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/menu.jpg"),
                fit: BoxFit.fill,
              )
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'Menu'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person_outline), label: 'Log på'),
              ],
              onTap: (int) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) => Menu()),
                  ),
                );
              }),
    ),);
  }
}
