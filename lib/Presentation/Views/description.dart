<<<<<<< HEAD
import 'package:flutter/material.dart';
import 'package:eventlog/Presentation/Components/constants.dart';

class description extends StatelessWidget {
=======
import 'package:eventlog/Data/Db/DatabaseHandler.dart';
import 'package:eventlog/Data/Db/IDatabaseHandler.dart';
import 'package:eventlog/Data/Event.dart';
import 'package:eventlog/Data/EventType.dart';
import 'package:eventlog/Domain/EventDescrptionController.dart';
import 'package:flutter/material.dart';
import 'package:eventlog/Presentation/Components/constants.dart';

class description extends StatefulWidget {
  int eventType_id;

  description({Key? key, required this.eventType_id}) : super(key: key);

  @override
  State<description> createState() => _descriptionState();
}

class _descriptionState extends State<description> {
  late var dataFuture;
  late EventDescrptionController eventDescrptionController;
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

>>>>>>> backendBranch
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
<<<<<<< HEAD
        title: Text('Dine forløb'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(22.0),
        child: Align(
          alignment: Alignment.topCenter,
          child: RichText(
            text: const TextSpan(
                text: "01:30 \n",
                style: TextStyle(
                  color: Constants.kBlueColor,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
                children: [
                  TextSpan(
                      text:
                          "Lorem ipsum dolor sit amet, consec tetur adipiscing elit. Nam condimentum tempus diam, ultricies sollicitudin erat facilisis eget. Vestibulum rhoncus dui vel eros laoreet consectetur. Vivamus eget elementum ligula, vitae pharetra quam. Nullam at ligula sed metu. Lorem ipsum dolor sit amet, consec tetur adipiscing elit. Nam condimentum tempus diam, ultricies sollicitudin erat facilisis eget. Vestibulum rhoncus dui vel eros laoreet consectetur. Vivamus eget elementum ligula, vitae pharetra quam. Nullam at ligula sed metu",
                      style: TextStyle(
                        color: Constants.kBlackColor,
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                      ))
                ]),
          ),
        ),
=======
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
>>>>>>> backendBranch
      ),
    );
  }
}
