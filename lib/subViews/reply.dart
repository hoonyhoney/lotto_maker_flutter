import 'dart:convert';
import 'dart:developer';


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:like_button/like_button.dart';
import 'package:intl/intl.dart';
import 'package:lotto_maker_flutter/model/messageVO.dart';
import 'package:path/path.dart';

class ReplyScreen extends StatefulWidget {
  String url;
  ReplyScreen({required this.url});


  @override
  _ReplyScreenState createState() => _ReplyScreenState();
}

class _ReplyScreenState extends State<ReplyScreen> {

  final _firestore = FirebaseFirestore.instance;
  final messageTextController = TextEditingController();
  String inputText = '';
  int likey = 0;
  DateTime formatDate = DateTime.now().toLocal(); //format변경
  bool loading = false,
      allLoaded = false;

  List<MessageVO> messageList = [];
  MessageVO msgVO = new MessageVO(docId: '',
      messageText: '',
      time: '',
      timesAgo: '',
      likey: 0);

  @override
  Widget build(BuildContext context) {
    print(url);
    return SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
      child: Expanded(
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: 50.0,
                  height: 50.0,
                  child: CircleAvatar(
                    backgroundImage: NetworkImage("$url"),
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
                  child: Row(
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
            StreamBuilder<QuerySnapshot>( //이 안에 있는 데이타가 변경되야 스트림이 발동됨) ㅅㅂ
              stream: _firestore
                  .collection('post')
                  .orderBy('time', descending: true)
                  .limit(200)
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
                messageList = [];
                for (var message in messages) {
                  String messageText = message.get('contents');
                  String time = message.get('time');
                  DateTime? newMillennium = DateTime.tryParse(time);
                  String timesAgo = Jiffy(time).fromNow();
                  int likey = message.get('likey');
                  String docId = message.id;
                  MessageVO msgVO = new MessageVO(docId: '',
                      messageText: '',
                      time: '',
                      timesAgo: '',
                      likey: 0);
                  msgVO.messageText = messageText;
                  msgVO.time = time;
                  msgVO.timesAgo = timesAgo;
                  msgVO.likey = likey;
                  msgVO.docId = docId;
                  messageList.add(msgVO);
                }

                return Column(
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),//스크롤 금지
                      itemCount: messageList.length,
                      itemBuilder: (context, index) {
                        return Column(
                            children: [
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
                  ],
                );

                //스크롤 이벤트 처리
              },
            ),
            //댓글을 입력하세요
          ],
        ),
      ),
    );
  }

/*  getData() {
    //다큐먼트 리스트의 time값 모두 불러오기
    FirebaseFirestore.instance
        .collection('post')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        print(doc["time"]);
      });'
    });
*/

    //다큐먼트객체 한개 불러오기
/*    FirebaseFirestore.instance
        .collection('post')
        .doc("BTLQ0M5ytSLbR8atNjhN")
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        print('Document data: ${documentSnapshot.data()}');
      } else {
        print('Document does not exist on the database');
      }
    });

  }
*/
  addingData() {
    CollectionReference post = FirebaseFirestore.instance.collection('post');
    List<String> likedList = [];

    return post
        .doc('BTLQ0M5ytSLbR8atNjhN')
        .update({
      'likedUsers': "Lee"
    })
        .then((value) => print("User Added"))

        .catchError((error) => print("Failed to add user: $error"));
  }

  removingData(){
    CollectionReference post = FirebaseFirestore.instance.collection('post');
    return post
        .doc('BTLQ0M5ytSLbR8atNjhN')
        .update({
      'likedUsers' : FieldValue.delete()
    })
        .then((value) => print("User Added"))

        .catchError((error) => print("Failed to add user: $error"));

  }

  Future<bool> onLikeButtonTapped(bool isLiked) async {
    removingData();
    return !isLiked;
  }

  //좋아요
  Future<void> like() async {
/*    // 기존 좋아요 리스트를 복사
    final List likedUsers =
        List<String>.from(widget.data()['likedUsers'] ?? []);
    // 나를 추가
    likedUsers.add(widget.user.email);

    //업데이트할 항목을 문서로 준비
    final updateData = {
      'likedUsers': likedUsers,
    };*/

  }
/*  //좋아요 취소
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
  }*/

}