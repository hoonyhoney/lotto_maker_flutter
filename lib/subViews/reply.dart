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
  bool isMoreRequesting = false; //추가 데이터 가져올때 하단 인디케이터 표시
  int nextPage = 0; //다음데이터 위치파악하기 위함
  double _dragDistance = 0; //드레그 거리를 체크하기 위함 , 해당 값을 평균내서 50%이상 움직였을때 데이터를 불러오는 작업을 하게됨
  List<dynamic> messageList = []; //서버데이타를 담은것(Snapshot에서 string 추출)
  List<dynamic> items = []; //실제 데이타를 서버에 가져와 저장되는 데이터(리스트에 표시할때 사용)

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
                            _firestore.collection('post').add(
                                { //post라는 컬렉션에 contents컬럼으로 입력
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
                  stream: _firestore.collection('post').orderBy(
                      'time', descending: true).snapshots(),
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
                      final doc_id = message.id;
                      MessageVO msgVO = new MessageVO(messageText: messageText, time: time, timesAgo: timesAgo, likey: likey);
                      msgVO.messageText=messageText;
                      msgVO.time=time;
                      msgVO.timesAgo=timesAgo;
                      msgVO.likey=likey;
                      messageList.add(msgVO); //messageList에 msgVO 객체 추가
                    }
                    requestNew();
                    //댓글내용 보여주는 부분
                    return Expanded(
                      child: Column(
                        children: [
                          Container(
                            color: Colors.white,
                            height: 1000.0,
                            //스크롤 할때 발생되는 이벤트 40%이상 스크롤 했을때 서버에서 데이터를 추가로 가져오는 루틴
                            child: NotificationListener<ScrollNotification>(
                              onNotification: (ScrollNotification notification) {
                                print("ScrollNotification?");
                                scrollNotification(notification);
                                return false;
                              },
                              child: RefreshIndicator(
                                onRefresh: requestNew,
                                child: ListView.builder(
                                  physics: AlwaysScrollableScrollPhysics(),
                                  // 리스트의 데이터가 적어 스크롤이 생성되지 않을경우 옵션
                                  itemCount: items.length,
                                  itemBuilder: (context, index) {
                                    return
                                        Column(
                                            children: [
                                              Row(
                                                  children: [
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
                                                        borderRadius: BorderRadius.circular(
                                                            10),
                                                      ),
                                                      child: Text('${items[index].messageText}'),
                                                    ),
                                                  ]
                                              ),
                                              //bunch of reply
                                              Row(
                                                children: [
                                                  SizedBox(width: 75.0),
                                                  LikeButton(
                                                    onTap: onLikeButtonTapped,
                                                    size: 20.0,
                                                  ),
                                                  Text('${items[index].likey}',
                                                    style: TextStyle(
                                                      fontFamily: 'Varela',
                                                      fontSize: 10.0,
                                                    ),
                                                  ),
                                                  SizedBox(width: 10.0),
                                                  Text('${items[index].timesAgo}', style: TextStyle(
                                                      fontSize: 10.0
                                                  ),),
                                                  SizedBox(width: 10.0,),
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
                                            ]
                                        ); //메시지위젯 -끝-
                                  },
                                ),
                              ),
                            ),
                          ),

                          //로딩바
                          Container(
                            height: isMoreRequesting ? 50.0 : 0,
                            color: Colors.white,
                            child: Center(
                              child: CircularProgressIndicator(),
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
    dynamic likeyCnt = FirebaseFirestore.instance.collection('post').doc()
        .get()
        .then((DocumentSnapshot ds) {
      print(["likey"]);
    });

    /// if failed, you can do nothing
    // return success? !isLiked:isLiked;
    print(likeyCnt);
    return !isLiked;
  }

  //스크롤 이벤트 처리
scrollNotification(notification) {
    //스크롤 최대 범위
   var containerExtent = notification.metrics.viewportDimension;
    if (notification is ScrollStartNotification) {
      //스크롤을 시작하면
      //스크롤 거리값을 0으로 초기화함
      _dragDistance = 0;
    } else if (notification is OverscrollNotification) { //안드로이드 case
      //스크롤을 시작후 움직일때 발생(손가락으로 리스트를 누르고 움직일때)
      //스크롤을 움직인 만큼 빼준다. (notification.overscroll)
      _dragDistance -= notification.overscroll;
    } else if (notification is ScrollUpdateNotification) { //IOS case
      _dragDistance -= notification.scrollDelta!;
    } else if (notification is ScrollEndNotification) {
      //스크롤이 끝났을 때
      //지금까지 움직인 거리를 최대 거리로 나눈다.
      var percent = _dragDistance / (containerExtent);
      //해당값이 -0.4(40%) 아래서 위로 움직였다면,
      if (percent <= -0.4) {
        //maxScrollExtent는 리스트 가장 아래위치값
        //pixels는 현재 위치값
        // 두 값이 같다면(스크롤이 가장 아래에 있다)
        if (notification.metrics.maxScrollExtent ==
            notification.metrics.pixels) {
          setState(() {
            //서버에서 데이터를 더 가져오는 효과
            //하단에 프로그레스 서클 표시용
            isMoreRequesting = true;
          });
          //서버에서 데이터 가져옴
          requestMore().then((value) {
            setState(() {
              //다 가져오면 하단표시 서클 제거
              isMoreRequesting = false;
            });
          });
        }
      }
    }
  }

  //서버에서 처음 데이터 가져오기
  Future<void> requestNew() async {
    print('request New');
    nextPage = 0;
    items.clear();
    setState(() {
      items += messageList.sublist(nextPage * 10, (nextPage * 10) + 10);
      nextPage += 1;
    });
  }

  //서버에서 추가 데이터 가져올때
  Future<void> requestMore() async {
    //읽을 데이터 위치 얻기
    int nextDataPosition = (nextPage * 10);
    //읽을 데이터 크기
    int dataLength = 10;
    // 읽을 데이터가 서버에 있는 데이터 총 크기보다 크다면 더이상 읽을 데이터가 없다고 판단
    if (nextDataPosition > messageList.length) {
      return;
    }
    // 읽을 데이타는 있지만 10개가 안되는 경우
    if ((nextDataPosition + 10) > messageList.length) {
      dataLength = messageList.length - nextDataPosition;
    }
    setState(() {
      //데이터 읽기
      items +=
          messageList.sublist(nextDataPosition, nextDataPosition + dataLength);
      //다음을 위해 페이지 증가
      nextPage += 1;
    });
  }
}