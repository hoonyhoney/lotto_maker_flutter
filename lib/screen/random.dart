import 'dart:math';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:lotto_maker_flutter/services/generateNumber.dart';

class RandomScreen extends StatefulWidget {
  const RandomScreen({Key? key}) : super(key: key);

  @override
  _RandomScreenState createState() => _RandomScreenState();
}

class _RandomScreenState extends State<RandomScreen>
    with SingleTickerProviderStateMixin {

  late  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller= AnimationController(
      vsync:this,)
    ..addListener(() {

    setState(() {

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
          Lottie.asset('assets/lucky-spin.json',
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
                IconButton(
                  iconSize: 120.0,
                  icon: const Icon(Icons.arrow_right),
                  onPressed: () {

                    _controller.forward();
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.stop),
                  iconSize: 80.0,
                  onPressed: () {
                    _controller.stop();
                    getNumber();
                    _controller.reset(); // replay를 위해서 리셋하기
                  },
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

