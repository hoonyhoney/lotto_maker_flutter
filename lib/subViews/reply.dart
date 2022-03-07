import 'dart:convert';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:like_button/like_button.dart';
import 'package:intl/intl.dart';
import 'package:lotto_maker_flutter/model/messageVO.dart';

class ReplyScreen extends StatefulWidget {
  @override
  _ReplyScreenState createState() => _ReplyScreenState();
}

class _ReplyScreenState extends State<ReplyScreen> {
  final _firestore = FirebaseFirestore.instance;
  final messageTextController = TextEditingController();
  String inputText = '';
  int likey = 0;
  DateTime formatDate = DateTime.now().toLocal(); //format변경
  List<dynamic> messageList = []; //서버데이타를 담은것(Snapshot에서 string 추출)

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: 50.0,
                  height: 50.0,
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://randomuser.me/api/portraits/men/28.jpg"),
                  ),
                ),
                SizedBox(
                  width: 20.0,
                ),
                Container(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width * 0.7,
                  padding: EdgeInsets.only(left: 5.0, top: 5.0),
                  height: 30.0,
                  decoration: BoxDecoration(
                    color: Colors.grey[350],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        child: TextField(
                          //textInputAction: TextInputAction.go, //엔터키 치면 제출되게 설정
                          controller: messageTextController,
                          onSubmitted: (value) {
                            inputText = value;
                            messageTextController.clear();
                            _firestore.collection('post').add({
                              //post라는 컬렉션에 contents컬럼으로 입력
                              'contents': inputText,
                              'time': DateFormat('yyyy-MM-dd kk:mm:ss')
                                  .format(DateTime.now().toLocal()),
                              'likey': likey,
                            });
                          },
                          cursorColor: Colors.black87,
                          style: TextStyle(
                            fontFamily: 'Varela',
                            fontSize: 15.0,
                          ),
                          decoration: InputDecoration(
                            hintText: "댓글을 입력하세요...",
                            hintStyle: TextStyle(
                              fontFamily: 'Varela',
                              color: Colors.black87.withOpacity(0.5),
                            ),
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            //================================사진과 댓글내용 GET====================================
            Row(
              children: [
                StreamBuilder<QuerySnapshot>(
                  stream: _firestore
                      .collection('post')
                      .orderBy('time', descending: true)
                      .snapshots(),
                  //builder는 context와 리턴받을 것을 parameter로 가짐
                  builder: (context, snapshot) {
                    //스냅샷이 없는 경우 스피너
                    if (!snapshot.hasData) {
                      return Center(
                        child: CircularProgressIndicator(
                          backgroundColor: Colors.lightBlueAccent,
                        ),
                      );
                    }
                    //messages는 post' 컬렉션 안에있는 데이터 내용
                    //snapshot에 있는 데이타 추출
                    final messages = snapshot.data!.docs;
                    // messageWidgets 컬럼형식의 리스트 선언


                    for (var message in messages) {
                      final messageText = message.get('contents');
                      final time = message.get('time');
                      DateTime? newMillennium = DateTime.tryParse(time);
                      String timesAgo = Jiffy(time).fromNow();
                      final likey = message.get('likey');
                      final docId = message.id;
                      MessageVO msgVO = new MessageVO(likey: 0,time: '',timesAgo: '',docId: '', messageText: '');

                      msgVO.messageText = messageText;
                      print(msgVO.messageText);
                      msgVO.time = time;
                      print(msgVO.time);
                      msgVO.timesAgo = timesAgo;
                      print(msgVO.timesAgo);
                      msgVO.likey = likey;
                      print(msgVO.likey);
                      msgVO.docId = docId;
                      print(msgVO.docId);
                      messageList.add(msgVO);
                    }

                    return Expanded(
                      child: Column(
                        children: [
                          Container(
                            height: 300,
                            color: Colors.white,
                              child: ListView.builder(
                                itemCount: messageList.length,
                                itemBuilder: (context, index) {
                                  return Column(children: [
                                    Row(children: [
                                      CircleAvatar(
                                        backgroundImage: NetworkImage(
                                            "https://randomuser.me/api/portraits/men/28.jpg"),
                                      ),
                                      SizedBox(
                                        width: 20.0,
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(5.0),
                                        height: 30.0,
                                        decoration: BoxDecoration(
                                          color: Colors.grey[350],
                                          borderRadius:
                                          BorderRadius.circular(10),
                                        ),
                                        child: Text(
                                            '${messageList[index].messageText}'),
                                      ),
                                    ]),
                                    //bunch of reply
                                    Row(
                                      children: [
                                        SizedBox(width: 75.0),
                                        LikeButton(
                                          onTap: onLikeButtonTapped,
                                          size: 20.0,
                                        ),
                                        Text(
                                          '${messageList[index].likey}',
                                          style: TextStyle(
                                            fontFamily: 'Varela',
                                            fontSize: 10.0,
                                          ),
                                        ),
                                        SizedBox(width: 10.0),
                                        Text(
                                          '${messageList[index].timesAgo}',
                                          style: TextStyle(fontSize: 10.0),
                                        ),
                                        SizedBox(
                                          width: 10.0,
                                        ),
                                        /*Text('답글달기',
                            style: TextStyle(
                            fontFamily: 'Varela',
                            fontSize: 14.0,
                          ),
                          ),
                          Icon(Icons.mode_comment,
                          size: 15.0,), */
                                      ],
                                    ),
                                  ]); //메시지위젯 -끝-
                                },
                              ),
                            ),
                        ],
                      ),
                    );
                    //스크롤 이벤트 처리
                  },

                ),
              ],
            ),
            //좋아요와 댓글

            //댓글을 입력하세요
          ],
        ),
      ),
    );
  }

  Future<bool> onLikeButtonTapped(bool isLiked) async {
    /// send your request here 클릭된 doc_id를 가져와서
    // final bool success= await sendRequest();

    //필드값 가져오기
    dynamic likeyCnt = FirebaseFirestore.instance
        .collection('post')
        .doc()
        .get()
        .then((DocumentSnapshot ds) {
      print(["likey"]);
    });

    /// if failed, you can do nothing
    // return success? !isLiked:isLiked;
    print(likeyCnt);
    return !isLiked;
  }


/*
  //좋아요
  void like() {
    // 기존 좋아요 리스트를 복사
    final List likedUsers =
        List<String>.from(widget.document['likedUsers'] ?? []);
    // 나를 추가
    likedUsers.add(widget.user.email);

    //업데이트할 항목을 문서로 준비
    final updateData = {
      'likedUsers': likedUsers,
    };

    FirebaseFirestore.instance
        .collection('post')
        .doc(widget.document.documentId)
        .updateData(updateData);
  }

  //좋아요 취소
  void unlike() {
    // 기존 좋아요 리스트를 복사
    final List likedUsers =
    List<String>.from(widget.document['likedUsers'] ?? []);
    // 나를 추가
    likedUsers.remove(widget.user.email);

    //업데이트할 항목을 문서로 준비
    final updateData = {
      'likedUsers': likedUsers,
    };

    FirebaseFirestore.instance
        .collection('post')
        .doc(widget.document.documentId)
        .updateData(updateData);
  }
*/
}