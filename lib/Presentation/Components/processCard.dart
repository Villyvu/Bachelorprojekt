import 'package:flutter/material.dart';
import 'package:eventlog/Presentation/Views/haendelse.dart';

class processCard extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.fromLTRB(12, 12, 12, 0),
      elevation: 10,
      shape: Border(top: BorderSide(color: Colors.grey.shade300, width: 10)),
      child: ListTile(
        contentPadding: EdgeInsets.fromLTRB(16, 10, 16, 0),
        title: Text('FAM', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
        subtitle: Text('24/03/2022'),
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
  }
}