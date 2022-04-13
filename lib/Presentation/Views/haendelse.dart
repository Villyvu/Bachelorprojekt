import 'package:flutter/material.dart';
import '../Components/constants.dart';
import 'dart:math';
import '../Components/TimelineCard.dart';

class Haendelse extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'X. Akutforløb',
      home: Scaffold(
        appBar: AppBar(
          title: Text('X. Akutforløb'),
          leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                size: 25,
                color: Constants.kWhiteColor,
              ),
              onPressed: () => Navigator.pop(context, false)),
        ),
        body: Center(
          child: TimeLine(),
        ),
      ),
    );
  }
}

class TimeLine extends StatefulWidget {
  const TimeLine({
    Key? key,
  }) : super(key: key);

  @override
  _TimeLineState createState() => _TimeLineState();
}

class _TimeLineState extends State<TimeLine> {
  final List<Color> listOfColors = [
    Constants.kBlueColor,
    Constants.kGreenColor,
    Constants.kRedColor,
    Constants.kGreyColor,
  ];

  late List<TimelineCard> timeline;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    timeline = _getCards();
  }

  Random random = new Random();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          itemCount: timeline.length,
          itemBuilder: (context, index) {
            return Container(
              child: Row(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Container(
                        //Stregen til venstre
                        width: 2,
                        height: 74,
                        color: index == 0
                            ? Colors.transparent
                            : Constants.kBlackColor,
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            left: 10, right: 10), //Placering af streg
                        padding: EdgeInsets.all(5),

                        child: Text(timeline[index].sideTime),
                      ),
                      Container(
                        width: 2,
                        height: 50,
                        color: index == timeline.length - 1
                            ? Colors.transparent
                            : Constants.kBlackColor,
                      ),
                    ],
                  ),
                  Expanded(
                      child: Container(
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border(
                            top: BorderSide(
                                width: 4, color: Constants.kBlueColor)),
                        boxShadow: [
                          BoxShadow(blurRadius: 10, color: Colors.black26)
                        ]),
                        height: 130,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                timeline[index].time + " - " + timeline[index].title,
                                style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            timeline[index].desc,
                            style: TextStyle(fontSize: 15),
                          )
                        ],
                      ),
                    ),
                  )),
                ],
              ),
            );
          }),
    );
  }

  List<TimelineCard> _getCards() {
    List<TimelineCard> timelineCard = [];

    timelineCard.add(TimelineCard(
        "Ankomst til Fælles Akutmodtagelse",
        "Kl. 20:43",
        "Tilskadekommende er blevet modtaget på FAM og tilses nu af en sygeplejerske",
        "20:"));
    timelineCard.add(TimelineCard(
        "Klinisk vurdering",
        "Kl. 21:10",
        "Tilskadekommende er blevet modtaget og tilset af en læge",
        "21:10"));
    timelineCard.add(TimelineCard(
        "Lab-pakke",
        "Kl. 21:44",
        "Tilskadekommende har fået en blodprøve",
        "2111:44"));
    timelineCard.add(TimelineCard(
        "EKG",
        "Kl. 22:02",
        "Tilskadekommende har fået foretaget et hjertekardiogram, for at se om hjerterytmen er normal",
        "22:02"));

    return timelineCard;
  }
}
