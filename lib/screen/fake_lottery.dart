import 'package:flutter/material.dart';

class FakeLottery extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
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
                    top:100,
                    left:230,
                    child: Container(
                      child: Text('송 의 주 바 보'),
                    ),
                  ),
                  Positioned(
                    top:130,
                    left:230,
                    child: Container(
                      child: Text('송 의 주 바 보'),
                    ),
                  ),
                ],
              ),

              Container(
                padding: EdgeInsets.only(left:30.0,right: 30.0),
                child: TextField(
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
    );
  }
}
