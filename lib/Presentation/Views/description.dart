import 'package:eventlog/Data/Db/DatabaseHandler.dart';
import 'package:eventlog/Data/Db/IDatabaseHandler.dart';
import 'package:eventlog/Data/Event.dart';
import 'package:eventlog/Data/EventType.dart';
import 'package:eventlog/Domain/EventDescriptionController.dart';
import 'package:eventlog/Domain/IEventDescriptionController.dart';
import 'package:eventlog/Presentation/Components/constants.dart';
import 'package:flutter/material.dart';

class Description extends StatefulWidget {
  int eventType_id;

  Description({Key? key, required this.eventType_id}) : super(key: key);

  @override
  State<Description> createState() => _DescriptionState();
}

class _DescriptionState extends State<Description> {
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
    return FutureBuilder(
      future: dataFuture,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          return Scaffold(
              appBar: AppBar(
                title: Text(snapshot.data[0].titel),
              ),
              body: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                        child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(time,
                              style: TextStyle(
                                  fontSize: 30, color: Constants.kBlueColor)),
                          Text(snapshot.data[0].description,
                              style: TextStyle(fontSize: 18))
                        ],
                      ),
                    ))
                  ],
                ),
              ));
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}

String time = "01:30";
String desc =
    "Lorem ipsum dolor sit amet, consec tetur adipiscing elit. Nam condimentum tempus diam, ultricies sollicitudin erat facilisis eget. Vestibulum rhoncus dui vel eros laoreet consectetur. Vivamus eget elementum ligula, vitae pharetra quam. Nullam at ligula sed metu. Lorem ipsum dolor sit amet, consec tetur adipiscing elit. Nam condimentum tempus diam, ultricies sollicitudin erat facilisis eget. Vestibulum rhoncus dui vel eros laoreet consectetur. Vivamus eget elementum ligula, vitae pharetra quam. Nullam at ligula sed metu"
    "Lorem ipsum dolor sit amet, consec tetur adipiscing elit. Nam condimentum tempus diam, ultricies sollicitudin erat facilisis eget. Vestibulum rhoncus dui vel eros laoreet consectetur. Vivamus eget elementum ligula, vitae pharetra quam. Nullam at ligula sed metu. Lorem ipsum dolor sit amet, consec tetur adipiscing elit. Nam condimentum tempus diam, ultricies sollicitudin erat facilisis eget. Vestibulum rhoncus dui vel eros laoreet consectetur. Vivamus eget elementum ligula, vitae pharetra quam. Nullam at ligula sed metu"
    "Lorem ipsum dolor sit amet, consec tetur adipiscing elit. Nam condimentum tempus diam, ultricies sollicitudin erat facilisis eget. Vestibulum rhoncus dui vel eros laoreet consectetur. Vivamus eget elementum ligula, vitae pharetra quam. Nullam at ligula sed metu. Lorem ipsum dolor sit amet, consec tetur adipiscing elit. Nam condimentum tempus diam, ultricies sollicitudin erat facilisis eget. Vestibulum rhoncus dui vel eros laoreet consectetur. Vivamus eget elementum ligula, vitae pharetra quam. Nullam at ligula sed metu";
