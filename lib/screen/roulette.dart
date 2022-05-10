import 'dart:math';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:lotto_maker_flutter/services/generateNumber.dart';

class RouletteScreen extends StatefulWidget{

  @override
  _RouletteScreenState createState() => _RouletteScreenState();
}

class _RouletteScreenState extends State<RouletteScreen>
    with SingleTickerProviderStateMixin {

  late  AnimationController _controller;
  bool isLoaded =false;

  @override
  void initState() {
    super.initState();
    _controller=
    AnimationController(vsync:this, duration: const Duration(milliseconds: 750),)
    ..addStatusListener((status) {
      if(status ==AnimationStatus.completed)
    setState(() {
      isLoaded = true;
    });
    });

  }
  void getNumber() async{
    Random random = new Random();
    int seed= random.nextInt(100);
    int times=2;


    List<dynamic> luckyNumber = await GenerateNumber().getRandomLottoNumber(seed,times);
  /*  Navigator.push(context, MaterialPageRoute(
      builder: (context) => NumberDetail(luckynumber:luckyNumber),
    ));*/
    print(luckyNumber);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset('assets/spin-wheel.json',
              controller: _controller,
              animate: true,
              onLoaded: (composition) {
                _controller.duration = composition.duration;
              }
          ),
          Flexible(
            flex: 3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RaisedButton(
                  textColor: Colors.black87,
                  color: Colors.amberAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular((10)),
                  ),
                  child: Row(
                    children:
                     [
                       Text("start"
                           ,style: TextStyle(fontSize: 30),
                       ),
                       Icon(
                        Icons.play_arrow,size: 50,
                    )],
                  ),
                  onPressed: () {
                    if(isLoaded==false) {
                      _controller.reset(); // replay를 위해서 리셋하기
                      _controller.forward();
                      _controller.repeat();
                    }
                  },
                ),
                SizedBox(width:50),
                RaisedButton(
                  textColor: Colors.black87,
                  color: Colors.amberAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular((10)),
                  ),
                    child: Row(
                      children:
                      [
                        Text("stop"
                          ,style: TextStyle(fontSize: 30),
                        ),
                        Icon(
                          Icons.stop,size: 50,
                        )],
                    ),
                  onPressed: () {
                    _controller.stop();
                    getNumber();
                    }
                ),
                // Play backward
              ],
            ),
          )
        ],
      ),
    );
  }
}

