import 'package:flutter/material.dart';

class Dialogs extends StatefulWidget {

  dynamic result;

  Dialogs({required this.result});

  @override
  _DialogsState createState() => _DialogsState(result);
}

class _DialogsState extends State<Dialogs> {
  dynamic result;
  _DialogsState(this.result);
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: new Text("당첨결과"),
      content: Container(
        child: Column(
          children: [
            Text(result),

          ],
        ),
      ),
      actions: [
        new FlatButton(
        child: new Text("CLose"),
    onPressed: (){
    Navigator.pop(context);
    },
    )
    ],
    );
  }
}

