import 'dart:core';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lotto_maker_flutter/screen/writePost.dart';
import 'package:lotto_maker_flutter/screen/writeReply.dart';
import 'package:lotto_maker_flutter/subViews/reply.dart';
import 'package:lotto_maker_flutter/utilities/pinput.dart';
import 'package:pinput/pin_put/pin_put.dart';
import 'package:pinput/pin_put/pin_put_state.dart';

import 'bottom_bar.dart';


class NumberPage extends StatefulWidget {

  @override
  State<NumberPage> createState() => _NumberPageState();
}

class _NumberPageState extends State<NumberPage> {
  void _writePost() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => WritePost()));
  }

  bool isVisible =false;

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
              margin: const EdgeInsets.only(right: 10.0, left:10.0),
              height: 50.0,
              decoration: BoxDecoration(
                color: Colors.amberAccent,
                borderRadius: BorderRadius.circular(20),

              ),
              child: TextField(
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
                  //enabledBorder: InputBorder.none,
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
          showModalBottomSheet(context: context,
            isScrollControlled: true,
            builder: (context) =>SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                child: writeReply(),
              ),
            ),
          );
        },
        tooltip: 'Increment',
        child: Icon(Icons.create),
      ),

    );
  }
}



