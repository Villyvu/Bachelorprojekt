import 'package:eventlog/Presentation/Components/processData.dart';
import 'package:flutter/material.dart';
import 'package:eventlog/Presentation/Views/event.dart';
import 'package:eventlog/Presentation/Components/processData.dart';

class ProcessCard extends StatelessWidget {

  List<ProcessData> processes = [
    ProcessData(date: '12/03-2016'),
    ProcessData(date: '02/06-2018'),
    ProcessData(date: '21/04-2021'),
    ProcessData(date: '17/11-2022')
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: processes.length,
      itemBuilder: (context, index) {
        return Card(
            margin: EdgeInsets.fromLTRB(12, 12, 12, 0),
            elevation: 10,
            shape: Border(top: BorderSide(color: Colors.grey.shade300, width: 10)),
            child: ListTile(
              contentPadding: EdgeInsets.fromLTRB(16, 16, 16, 0),
              leading: Icon(Icons.calendar_month_outlined),
              title: Text('FAM', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
              subtitle: Text(processes[index].date),
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
        );
      },
    );
  }
}