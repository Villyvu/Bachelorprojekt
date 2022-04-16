import 'package:eventlog/Data/Db/DatabaseHandler.dart';
import 'package:eventlog/Data/Db/IDatabaseHandler.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'processes.dart';
import '../Components/constants.dart';

class Patientinformationer extends StatelessWidget {
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
          child: ListView(
            children: ListTile.divideTiles(
              context: context,
              tiles: [
                const ListTile(
                  title: Text("Hvad gør du, hvis du kommer til skade?"),
                  textColor: Constants.kWhiteColor,
                  leading: Icon(Icons.note_alt_outlined,
                      color: Constants.kWhiteColor),
                ),
                const ListTile(
                  title: Text("Gynækologisk akutambulatorie"),
                  textColor: Constants.kWhiteColor,
                  leading: Icon(Icons.person_search_outlined,
                      color: Constants.kWhiteColor),
                ),
                ListTile(
                  title: Text("Modtagelse/Medicinsk skadestue"),
                  textColor: Constants.kWhiteColor,
                  leading: Icon(Icons.personal_injury_outlined,
                      color: Constants.kWhiteColor),
                ),
                const ListTile(
                  title: Text("Skadestuen"),
                  textColor: Constants.kWhiteColor,
                  leading: Icon(Icons.sticky_note_2_outlined,
                      color: Constants.kWhiteColor),
                ),
                const ListTile(
                  title: Text("Sengeafsnit"),
                  textColor: Constants.kWhiteColor,
                  leading: Icon(Icons.calendar_view_month_outlined,
                      color: Constants.kWhiteColor),
                ),
                ListTile(
                  title: Text("Akutte forløb"),
                  textColor: Constants.kWhiteColor,
                  leading:
                      Icon(Icons.chat_outlined, color: Constants.kWhiteColor),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => processes(),
                      ),
                    );
                  },
                ),
              ],
            ).toList(),
          ),
        ),
      ),
    );
  }
}
