import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:lotto_maker_flutter/services/generate_number.dart';

import '../screen/number_detail.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getNumber();
  }

  void getNumber() async {
    int seed = 3;
    int times = 2;

    dynamic luckyNumber = await GenerateNumber().getRandomLottoNumber(times);
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => NumberDetail(luckynumber: luckyNumber),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}
