import 'dart:core';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:comment_box/comment/comment.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lotto_maker_flutter/screen/writePost.dart';
import 'package:lotto_maker_flutter/screen/writeReply.dart';
import 'package:lotto_maker_flutter/subViews/commentBox.dart';
import 'package:lotto_maker_flutter/subViews/reply.dart';
import 'package:lotto_maker_flutter/utilities/pinput.dart';

import 'bottom_bar.dart';


class NumberPage extends StatefulWidget {

  @override
  State<NumberPage> createState() => _NumberPageState();
}

class _NumberPageState extends State<NumberPage> {


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
      body: Container(
        child: Column(
          children: [
/*          Row(
            mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text('Finger Crossed',
              style: TextStyle(
                fontFamily: 'Varela',
                fontSize: 15.0,
              ),
            ),

            Container(
                   height: 30.0,
                   width: 30.0,
                   decoration: BoxDecoration(
                       image: DecorationImage(
                           image: AssetImage('images/finger.png'),
                           fit: BoxFit.contain
                       )
                   ),
                 ),
            SizedBox(width: 30.0,)
              ]
            ),*/


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
              height: 50.0,
              width: 200.0,
              child: Text('November 07, 2021',
                  style:TextStyle(
                    fontFamily: 'Varela',
                  fontSize: 20.0,
              )
              ),
            ),
            //당첨 리스트
            SingleChildScrollView(
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
                          fontSize: 15.0,
                          ),
                        ),
                        Text('114475',
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
                          fontSize: 15.0,
                          ),
                        ),
                        Text('79',
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
                          fontSize: 15.0,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                        children:[
                          Text('287',
                        style: TextStyle(
                          fontFamily: 'Varela',
                          fontSize: 15.0,
                          ),
                        ),
                          SizedBox(width:10),
                        Text('302',
                        style: TextStyle(
                          fontFamily: 'Varela',
                          fontSize: 15.0,
                          ),
                        ),
                          ],
                        ),
                        SizedBox(height: 15.0,),

                        Text('3자리(뒤)',
                          style: TextStyle(
                            fontFamily: 'Varela',
                            fontSize: 15.0,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:[
                            Text('123',
                              style: TextStyle(
                                fontFamily: 'Varela',
                                fontSize: 15.0,
                              ),
                            ),
                            SizedBox(width:10),
                            Text('456',
                              style: TextStyle(
                                fontFamily: 'Varela',
                                fontSize: 15.0,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      children: [

                        Text('3자리(앞)',
                          style: TextStyle(
                            fontFamily: 'Varela',
                            fontSize: 15.0,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:[
                            Text('287',
                              style: TextStyle(
                                fontFamily: 'Varela',
                                fontSize: 15.0,
                              ),
                            ),
                            SizedBox(width:10),
                            Text('302',
                              style: TextStyle(
                                fontFamily: 'Varela',
                                fontSize: 15.0,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 15.0,),

                        Text('3자리(뒤)',
                          style: TextStyle(
                            fontFamily: 'Varela',
                            fontSize: 15.0,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:[
                            Text('123',
                              style: TextStyle(
                                fontFamily: 'Varela',
                                fontSize: 15.0,
                              ),
                            ),
                            SizedBox(width:10),
                            Text('456',
                              style: TextStyle(
                                fontFamily: 'Varela',
                                fontSize: 15.0,
                              ),
                            ),
                          ],
                        ),
                        ],
                    ),
                    Visibility(
                      visible: isVisible,
                      child: Column(
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
                              Text('287',
                                style: TextStyle(
                                  fontFamily: 'Varela',
                                  fontSize: 20.0,
                                ),
                              ),
                              SizedBox(width:10),
                              Text('302',
                                style: TextStyle(
                                  fontFamily: 'Varela',
                                  fontSize: 20.0,
                                ),
                              ),
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
                              Text('123',
                                style: TextStyle(
                                  fontFamily: 'Varela',
                                  fontSize: 20.0,
                                ),
                              ),
                              SizedBox(width:10),
                              Text('456',
                                style: TextStyle(
                                  fontFamily: 'Varela',
                                  fontSize: 20.0,
                                ),
                              ),
                            ],
                          ),
                        ],
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
                 },)
              ],//로또번호 컬럼
            ),
            ),
            Divider( thickness: 1, color: Colors.grey, ),
            //댓글리스트
/*            ListView(
              children:replyList
            ),*/
            SizedBox(height:20.0),
            ReplyScreen(),
          ],
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



