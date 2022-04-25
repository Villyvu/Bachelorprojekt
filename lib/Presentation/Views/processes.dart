import 'package:eventlog/Data/Db/DatabaseHandler.dart';
import 'package:eventlog/Data/Db/IDatabaseHandler.dart';
import 'package:eventlog/Domain/IProcessesController.dart';
import 'package:eventlog/Domain/ProcessesController.dart';
import 'package:flutter/material.dart';
import 'package:eventlog/Presentation/Components/constants.dart';
import '../../Data/Proces.dart';
import 'timeline.dart';
import 'haendelse.dart';

class processes extends StatefulWidget {
  processes({
    Key? key,
  }) : super(key: key);

  @override
  State<processes> createState() => _processesState();
}

class _processesState extends State<processes> {
  late IProcessesController processesController;

  @override
  void initState() {
    super.initState();
    processesController = ProcessesController(DatabaseHandler.getInstance());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dine forløb'),
      ),
      body: FutureBuilder(
        future: processesController.getProcesses(123456789),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          var data = snapshot.data;
          print(snapshot.connectionState);
          if (snapshot.connectionState == ConnectionState.done) {
            print(snapshot.hasData);
            if (snapshot.hasData) {
              return Center(
                  child: RefreshIndicator(
                onRefresh: () async {
                  var newData = processesController.getProcesses(123456789);
                  setState(
                    () {
                      data = newData;
                    },
                  );
                },
                child: ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    print(snapshot.data.length);
                    return Card(
                        child: ListTile(
                      title: Text(data[index].caretaker),
                      trailing: Constants.kArrowRight,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Haendelse(
                              proces_id: data[index].proces_id,
                            ),
                          ),
                        );
                      },
                    ));
                  },
                ),
              )

                  /*ListView(
                  children: [
                    Card(
                        child: ListTile(
                      title: Text(snapshot.data.first.caretaker),
                      trailing: Constants.kArrowRight,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Haendelse(),
                          ),
                        );
                      },
                    )),
                    Card(
                        child: ListTile(
                      title: Text(snapshot.data[1].date),
                      trailing: Constants.kArrowRight,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Haendelse(),
                          ),
                        );
                      },
                    )),
                    Card(
                      child: ListTile(
                        title: Text("Akutforløb nr. 3"),
                        trailing: Constants.kArrowRight,
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
                ),*/
                  );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Text("State: ${snapshot.connectionState}");
          }
        },
      ),
    );
  }
}
