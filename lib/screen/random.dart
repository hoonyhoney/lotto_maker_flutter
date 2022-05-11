import 'dart:math';

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
    Random random = new Random();
    int seed = random.nextInt(10);
    List<dynamic> numberList = generateClass.getRandomLottoNumber(2);
    print(numberList.toString());
    return Container();
  }
}


