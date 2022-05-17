import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:math' as math;

import '../services/win_numbers.dart';
import 'first_page.dart';

class FakeLottery extends StatefulWidget {

  @override
  State<FakeLottery> createState() => _FakeLotteryState();
}

class _FakeLotteryState extends State<FakeLottery> {
  String comment='';
   dynamic prize1;
   dynamic title;

   @override
  void initState() {
     getPrizeNumber();
    super.initState();
  }
  dynamic getPrizeNumber() async {
    prize1 = await WinNumbers().getData();
    String titleData = await WinNumbers().getTitle();
    title = titleData.substring(9);
    setState(() {
      prize1;
      title;
    });
  }
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<WinNumbers>(
      create: (_) => WinNumbers(),
      child: Scaffold(
          body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/flag.jpg'),
                fit: BoxFit.cover,
              ),
            ),

          child: Center(
            child: SingleChildScrollView(
              child: Container(
                child: Column(

                  children: [
                    Stack(
                      children: [

                        Container( //로또 이미지

                          width:350,
                          height:350,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('images/fake_lottery.png'),
                                fit: BoxFit.contain
                            )
                        ),
                        ),
                        Positioned(
                          top:100,
                          left:185,
                          child: Container(
                            child: Transform.rotate(
                              angle: -math.pi / 0,
                              child: Text(
                               '$prize1',
                                style: TextStyle(
                                  fontSize: 20,
                                  color:Color(0xff5C4B30),//색깔은 0xff +
                                  letterSpacing: 7.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top:123,
                          left:180,
                          child: Container(
                            child: Text('$title',
                            ),
                          ),
                        ),
                        Positioned(
                          top:145,
                          left:200,
                          child: Container(
                            child: Text('$comment',
                            ),
                          ),
                        ),
                        Positioned(
                          top:160,
                          left:215,
                          child: Container(
                            child: Text('084578',
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w400,
                                letterSpacing: 1.0,
                                color:Color(0xffDB9161),//색깔은 0xff +
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top:193,
                          left:217,
                          child: Container(
                            child: Text('8',
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color:Color(0xff9F4257),//색깔은 0xff +
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top:193,
                          left:280,
                          child: Container(
                            child: Text('03',
                              style: TextStyle(
                                fontSize: 18,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 3.0,
                                color:Color(0xff665C5B),//색깔은 0xff +
                              ),
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
                            comment = newText;
                          });
                        },
                        decoration: new InputDecoration(
                          suffixIcon: Icon(Icons.send),
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
