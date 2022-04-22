import 'package:flutter/material.dart';
import '../Components/constants.dart';
import '../Components/timelineData.dart';
import 'description.dart';

class Haendelse extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dato for forløbet',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Dato for forløbet*'),
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
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container( // Drawing the line going up from each sideTime element
                        width: 2,
                        height: 60,
                        color: index == 0
                            ? Colors.transparent
                            : Constants.kBlackColor,
                      ),
                      SizedBox( // The width of the box and the placement of the sideTime
                        width: 60,
                        child: Container(
                          padding: EdgeInsets.all(0),
                          alignment: Alignment.center,
                          child: Text(timeline[index].sideTime, style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                      ),
                      Container( // Drawing the line going down from each sideTime element
                        width: 2,
                        height: 46,
                        color: index == timeline.length - 1
                            ? Colors.transparent
                            : Constants.kBlackColor,
                      ),
                    ],
                  ),
                  SizedBox( // The box (container) holding information about an event
                    width: 330,
                    height: 120,
                    child: Card(
                      margin: EdgeInsets.fromLTRB(3, 16, 12, 0), //Move the Card around
                      elevation: 10,
                      shape: Border(top: BorderSide(color: Constants.kBlueColor, width: 4)),
                      child: ListTile(
                        contentPadding: EdgeInsets.only(top: 20, left: 10, right: 20),
                        title: Text(timeline[index].title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold), overflow: TextOverflow.ellipsis),
                        subtitle: Text(timeline[index].desc, style: TextStyle(fontSize: 15), overflow: TextOverflow.ellipsis, maxLines: 2,),
                        trailing: Constants.kChevronRight,
                        leading: Icon(timeline[index].icon, color: Constants.kBlueColor, size: 32),
                        horizontalTitleGap: 0,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Description(),
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
  }

  List<TimelineData> timeline = [
    TimelineData(icon: Icons.pregnant_woman_outlined, title: "Ankomst til Fællesmmm", desc: "Tilskadekommende er blevet modtaget på FAM og tilses nu af en sygeplejerske", sideTime: "20:43"),
    TimelineData(icon: Icons.local_hospital, title: "Klinisk vurdering", desc: "Tilskadekommende er blevet modtaget og tilset af en læge", sideTime: "21:10"),
    TimelineData(icon: Icons.ac_unit_outlined, title: "Lab-pakke", desc: "Tilskadekommende har fået taget en blodprøve", sideTime: "21:44"),
    TimelineData(icon: Icons.timeline, title: "EKG", desc: "Tilskadekommende har fået foretaget et hjertekardiogram, for at se om hjerterytmen er normalTilskadekommende har fået foretaget et hjertekardiogram, for at se om hjerterytmen er normal", sideTime: "22:02"),
    TimelineData(icon: Icons.print, title: "Udskrivelse", desc: "Tilskadekommende er vurderet rask og er nu blevet udskrevet", sideTime: "00:01"),
  ];
}
