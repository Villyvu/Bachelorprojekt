import 'package:flutter/material.dart';
import 'package:eventlog/Presentation/Components/constants.dart';
import 'package:flutter/services.dart';
import 'timeline.dart';
import 'haendelse.dart';

class processes extends StatelessWidget {
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
          title: Text("Dine forløb",
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
        body: Column(
          children: <Widget> [
            Card(
              elevation: 5,
              shape: Border(top: BorderSide(color: Colors.grey.shade300, width: 10)),
              child: ListTile(
                title: Text('FAM', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
                subtitle: Text('24/03/2022'),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Haendelse(),
                    ),
                  );
                },
              ),
            ),

          ],
        ),
      ),
    );
  }
}
