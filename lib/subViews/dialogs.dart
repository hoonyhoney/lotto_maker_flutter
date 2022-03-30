import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Dialogs extends StatefulWidget {

  dynamic result;

  Dialogs({required this.result});

  @override
  _DialogsState createState() => _DialogsState(result);
}

class _DialogsState extends State<Dialogs> with SingleTickerProviderStateMixin{
  dynamic result;
  late  AnimationController _controller;
  _DialogsState(this.result);
  void initState() {
    super.initState();
    _controller= AnimationController(
      vsync:this,)
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
  dynamic lottiePath () { //당첨결과에 따라 로띠화면 분기
    if (result == "ไม่ถูกนะครับ  :(") {
        return "assets/angry-dog.json";
    } else if(result=="Please enter number") {
      return "assets/error-state-dog.json";
    }
    else{
      return "assets/congratulation.json";
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0)
      ),
      title: Center(child: new Text("당첨결과")),
      content: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20.0,),
            Text(result),
            Lottie.asset(lottiePath(),
                controller: _controller,
                height: 300,
                width: 300,
                fit: BoxFit.fill,
                animate: true,
                onLoaded: (composition) {
                  _controller.duration = composition.duration;
                  _controller.repeat();
                }
            ),

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

