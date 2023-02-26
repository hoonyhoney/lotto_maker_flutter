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
    if (result == "ไม่ถูกรางวัล T,.T") {
        return "assets/angry-dog.json";
    } else if(result=="โปรดป้อนหมายเลขที่ถูกต้อง") {
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
      title: Center(child: new Text("ผลสลากกินแบ่ง")),
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
        new TextButton(
        child: new Text("CLose"),
    onPressed: (){
    Navigator.pop(context);
    },
    )
    ],
    );
  }
}

