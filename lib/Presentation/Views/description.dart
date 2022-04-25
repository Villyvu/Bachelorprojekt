import 'package:eventlog/Data/Db/DatabaseHandler.dart';
import 'package:eventlog/Data/Db/IDatabaseHandler.dart';
import 'package:eventlog/Data/Event.dart';
import 'package:eventlog/Data/EventType.dart';
import 'package:eventlog/Domain/EventDescriptionController.dart';
import 'package:eventlog/Domain/IEventDescriptionController.dart';
import 'package:eventlog/Presentation/Components/constants.dart';
import 'package:flutter/material.dart';

class description extends StatefulWidget {
  int eventType_id;

  description({Key? key, required this.eventType_id}) : super(key: key);

  @override
  State<description> createState() => _descriptionState();
}

class _descriptionState extends State<description> {
  late var dataFuture;
  late IEventDescrptionController eventDescrptionController;
  @override
  void initState() {
    super.initState();
    eventDescrptionController =
        EventDescrptionController(DatabaseHandler.getInstance());
    dataFuture = _getData();
  }

  Future<List<EventType>> _getData() async {
    return await eventDescrptionController.getTypeOfEvent(widget.eventType_id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: FutureBuilder(
          future: dataFuture,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.done &&
                snapshot.hasData) {
              return Text(snapshot.data[0].getTitel());
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
      body: FutureBuilder(
        future: dataFuture,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData) {
            return Padding(
              padding: const EdgeInsets.all(22.0),
              child: Align(
                alignment: Alignment.topCenter,
                child: RichText(
                  text: TextSpan(
                      text: "01:30 \n",
                      style: TextStyle(
                        color: Constants.kBlueColor,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                      children: [
                        TextSpan(
                            text: snapshot.data[0].getDescription(),
                            style: TextStyle(
                              color: Constants.kBlackColor,
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                            ))
                      ]),
                ),
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
