import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:intl/intl.dart';



class ReplyScreen extends StatefulWidget {

  @override
  _ReplyScreenState createState() => _ReplyScreenState();
}


class _ReplyScreenState extends State<ReplyScreen> {

  final _firestore = FirebaseFirestore.instance;
  final messageTextController = TextEditingController();
  String inputText ='';
  int likey=0;
  int rereply =0;
  String formatDate = DateFormat('yy/MM/dd - HH:mm:ss').format(DateTime.now()); //format변경

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child:Column(
          children:[
            Row(
              children: [
                SizedBox(
                  width: 50.0,
                  height: 50.0,
                  child: CircleAvatar(
                    backgroundImage: NetworkImage("https://randomuser.me/api/portraits/men/28.jpg"),
                  ),
                ),
                SizedBox(
                  width: 20.0,
                ),
                Container(
                  width: MediaQuery.of(context).size.width*0.7,
                  padding: EdgeInsets.only(left: 5.0,top: 5.0),
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
                            inputText=value;
                            messageTextController.clear();
                            _firestore.collection('post').add({ //post라는 컬렉션에 contents컬럼으로 입력
                              'contents':inputText,
                              'time' : DateFormat('yy/MM/dd - HH:mm:ss').format(DateTime.now()),
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
                              color:Colors.black87.withOpacity(0.5),
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
            //사진과 댓글내용 GET
            Row(
              children: [
                StreamBuilder<QuerySnapshot>(
                  stream: _firestore.collection('post').orderBy('time',descending: true).snapshots(),
                  //builder는 context와 리턴받을 것을 parameter로 가짐
                  builder: (context, snapshot){
                    //스냅샷이 없는 경우 스피너
                    if(!snapshot.hasData){
                      return Center(
                        child: CircularProgressIndicator(
                          backgroundColor: Colors.lightBlueAccent,
                        ),
                      );
                    }
                    //messages는 post' 컬렉션 안에있는 데이터 내용
                      final messages = snapshot.data!.docs;
                    // messageWidgets 컬럼형식의 리스트 선언
                      List<Column> messageWidgets = [];
                      for(var message in messages){
                        final messageText = message.get('contents');
                        final time = message.get('time');
                        final likey = message.get('likey');
                        var doc_id =  message.id;
                        print("doc_id"+doc_id);
                        //messageWidget 한개
                        print(messageText);
                        final messageWidget =
                        Column(
                        children: [Row(
                            children:[
                              CircleAvatar(
                                backgroundImage: NetworkImage("https://randomuser.me/api/portraits/men/28.jpg"),
                              ),
                              SizedBox(
                                width: 20.0,
                              ),
                              Container(
                                    padding: EdgeInsets.all(5.0),
                                    height: 30.0,
                                    decoration: BoxDecoration(
                                    color: Colors.grey[350],
                                    borderRadius: BorderRadius.circular(10),
                                    ),
                                  child: Text('$messageText'),
                              ),
                            ]
                        ),
                    //bunch of reply
                          Row(
                                  children: [
                                    SizedBox(width:75.0),
                          LikeButton(
                            onTap: onLikeButtonTapped,
                            size: 20.0,
                          ),
                          Text('$likey',
                          style: TextStyle(
                          fontFamily: 'Varela',
                          fontSize: 10.0,
                          ),
                          ),
                          SizedBox(width: 10.0,),
                          Text('답글달기',
                          style: TextStyle(
                          fontFamily: 'Varela',
                          fontSize: 14.0,
                          ),
                          ),
                          Icon(Icons.mode_comment,
                          size: 15.0,),
                          Text('12',
                          style: TextStyle(
                          fontFamily: 'Varela',
                          fontSize: 10.0,
                          ),
                          ),
                          ],
                          ),
                      ]
                        );
                        messageWidgets.add(messageWidget);
                      }
                      return Expanded(
                        child: Column(
                          children: messageWidgets,
                        ),
                      );
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

  Future<bool> onLikeButtonTapped(bool isLiked) async{

    //해당 doc.id를 가져온다.


    print("프린트 테세트");


     //return success? !isLiked:isLiked;

    return !isLiked;
  }
}


