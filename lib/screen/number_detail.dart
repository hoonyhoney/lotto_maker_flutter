import 'package:flutter/material.dart';
import 'package:lotto_maker_flutter/services/generateNumber.dart';

import 'bottom_bar.dart';


class NumberDetail extends StatefulWidget {
  //numberDetail의 파라미터는 loadingscreen으로 부터 넘어온 luckylist
  final luckylist;
  NumberDetail({this.luckylist});

  @override
  _NumberDetailState createState() => _NumberDetailState();
}

class _NumberDetailState extends State<NumberDetail> {

  dynamic luckynumberlist = NumberDetail().luckylist;

  void main() {
    print(luckynumberlist);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        leading:IconButton(
          icon: Icon(Icons.arrow_back, color: Color(0xFF545D68)),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text('Lucky Number',
          style:TextStyle(
              fontFamily: 'Varela', fontSize:20.0, color:Color(0xFF545D68)
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_none, color:Color(0xFF545D68),
            ),
            onPressed: () {  },
          ),
        ],
      ),

      body: Container(

        child: Column(
          children: [
          SizedBox(height: 15.0,),

          ListView.builder(
            itemCount: luckynumberlist.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(luckynumberlist[index],
                  style:TextStyle(
                      fontFamily: 'Varela', fontSize:20.0, color:Color(0xFF545D68)
                  ),
                ),
              );
            },
          ),
          //7분 20초부터
        ],
        ),

      ),
      bottomNavigationBar: BottomBar(),
    );
  }
}

