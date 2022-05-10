import 'package:flutter/material.dart';

import '../services/generateNumber.dart';

class RandomScreen extends StatefulWidget {

  @override
  _RandomScreenState createState() => _RandomScreenState();
}

class _RandomScreenState extends State<RandomScreen> {

  final generateClass = GenerateNumber();


  @override
  Widget build(BuildContext context) {
    List<dynamic> numberList = generateClass.getRandomLottoNumber(1, 2);
    return Container();
  }
}


