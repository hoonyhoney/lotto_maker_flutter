import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:math' as math;

class FakeLottery extends StatefulWidget {

  @override
  State<FakeLottery> createState() => _FakeLotteryState();
}

class _FakeLotteryState extends State<FakeLottery> {
  String fakeNumber='';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(

                      width:350,
                      height:350,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('images/fake_lottery.jpg'),
                            fit: BoxFit.contain
                        )
                    ),
                    ),
                    Positioned(
                      top:95,
                      left:230,
                      child: Container(
                        child: Transform.rotate(
                          angle: -math.pi / 40,
                          child: Text(
                           '$fakeNumber',
                            style: TextStyle(
                              letterSpacing: 4.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top:130,
                      left:230,
                      child: Container(
                        child: Text('',

                        ),
                      ),
                    ),
                  ],
                ),

                Container(
                  padding: EdgeInsets.only(left:30.0,right: 30.0),
                  child: TextField(
                    onChanged: (newText) {
                      setState(() {
                        fakeNumber = newText;
                      });
                    },
                    decoration: new InputDecoration(
                      suffixIcon: Icon(Icons.search),
                      contentPadding: EdgeInsets.only(left: 20, right: 5, top: 20, bottom: 5),
                      hintText: '숫자를 입력하세요'
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left:30.0,right: 30.0),
                  child: TextField(
                    onChanged: (newText) {
                      setState(() {
                        fakeNumber = newText;
                      });
                    },
                    decoration: new InputDecoration(
                      suffixIcon: Icon(Icons.search),
                      contentPadding: EdgeInsets.only(left: 20, right: 5, top: 20, bottom: 5),
                      hintText: '숫자를 입력하세요'
                    ),
                  ),
                ),              Container(
                  padding: EdgeInsets.only(left:30.0,right: 30.0),
                  child: TextField(
                    onChanged: (newText) {
                      setState(() {
                        fakeNumber = newText;
                      });
                    },
                    decoration: new InputDecoration(
                      suffixIcon: Icon(Icons.search),
                      contentPadding: EdgeInsets.only(left: 20, right: 5, top: 20, bottom: 5),
                      hintText: '숫자를 입력하세요'
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/*
class Data extends ChangeNotifier{
  String fakeNumber = '';
  void changeString(String newString) {
    fakeNumber = newString;
    notifyListeners();
  }
  }
*/
