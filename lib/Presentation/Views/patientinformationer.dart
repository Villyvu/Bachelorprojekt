import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'processes.dart';
import '../Components/constants.dart';
import '../Components/menuListData.dart';

class Patientinformationer extends StatelessWidget {
  List<MenuListTile> menuItems = [
    MenuListTile(
        text: 'Hvad gør du, hvis du kommer til skade?',
        icon: Icons.back_hand_outlined),
    MenuListTile(
        text: 'Gynækologisk akutambulatorie',
        icon: Icons.pregnant_woman_outlined),
    MenuListTile(
        text: 'Modtagelse/Medicinsk skadestue',
        icon: Icons.local_hotel_outlined),
    MenuListTile(text: 'Skadestuen', icon: Icons.local_hospital_outlined),
    MenuListTile(text: 'Sengeafsnit', icon: Icons.sticky_note_2_outlined),
    MenuListTile(text: 'Akutte forløb', icon: Icons.manage_search_outlined)
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
            'Patientinformationer (alle)',
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
                leading: Icon(menuItems[index].icon,
                    color: Constants.kWhiteColor, size: 30),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Processes(),
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
