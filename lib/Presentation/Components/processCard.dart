import 'package:eventlog/Data/Db/DatabaseHandler.dart';
import 'package:eventlog/Data/Proces.dart';
import 'package:eventlog/Domain/IProcessesController.dart';
import 'package:eventlog/Domain/ProcessesController.dart';

import 'package:flutter/material.dart';
import 'package:eventlog/Presentation/Views/event.dart';

import 'package:intl/intl.dart';

class ProcessCard extends StatefulWidget {
  ProcessCard({Key? key}) : super(key: key);

  @override
  State<ProcessCard> createState() => _ProcessCardState();
}

class _ProcessCardState extends State<ProcessCard> {
  late var dataFuture;
  late IProcessesController processesController;

  @override
  void initState() {
    super.initState();
    processesController = ProcessesController(DatabaseHandler.getInstance());
    dataFuture = _getData();
  }

  Future<List<Proces>> _getData() async {
    return await processesController.getProcesses(0123456789);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Proces>>(
      future: dataFuture,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          processesController.sortProcesses(snapshot.data);
          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (context, index) {
              return Card(
                margin: EdgeInsets.fromLTRB(12, 12, 12, 0),
                elevation: 10,
                shape: Border(
                    top: BorderSide(color: Colors.grey.shade300, width: 10)),
                child: ListTile(
                  contentPadding: EdgeInsets.fromLTRB(16, 16, 16, 0),
                  leading: Icon(Icons.calendar_month_outlined),
                  title: Text(
                    'FAM' + snapshot.data[index].proces_id.toString(),
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(DateFormat.yMMMd()
                      .format(DateTime.parse(snapshot.data[index].date))),
                  trailing: Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Haendelse(
                          proces_id: snapshot.data[index].proces_id,
                          date: DateFormat.yMMMd().format(
                              DateTime.parse(snapshot.data[index].date)),
                        ),
                      ),
                    );
                  },
                ),
              );
            },
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
