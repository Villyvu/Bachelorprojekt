import 'package:eventlog/Data/Db/DatabaseHandler.dart';
import 'package:eventlog/Data/Db/IDatabaseHandler.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:eventlog/Presentation/Views/description.dart';
import 'menu.dart';
import '../Components/constants.dart';
import '../../main.dart';

class main_menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: ListView(
          children: [
            Card(
                child: ListTile(
              title: Text("Friklinikken Region Syddanmark (Grindsted)"),
              trailing: Icon(Icons.keyboard_arrow_right_sharp),
            )),
            Card(
              child: ListTile(
                title: Text(
                    "Internetpsykiatrien - online terapi for angst eller depression"),
                trailing: Icon(Icons.keyboard_arrow_right_sharp),
              ),
            ),
            Card(
                child: ListTile(
              title: Text("Kolding Sygehus - en del af af Sygehus Lillebælt"),
              trailing: Icon(Icons.keyboard_arrow_right_sharp),
            )),
            Card(
                child: ListTile(
              title: Text("Middelfart Sygehus - en del af Sygehus Lillebælt"),
              trailing: Icon(Icons.keyboard_arrow_right_sharp),
            )),
            Card(
                child: ListTile(
              title: Text("OUH Odense Universitetshospital"),
              trailing: Icon(Icons.keyboard_arrow_right_sharp),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => menu(),
                  ),
                );
              },
            )),
            Card(
                child: ListTile(
              title: Text("OUH Svendborg Sygehus"),
              trailing: Icon(Icons.keyboard_arrow_right_sharp),
            )),
            Card(
                child: ListTile(
              title: Text("Psykiatrien i Region Syddanmark"),
              trailing: Icon(Icons.keyboard_arrow_right_sharp),
            )),
            Card(
                child: ListTile(
              title: Text("Region Syddanmark - Kvalitetsafdeling"),
              trailing: Icon(Icons.keyboard_arrow_right_sharp),
            )),
            Card(
                child: ListTile(
              title: Text("Rygcenter Syddanmark - en del af Sygehus Lillebælt"),
              trailing: Icon(Icons.keyboard_arrow_right_sharp),
            )),
            Card(
                child: ListTile(
              title: Text("Sydvestjysk Sygehus"),
              trailing: Icon(Icons.keyboard_arrow_right_sharp),
            )),
            Card(
                child: ListTile(
              title: Text("Sygehus Sønderjylland"),
              trailing: Icon(Icons.keyboard_arrow_right_sharp),
            )),
            Card(
                child: ListTile(
              title: Text("Vejle Sygehus"),
              trailing: Icon(Icons.keyboard_arrow_right_sharp),
            )),
            Card(
                child: ListTile(
              title: Text("Rigshospitalet"),
              trailing: Icon(Icons.keyboard_arrow_right_sharp),
            )),
          ],
        ),
      ),
      bottomNavigationBar:
          BottomNavigationBar(items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'Menu'),
        BottomNavigationBarItem(
            icon: Icon(Icons.person_outline), label: 'Log på'),
      ], onTap: (int) {}),
    );
  }
}
