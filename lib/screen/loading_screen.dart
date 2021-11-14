import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:lotto_maker_flutter/services/generateNumber.dart';

import 'cookie_detail.dart';



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
  void getNumber() {
    int seed=0;
    int times=0;

    var weatherData = GenerateNumber().getRandomLottoNumber(seed,times);
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return CookieDetail();
    }));

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child:spinkit,
      ),
    );
  }

}
final spinkit = SpinKitPouringHourGlassRefined(
  color: Colors.white,
  size: 50.0,
);


