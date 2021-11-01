import 'package:flutter/material.dart';
import 'package:lotto_maker_flutter/screen/homeView.dart';
import 'package:lotto_maker_flutter/utilities/constants.dart';


//push test
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LottoMaker',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: MyHomePage(),
    );
  }
}

