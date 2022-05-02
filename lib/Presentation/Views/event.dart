import 'package:eventlog/Data/Db/DatabaseHandler.dart';
import 'package:eventlog/Domain/ITimelineController.dart';
import 'package:eventlog/Domain/TimelineController.dart';
import 'package:flutter/material.dart';
import 'package:eventlog/Data/Event.dart';
import 'package:intl/intl.dart';
import '../Components/constants.dart';
import 'description.dart';

class Haendelse extends StatelessWidget {
  int proces_id;
  String date;
  Haendelse({required this.proces_id, required this.date});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dato for forløbet',
      home: Scaffold(
        appBar: AppBar(
          title: Text(date),
          leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                size: 25,
                color: Constants.kWhiteColor,
              ),
              onPressed: () => Navigator.pop(context, false)),
        ),
        body: Center(
          child: TimeLine(
            proces_id: proces_id,
          ),
        ),
      ),
    );
  }
}

class TimeLine extends StatefulWidget {
  int proces_id;

  TimeLine({Key? key, required this.proces_id}) : super(key: key);

  @override
  _TimeLineState createState() => _TimeLineState();
}

class _TimeLineState extends State<TimeLine> {
  late var dataFuture;
  late ITimelineController timelineController;

  @override
  void initState() {
    super.initState();
    timelineController = TimelineController(DatabaseHandler.getInstance());
    dataFuture = _getData();
  }

  Future<List<Event>> _getData() async {
    return await timelineController.getEvents(widget.proces_id);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: dataFuture,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          dataFuture = timelineController.sortEvents(snapshot.data);
          return Container(
            child: ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return Container(
                  child: Row(children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          // Drawing the line going up from each sideTime element
                          width: 2,
                          height: 60,
                          color: index == 0
                              ? Colors.transparent
                              : Constants.kBlackColor,
                        ),
                        SizedBox(
                          // The width of the box and the placement of the sideTime
                          width: 60,
                          child: Container(
                            padding: EdgeInsets.all(0),
                            alignment: Alignment.center,
                            child: Text(
                                DateFormat.Hm().format(DateTime.parse(
                                    snapshot.data[index].dateTime)),
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                        ),
                        Container(
                          // Drawing the line going down from each sideTime element
                          width: 2,
                          height: 46,
                          color: index == snapshot.data.length - 1
                              ? Colors.transparent
                              : Constants.kBlackColor,
                        ),
                      ],
                    ),
                    SizedBox(
                      // The box (container) holding information about an event
                      width: 330,
                      height: 120,
                      child: Card(
                        margin: EdgeInsets.fromLTRB(
                            3, 16, 12, 0), //Move the Card around
                        elevation: 10,
                        shape: Border(
                            top: BorderSide(
                                color: Constants.kBlueColor, width: 4)),
                        child: ListTile(
                          contentPadding:
                              EdgeInsets.only(top: 20, left: 10, right: 20),
                          title: Text(snapshot.data[index].titel,
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                              overflow: TextOverflow.ellipsis),
                          subtitle: Text(
                            snapshot.data[index].description,
                            style: TextStyle(fontSize: 15),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                          trailing: Constants.kChevronRight,
                          leading: Icon(
                              IconData(snapshot.data[index].icon,
                                  fontFamily: 'MaterialIcons'),
                              color: Constants.kBlueColor,
                              size: 32),
                          horizontalTitleGap: 0,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Description(
                                    time: snapshot.data[index].dateTime,
                                    description:
                                        snapshot.data[index].description,
                                    titel: snapshot.data[index].titel),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ]),
                );
              },
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
