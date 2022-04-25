import 'package:eventlog/Data/Db/DatabaseHandler.dart';
import 'package:eventlog/Data/Db/IDatabaseHandler.dart';
import 'package:eventlog/Domain/IProcessesController.dart';
import 'package:eventlog/Domain/ProcessesController.dart';
import 'package:flutter/material.dart';
import 'package:eventlog/Presentation/Components/constants.dart';
import 'package:flutter/services.dart';
import 'event.dart';
import 'package:eventlog/Presentation/Components/processCard.dart';

class Processes extends StatelessWidget {
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
            "Dine forløb",
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
          child: ProcessCard(),
        ),
      ),
    );
  }
}
