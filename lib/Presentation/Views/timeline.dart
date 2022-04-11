import 'dart:math';
import 'package:flutter/material.dart';
import '../Components/constants.dart';
import '../Components/data.dart';
import 'package:timelines/timelines.dart';
import 'processes.dart';

TextStyle style = TextStyle(color: Colors.white);

class specificevent extends StatelessWidget {

  final List<Data> listOfEvents = [
  Data(time: "Kl. 20:43", name: "Ambulance Udrykning", desc: "Ambulancen er fremme ved stedet og tilser den tilskadekommende"),
  Data(time: "Kl. 21:10", name: "Ankommer til FAM", desc: "Ambulancen er fremme ved FAM med tilskadekommende"),
  Data(time: "Kl. 21:22", name: "Tilskadekommende tilses", desc: "Tilskadekommende er blevet tjekket ind på en stue og tilses nu af sygepersonalet"),
  Data(time: "Kl. 21:39", name: "Røntgenscanning", desc: "Tilskadekommende er under røntgenscanning for at bedømme skadens omfang"),
  Data(time: "Kl. 22:15", name: "Observation", desc: "Tilskadekommende ligger nu på egen stue til observation"),
  Data(time: "Kl. 00:54", name: "Underretning om skade", desc: "Tilskadekommende underrettes af læge Jesper Larsen om skaderne"),
  Data(time: "Kl. 01:16", name: "Udskrivelse", desc: "Tilskadekommende er vurderet rask nok, og udskrives derfor"),
  ];

  final List<Color> listOfColors = [Constants.kBlueColor,Constants.kGreenColor,Constants.kRedColor,Constants.kYellowColor];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Random random = new Random();
    return Scaffold(
      appBar: AppBar(title: Text("Akutforløb x"), actions: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 10, 10, 0),
          child: Stack(
            children: [
              new Positioned(
                right: 0,
                top: 0,
                child: new Container(
                  padding: EdgeInsets.all(1),
                  decoration: new BoxDecoration(
                    color: Constants.kBlueColor,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  constraints: BoxConstraints(
                    minWidth: 12,
                    minHeight: 12,
                  ),
                ),
              )
            ],
          ),
        ),
      ]),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Flexible(
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: listOfEvents.length,
                itemBuilder: (context, i) {
                  return Stack(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(40),
                        child: Row(
                          children: [
                            SizedBox(width: size.width * 0.1),
                            SizedBox(
                              child: Text(listOfEvents[i].time),
                              width: size.width * 0.2,
                            ),
                            SizedBox(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(listOfEvents[i].name),
                                  Text(
                                    listOfEvents[i].desc,
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 12),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Positioned(
                        left: 50,
                        child: new Container(
                          height: size.height * 0.7,
                          width: 1.0,
                          color: Colors.grey.shade400,
                        ),
                      ),
                      Positioned(
                        bottom: 5,
                        child: Padding(
                          padding: const EdgeInsets.all(40.0),
                          child: Container(
                            height: 20.0,
                            width: 20.0,
                            decoration: new BoxDecoration(
                              color: listOfColors[random.nextInt(3)],
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                }),
          ),
        ],
      ),
    );
  }
}
