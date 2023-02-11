import 'dart:core';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:html/parser.dart';
import 'package:lotto_maker_flutter/services/win_numbers.dart';
import 'package:lotto_maker_flutter/subViews/dialogs.dart';
import 'package:lotto_maker_flutter/subViews/reply.dart';
import 'package:http/http.dart' as http;
import 'package:share/share.dart';

import 'bottom_bar.dart';
import 'fake_lottery.dart';

class NumberPage extends StatefulWidget with ChangeNotifier {
  @override
  State<NumberPage> createState() => _NumberPageState();
}

class _NumberPageState extends State<NumberPage> {
  Map? _userData;

  var prize_1;
  var prize_l2;
  var prize_f3;
  var prize_l3;
  var title;
  var prize_n1;
  var prize_n2;
  List<dynamic> prize_2 = [];
  List<dynamic> prize_3 = [];
  List<dynamic> prize_4 = [];
  List<dynamic> prize_5 = [];
  final textController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  WinNumbers winNumbers = new WinNumbers();

  String text = 'https://play.google.com/store/apps/details?id=com.lotto.tab';
  String subject = 'Oppa Lotto ตรวจหวย ฟรีเลขเด็ด แสดงความคิดเห็น';
  dynamic url = 'sample';

  @override
  void initState() {
    super.initState();
    getData();
  }

   Future<dynamic>getData() async {

    final response = await http.Client()
        .get(Uri.parse('https://www.matichon.co.th/lottery'));
    if (response.statusCode == 200) {
      var document = parse(response.body);

      setState(() {

        prize_1 = document
            .getElementsByClassName("udlotto-section-1-0")[0]
            .children[1]
            .children[0]
            .text;
        prize_f3 = document
            .getElementsByClassName("udlotto-section-1-1")[0]
            .children[1]
            .children[0]
            .text;
        prize_l2 = document
            .getElementsByClassName("udlotto-section-1-3")[0]
            .children[1]
            .children[0]
            .text;
        prize_l3 = document
            .getElementsByClassName("udlotto-section-1-2")[0]
            .children[1]
            .children[0]
            .text;
        title =
            document.getElementsByClassName("udlotto-date")[0].children[1].text;
        prize_n1 = document
            .getElementsByClassName("udlotto-section-2-1")[0]
            .children[0]
            .text
            .replaceAll(" ", "")
            .trim();
        //prize_n1.replaceAll("[^0-9","");
        prize_n2 = document
            .getElementsByClassName("udlotto-section-2-2")[0]
            .children[0]
            .text
            .replaceAll(" ", "")
            .trim();
        //prize_n2.replaceAll("[^0-9","");

        //step 1. 클래스에서 text를 가져온다.

        for (int i = 0; i < 5; i++) {
          var prizeNo = document
              .getElementsByClassName("udlotto-section-3-2")[i]
              .children[0]
              .text
              .replaceAll(" ", "")
              .trim();
          prize_2.add(prizeNo);
        }
        for (int i = 0; i < 10; i++) {
          var prizeNo3 = document
              .getElementsByClassName("udlotto-section-4-2")[i]
              .children[0]
              .text
              .replaceAll(" ", "")
              .trim();
          prize_3.add(prizeNo3);
        }
        for (int i = 0; i < 50; i++) {
          var prizeNo4 = document
              .getElementsByClassName("udlotto-section-5-2")[i]
              .children[0]
              .text
              .replaceAll(" ", "")
              .trim();
          prize_4.add(prizeNo4);
        }
        for (int i = 0; i < 100; i++) {
          var prizeNo5 = document
              .getElementsByClassName("udlotto-section-6-2")[i]
              .children[0]
              .text
              .replaceAll(" ", "")
              .trim();
          prize_5.add(prizeNo5);
        }
      });
    } else {
      getData();
    }
  }

  final _firestore = FirebaseFirestore.instance;
  bool isVisible = false;

