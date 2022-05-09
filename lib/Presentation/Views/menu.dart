import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'patientinformationer.dart';
import '../Components/constants.dart';
import '../Components/menuListData.dart';

class Menu extends StatelessWidget {
  List<MenuListTile> menuItems = [
    MenuListTile(text: 'Tidsbestilling', icon: Icons.note_alt_outlined),
    MenuListTile(text: 'Værd at vide', icon: Icons.person_search_outlined),
    MenuListTile(
        text: 'Patientinformationer', icon: Icons.personal_injury_outlined),
    MenuListTile(text: 'Ris og Ros', icon: Icons.sticky_note_2_outlined),
    MenuListTile(text: 'Mine aftaler', icon: Icons.calendar_month_outlined),
    MenuListTile(text: 'Meddelelser', icon: Icons.chat_outlined),
    MenuListTile(text: 'Kontakt', icon: Icons.local_phone_outlined)
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          scaffoldBackgroundColor: Constants.kBlueColor,
          appBarTheme: AppBarTheme(
            systemOverlayStyle: SystemUiOverlayStyle.dark,
          )),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Menu',
            style: TextStyle(color: Constants.kBlackColor),
          ),
          backgroundColor: Constants.kWhiteColor,
          automaticallyImplyLeading: false,
          leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                size: 25,
                color: Constants.kBlueColor,
              ),
              onPressed: () => Navigator.pop(context, false)),
        ),
        body: Center(
          child: ListView.builder(
            itemCount: menuItems.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(menuItems[index].text),
                textColor: Constants.kWhiteColor,
                leading: Icon(
                  menuItems[index].icon,
                  color: Constants.kWhiteColor,
                  size: 30,
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Patientinformationer(),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
