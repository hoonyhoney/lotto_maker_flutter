import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:lotto_maker_flutter/services/generateNumber.dart';

import 'number_detail.dart';



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
  void getNumber() async{
    int seed=2;
    int times=7;

    dynamic luckyNumber = await GenerateNumber().getRandomLottoNumber(seed,times);
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return NumberDetail(
        luckylist: luckyNumber,
      );
    }));

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child:SpinKitDoubleBounce(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }

}


