import 'package:eventlog/Presentation/Components/constants.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Description extends StatefulWidget {
  String titel;
  String description;
  String time;

  Description(
      {Key? key,
      required this.titel,
      required this.description,
      required this.time})
      : super(key: key);

  @override
  State<Description> createState() => _DescriptionState();
}

class _DescriptionState extends State<Description> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.titel),
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
                    Text(DateFormat.Hm().format(DateTime.parse(widget.time)),
                        style: TextStyle(
                            fontSize: 30, color: Constants.kBlueColor)),
                    Text(widget.description, style: TextStyle(fontSize: 18))
                  ],
                ),
              ))
            ],
          ),
        ));
  }
}