import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ReplyScreen extends StatefulWidget {

  @override
  _ReplyScreenState createState() => _ReplyScreenState();
}


class _ReplyScreenState extends State<ReplyScreen> {

  final _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Container(
      child:Column(
        children:[
          //사진과 댓글내용
          Row(
            children: [
              StreamBuilder<QuerySnapshot>(
                stream: _firestore.collection('post').snapshots(),
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
                    final messages = snapshot.data!.docs;
                    List<Column> messageWidgets = [];
                    for(var message in messages){
                      final messageText = message.get('contents');
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
                  Text('좋아요',
                  style: TextStyle(
                  fontFamily: 'Varela',
                  fontSize: 14.0,
                  ),
                  ),
                  Icon(Icons.thumb_up,
                  size: 15.0,),
                  Text('123',
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
        ],
      ),
    );
  }
}


