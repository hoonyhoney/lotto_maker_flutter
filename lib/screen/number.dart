import 'dart:core';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:html/parser.dart';
import 'package:lotto_maker_flutter/screen/writePost.dart';
import 'package:lotto_maker_flutter/subViews/commentBox.dart';
import 'package:lotto_maker_flutter/subViews/reply.dart';
import 'package:http/http.dart' as http;

import 'bottom_bar.dart';


class NumberPage extends StatefulWidget {



  @override
  State<NumberPage> createState() => _NumberPageState();
}

class _NumberPageState extends State<NumberPage> {

  var prize_1;
  var prize_12;
  var prize_f3;
  var prize_l3;
  var title;
  var prize_n1;
  List<dynamic> prize_2 = [];
  List<dynamic> prize_3 = [];
  List<dynamic> prize_4 = [];
  List<dynamic> prize_5 = [];

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async{
    final response = await http.Client().get(Uri.parse('https://lotto.mthai.com/'));
    if(response.statusCode ==200) {
      var document = parse(response.body);
      //var elements = document.getElementsByClassName(); //클래스 이름
      //var elementsByTagName = document.getElementsByTagName(); //TagName


      setState(() {
        prize_1 = document.getElementsByClassName("prize-1")[0].children[1].children[0].children[0].text;
        prize_12= document.getElementsByClassName("prize-l2")[0].children[1].children[0].children[0].text;
        prize_f3 = document.getElementsByClassName("prize-f3")[0].children[1].children[0].children[0].text;
        prize_l3 = document.getElementsByClassName("prize-l3")[0].children[1].children[0].children[0].text;
        title = document.getElementById("site-head-title")?.getElementsByTagName('h2').first.text;
        prize_n1 = document.getElementsByClassName("prize-n1")[0].children[1].children[0].children[0].text;

        //step 1. 클래스에서 text를 가져온다.

        for (int i=0; i< 5; i++) {
          var prizeNo = document.getElementById("prize-2")?.getElementsByTagName("span")[i].text;
          print(prizeNo);
          prize_2.add(prizeNo);
        }
        for (int i=0; i< 10; i++) {
          var prizeNo = document.getElementById("prize-3")?.getElementsByTagName("span")[i].text;
          print(prizeNo);
          prize_3.add(prizeNo);
        }
        for (int i=0; i< 50; i++) {
          var prizeNo = document.getElementById("prize-4")?.getElementsByTagName("span")[i].text;
          print(prizeNo);
          prize_4.add(prizeNo);
        }
        for (int i=0; i< 100; i++) {
          var prizeNo = document.getElementById("prize-5")?.getElementsByTagName("span")[i].text;
          print(prizeNo);
          prize_5.add(prizeNo);
        }
        print(prize_3);
        print(prize_4);
        print(prize_5);
      });


    }else {
      throw Exception();
    }
  }

