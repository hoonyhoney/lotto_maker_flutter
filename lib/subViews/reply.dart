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
  bool isMoreRequesting =false; //추가 데이터 가져올때 하단 인디케이터 표시
  int nextPage=0; //다음데이터 위치파악하기 위함
  List<String> serverItems= [];  //서버에 저장되어 있는 데이타들
  List<String> items = []; //실제 데이타를 서버에 가져와 저장되는 데이터(리스트에 표시할때 사용)
  double _dragDistance=0; //드레그 거리를 체크하기 위함 , 해당 값을 평균내서 50%이상 움직였을때 데이터를 불러오는 작업을 하게됨

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
                        final doc_id =  message.id;
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
    /// send your request here 클릭된 doc_id를 가져와서
    // final bool success= await sendRequest();

    //필드값 가져오기
    dynamic likeyCnt = FirebaseFirestore.instance.collection('post').doc("1wGpuEAWT1D0U1dAUK11").get().then((DocumentSnapshot ds){
      print(ds["likey"]);
    });
    /// if failed, you can do nothing
    // return success? !isLiked:isLiked;
    print(likeyCnt);
    return !isLiked;
  }

}

