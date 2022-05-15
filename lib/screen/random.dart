import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../services/generateNumber.dart';

class RandomScreen extends StatefulWidget {

  @override
  _RandomScreenState createState() => _RandomScreenState();
}

class _RandomScreenState extends State<RandomScreen> with SingleTickerProviderStateMixin {

  final generateClass = GenerateNumber();
  late  AnimationController _controller;
  void initState() {
    super.initState();
    _controller= AnimationController(vsync:this,)
      ..addListener(() {
        setState(() {
        });
      });

  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    Random random = new Random();
    int seed = random.nextInt(10);
    List<dynamic> numberList = generateClass.getRandomLottoNumber(2);
    print(numberList);
    int firstNumber = numberList[0];
    int secondNumber = numberList[1];
    print(firstNumber);print(secondNumber);
    return Scaffold(
      body:Container(
        
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset('assets/rainbow-cat-remix.json',
                controller: _controller,
                height: 300,
                width: 300,
                fit: BoxFit.fill,
                animate: true,
                onLoaded: (composition) {
                  _controller.duration = composition.duration;
                  _controller.forward();
                }
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('images/$firstNumber.png',width:100,height: 100,),
                Image.asset('images/$secondNumber.png',width:100,height: 100,)

              ],
            ),
            SizedBox(height: 70),
            RaisedButton(
                textColor: Colors.black87,
                color: Colors.amberAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular((10)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:
                  [
                    Text("replay"
                      ,style: TextStyle(fontSize: 30),
                    ),
                    Icon(
                      Icons.replay,size: 50,
                    )],
                ),
                onPressed: () {
                  setState(() {
                    List<dynamic> numberList = generateClass.getRandomLottoNumber(2);
                    int firstNumber = numberList[0];
                    int secondNumber = numberList[1];
                    _controller.reset();
                    _controller.forward();
                  });

                }
            ),
          ],
        ),

      )
    );
  }
}