  void _writePost() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => WritePost()));
  }
  final _firestore = FirebaseFirestore.instance;
  bool isVisible =false;

 void getMessages() async{
   final messages = await _firestore.collection('post').get();
   for (var message in messages.docs) {
     print(message.data());
   }
 }

 //메시지 구독 , 메시지가 업데이트되면 전체 내용을 다시 불러옴
 void messagesStream() async {
   //bunch of 스냅샷 중 snap을 하나 꺼냄
   await for (var snapshot in _firestore.collection('post').snapshots()) {
     // 그 snapshot 에서 메시지를 하나 꺼냄
     for (var message in snapshot.docs) {
       print(message.data);
     }
   }
 }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Expanded(
          child: Container(
            height: 2000,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(right: 10.0),
                  height: 50.0,
                  decoration: BoxDecoration(
                    color: Colors.amberAccent,
                    borderRadius: BorderRadius.circular(20),

                  ),
                  child: TextField(
                    cursorColor: Colors.black87,
                    //autofocus: true,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Varela',
                      fontSize: 20.0,
                    ),
                    decoration: InputDecoration(
                      //hintText: "    번호를 입력하세요",
                      hintStyle: TextStyle(
                        fontFamily: 'Varela',
                        color:Colors.black87.withOpacity(0.5),
                      ),
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      suffixIcon: Icon(
                        Icons.search,
                       color: Colors.black,
                        size: 36.0,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 15.0,),
                Divider( thickness: 1, color: Colors.grey, ),
                Container(

                  width: 300.0,
                  child: Center(
                    child: Text('$title',
                        style:TextStyle(
                          fontFamily: 'Varela',
                        fontSize: 20.0,
                    )
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                //당첨 리스트
                Container(
                child: Column(
                children: [
                  Container(
                  child: Column(
                    children: [
                      Column(
                        children: [
                          Text('1등',
                          style: TextStyle(
                            fontFamily: 'Varela',
                            fontSize: 20.0,
                            ),
                          ),
                          Text('$prize_1',
                          style: TextStyle(
                            fontFamily: 'Varela',
                            fontSize: 15.0,
                            ),
                          ),
                          SizedBox(height: 15.0,),

                        ],
                      ),
                      Column(
                        children: [
                          Text('2자리',
                          style: TextStyle(
                            fontFamily: 'Varela',
                            fontSize: 20.0,
                            ),
                          ),
                          Text('$prize_12',
                          style: TextStyle(
                            fontFamily: 'Varela',
                            fontSize: 15.0,
                            ),
                          ),
                          SizedBox(height: 15.0,),
                        ],
                      ),
                      Column(
                        children: [

                          Text('3자리(앞)',
                          style: TextStyle(
                            fontFamily: 'Varela',
                            fontSize: 20.0,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                          children:[
                            Text('$prize_f3',
                          style: TextStyle(
                            fontFamily: 'Varela',
                            fontSize: 15.0,
                            ),
                          ),
                            SizedBox(width:10),
                            ],
                          ),
                          SizedBox(height: 15.0,),

                          Text('3자리(뒤)',
                            style: TextStyle(
                              fontFamily: 'Varela',
                              fontSize: 20.0,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:[
                              Text('$prize_l3',
                                style: TextStyle(
                                  fontFamily: 'Varela',
                                  fontSize: 15.0,
                                ),
                              ),
                              SizedBox(width:10),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 15,),
                      Column(
                        children: [

                          Text('아차상',
                          style: TextStyle(
                            fontFamily: 'Varela',
                            fontSize: 20.0,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                          children:[
                            Text('$prize_n1',
                          style: TextStyle(
                            fontFamily: 'Varela',
                            fontSize: 15.0,
                            ),
                          ),
                            SizedBox(width:10),
                            ],
                          ),
                          SizedBox(height: 15.0,),
                        ],
                      ),

                      //숨김부분
                      SingleChildScrollView(
                        child: Visibility(
                          visible: isVisible,
                          child: Container(
                            height: 1050,
                            child: Column(
                              children: [

                                Text('2등',
                                  style: TextStyle(
                                    fontFamily: 'Varela',
                                    fontSize: 20.0,
                                  ),
                                ),
                                SizedBox(height: 10,),
                                Container(
                                  height: 50,
                                  child: GridView.builder(
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: prize_2.length,
                                    itemBuilder: (context, index) => Text(prize_2[index]
                                    ,style: TextStyle(fontSize: 15),),
                                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 5,
                                      //가로세로 비율
                                      childAspectRatio: (10/2),
                                    ),

                                  ),
                                ),
                                SizedBox(width:10),
                                SizedBox(height: 15.0,),
                                Text('3등',
                                  style: TextStyle(
                                    fontFamily: 'Varela',
                                    fontSize: 20.0,
                                  ),
                                ),
                                SizedBox(height: 10,),
                                Container(
                                  height: 50,
                                  child: GridView.builder(
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: prize_3.length,
                                    itemBuilder: (context, index) => Text(prize_3[index],style: TextStyle(fontSize: 15),),

                                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 5,
                                      childAspectRatio: (10/2),
                                    ),

                                  ),
                                ),
                                SizedBox(width:10),
                                SizedBox(height: 15.0,),Text('4등',
                                  style: TextStyle(
                                    fontFamily: 'Varela',
                                    fontSize: 20.0,
                                  ),
                                ),
                                SizedBox(height: 10,),
                                Container(
                                  height: 200,
                                  child: GridView.builder(
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: prize_4.length,
                                    itemBuilder: (context, index) => Text(prize_4[index],style: TextStyle(fontSize: 15),),
                                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 5,
                                      childAspectRatio: (10/2),
                                    ),

                                  ),
                                ),

                                SizedBox(width:10),
                                SizedBox(height: 15.0,),Text('5등',
                                  style: TextStyle(
                                    fontFamily: 'Varela',
                                    fontSize: 20.0,
                                  ),
                                ),
                                SizedBox(height: 10,),
                                Container(
                                  height: 500,
                                  child: GridView.builder(
                                    physics: NeverScrollableScrollPhysics(),
                                    itemCount: prize_5.length,
                                    itemBuilder: (context, index) =>
                                        Text(prize_5[index],style: TextStyle(fontSize: 15),),
                                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 5,
                                      childAspectRatio: (10/2),
                                    ),

                                  ),
                                ),
                                SizedBox(width:10),
                                SizedBox(height: 15.0,),

                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                 RaisedButton(
                 child: Text('Show/Hide'),
                   onPressed: () {
                    setState(() {
                      isVisible = !isVisible;
                    });
                   },),
                ],//로또번호 컬럼
                ),
                ),
                Divider( thickness: 1, color: Colors.grey, ),
                SizedBox(height:20.0),

                //댓글리스트
                ReplyScreen(),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => CmmtBox()));
        },
        child: Icon(Icons.create),
      ),


    );
  }
}