  void getMessages() async {
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
      for (var message in snapshot.docs) {}
    }
  }



  void _showDialog(dynamic result) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialogs(result: result);
        });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(left: 5.0),
      controller: _scrollController,
      child: Row(
        children: [
          Expanded(
            child: Container(
              margin: EdgeInsets.only(bottom: 150.0),
              child: Wrap(
                alignment: WrapAlignment.center,
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
                      controller: textController,
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      cursorColor: Colors.black87,

                      //autofocus: true,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Varela',
                        fontSize: 20.0,
                      ),
                      decoration: InputDecoration(
                        hintText: "    พิมพ์หมายเลข",
                        hintStyle: TextStyle(
                          fontFamily: 'Varela',
                          fontSize: 20,
                          color: Colors.black87.withOpacity(0.5),
                        ),
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                      ),
                      onSubmitted: (value) {
                        var result = winNumbers.getResult(value,prize_1, prize_f3, prize_l2,prize_l3, prize_n1, prize_n2, prize_2,  prize_3,  prize_4, prize_5);
                        textController.clear();
                        _showDialog(result);
                      },
                    ),
                  ), //검색창
                  SizedBox(
                    height: 70.0,
                  ),
                  Container(
                    child: Text(title == null ? 'Loading' : '$title',
                        style: TextStyle(
                          fontFamily: 'Varela',
                          fontSize: 20.0,
                        )),
                  ), //날짜
                  SizedBox(
                    height: 50,
                  ),
                  //당첨 리스트
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,

                      children: [
                        Text(
                          '🏆🏆🏆 รางวัลที่ 1 🏆🏆🏆',
                          style: TextStyle(
                            fontFamily: 'Varela',
                            fontSize: 15.0,
                          ),
                        ),
                        Text(
                          prize_1 == null ? '' : '$prize_1',
                          style: TextStyle(
                            fontFamily: 'Varela',
                            fontWeight: FontWeight.bold,
                            fontSize: 30.0,
                          ),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Text(
                          '🏆🏆 เลขท้าย 2 ตัว 🏆🏆',
                          style: TextStyle(
                            fontFamily: 'Varela',
                            fontSize: 15.0,
                          ),
                        ),
                        Text(
                          prize_l2 == null ? '' : '$prize_l2',
                          style: TextStyle(
                            fontFamily: 'Varela',
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Text(
                          '🏆🏆 เลขหน้า 3 ตัว 🏆🏆',
                          style: TextStyle(
                            fontFamily: 'Varela',
                            fontSize: 15.0,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              prize_f3 == null ? '' : '$prize_f3',
                              style: TextStyle(
                                fontFamily: 'Varela',
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Text(
                          '🏆🏆 เลขท้าย 3 ตัว 🏆🏆 ',
                          style: TextStyle(
                            fontFamily: 'Varela',
                            fontSize: 15.0,
                          ),
                        ),
                        Text(
                          prize_l3 == null ? '' : '$prize_l3',
                          style: TextStyle(
                            fontFamily: 'Varela',
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Text(
                          '🏆🏆 รางวัลข้างเคียง 🏆🏆',
                          style: TextStyle(
                            fontFamily: 'Varela',
                            fontSize: 15.0,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              prize_n1 == null ? '' : '$prize_n1',
                              style: TextStyle(
                                fontFamily: 'Varela',
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 50.0),
                            Text(
                              prize_n2 == null ? '' : '$prize_n2',
                              style: TextStyle(
                                fontFamily: 'Varela',
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 10),
                          ],
                        ),
                        SizedBox(height: 30.0),

                        //숨김부분
                        Visibility(
                          visible: isVisible,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Divider(thickness: 2.0),
                              RaisedButton(
                                textColor: Colors.black87,
                                color: Colors.amberAccent,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular((10)),
                                ),
                                child: Icon(Icons.keyboard_arrow_up_outlined),
                                onPressed: () {
                                  setState(() {
                                    isVisible = !isVisible;
                                  });
                                  _scrollController.animateTo(0, // 가고자하는 높이
                                      duration: const Duration(milliseconds: 1),
                                      //시간
                                      curve: Curves.fastOutSlowIn); //효과
                                },
                              ),
                              SizedBox(height: 30),
                              Text(
                                'รางวัลที่ 2',
                                style: TextStyle(
                                  fontFamily: 'Varela',
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                height: 100,
                                child: GridView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: prize_2.length,
                                  itemBuilder: (context, index) => Text(
                                    prize_2[index],
                                    style: TextStyle(fontSize: 15),
                                  ),
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 5,
                                    //childAspectRatio: (3/2),
                                  ),
                                ),
                              ),
                              SizedBox(width: 10),
                              SizedBox(
                                height: 15.0,
                              ),
                              Text(
                                'รางวัลที่ 3',
                                style: TextStyle(
                                  fontFamily: 'Varela',
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                height: 150,
                                child: GridView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: prize_3.length,
                                  itemBuilder: (context, index) => Text(
                                    prize_3[index],
                                    style: TextStyle(fontSize: 15),
                                  ),
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 5,
                                    childAspectRatio: (3 / 2),
                                  ),
                                ),
                              ),
                              SizedBox(width: 10),
                              SizedBox(
                                height: 15.0,
                              ),
                              Text(
                                'รางวัลที่ 4',
                                style: TextStyle(
                                  fontFamily: 'Varela',
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                height: 600,
                                child: GridView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: prize_4.length,
                                  itemBuilder: (context, index) => Text(
                                    prize_4[index],
                                    style: TextStyle(fontSize: 15),
                                  ),
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 5,
                                    childAspectRatio: (3 / 2),
                                  ),
                                ),
                              ),
                              SizedBox(width: 10),
                              SizedBox(
                                height: 15.0,
                              ),
                              Text(
                                'รางวัลที่ 5',
                                style: TextStyle(
                                  fontFamily: 'Varela',
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                height: 1200,
                                child: GridView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: prize_5.length,
                                  itemBuilder: (context, index) => Text(
                                    prize_5[index],
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 5,
                                    childAspectRatio: (3 / 2),
                                  ),
                                ),
                              ),
                              SizedBox(width: 10),
                              SizedBox(
                                height: 15.0,
                              ),
                            ],
                          ),
                        ),
                        RaisedButton(
                          textColor: Colors.black87,
                          color: Colors.amberAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular((10)),
                          ),
                          child: Icon(Icons.keyboard_arrow_down_outlined),
                          onPressed: () {
                            setState(() {
                              isVisible = !isVisible;
                            });
                            _scrollController.animateTo(0, // 가고자하는 높이
                                duration: const Duration(milliseconds: 1), //시간
                                curve: Curves.fastOutSlowIn); //효과
                          },
                        ),
                        RaisedButton(
                            textColor: Colors.black87,
                            color: Colors.amberAccent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular((10)),
                            ),
                            child: Wrap(
                                alignment: WrapAlignment.center,
                                children: [
                                  Icon(
                                    Icons.share,
                                    size: 18.0,
                                  ),
                                  SizedBox(width: 5.0),
                                  Text(
                                    'Please Share ❤️‍',
                                  ),
                                ]),
                            onPressed: () {
                              final RenderObject? box =
                                  context.findRenderObject();
                              Share.share(
                                text,
                                subject: subject,
                              );
                            }),
                      ], //로또번호 컬럼
                    ),
                  ), //1등부터 아차상
                  Divider(
                    thickness: 1,
                    color: Colors.grey,
                  ),
                  SizedBox(height: 20.0),

                  //댓글리스트

                  Row(
                    children: [
                      Expanded(child: ReplyScreen(url: url)),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
