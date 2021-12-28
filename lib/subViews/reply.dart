import 'package:flutter/material.dart';

class ReplyScreen extends StatefulWidget {

  @override
  _ReplyScreenState createState() => _ReplyScreenState();
}

class _ReplyScreenState extends State<ReplyScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child:Column(
        children:[
          //사진과 댓글내용
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
                padding: EdgeInsets.all(5.0),
                height: 30.0,
                decoration: BoxDecoration(
                  color: Colors.grey[350],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Expanded(

                  child: Text('쩐다ㄷㄷㄷㄷㄷㄷㄷㄷㄷㄷㄷ',
                    style: TextStyle(
                      height: 1.2,
                      fontFamily: 'Varela',
                      fontSize: 15.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
          //좋아요와 댓글
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
              SizedBox(width: 10.0,),
              Text('답글달기',
                style: TextStyle(
                  fontFamily: 'Varela',
                  fontSize: 14.0,
                ),
              ),
              Icon(Icons.mode_comment,
              size: 15.0,),
            ],
          ), Row(
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
                padding: EdgeInsets.all(5.0),
                height: 30.0,
                decoration: BoxDecoration(
                  color: Colors.grey[350],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Expanded(

                  child: Text('쩐다ㄷㄷㄷㄷㄷㄷㄷㄷㄷㄷㄷ',
                    style: TextStyle(
                      height: 1.2,
                      fontFamily: 'Varela',
                      fontSize: 15.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
          //좋아요와 댓글
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
              SizedBox(width: 10.0,),
              Text('답글달기',
                style: TextStyle(
                  fontFamily: 'Varela',
                  fontSize: 14.0,
                ),
              ),
              Icon(Icons.mode_comment,
              size: 15.0,),
            ],
          ),Row(
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
                padding: EdgeInsets.all(5.0),
                height: 30.0,
                decoration: BoxDecoration(
                  color: Colors.grey[350],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Expanded(

                  child: Text('쩐다ㄷㄷㄷㄷㄷㄷㄷㄷㄷㄷㄷ',
                    style: TextStyle(
                      height: 1.2,
                      fontFamily: 'Varela',
                      fontSize: 15.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
          //좋아요와 댓글
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
              SizedBox(width: 10.0,),
              Text('답글달기',
                style: TextStyle(
                  fontFamily: 'Varela',
                  fontSize: 14.0,
                ),
              ),
              Icon(Icons.mode_comment,
              size: 15.0,),
            ],
          ),
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
                padding: EdgeInsets.all(5.0),
                height: 30.0,
                decoration: BoxDecoration(
                  color: Colors.grey[350],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Expanded(

                  child: Text('댓글을 입력하세요...',
                    style: TextStyle(
                      height: 1.2,
                      fontFamily: 'Varela',
                      fontSize: 15.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

