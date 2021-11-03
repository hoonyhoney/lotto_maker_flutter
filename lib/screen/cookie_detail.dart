import 'package:flutter/material.dart';

import 'bottom_bar.dart';

class CookieDetail extends StatelessWidget {
  final assetPath, cookieprice, cookiename;

  CookieDetail({this.assetPath, this.cookieprice, this.cookiename});

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
        title: Text('Pickup',
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

      body: ListView(

        children: [
          SizedBox(height: 15.0,),
          Padding(
            padding: EdgeInsets.only(left: 20.0),
            child: Text(
              'Cookie',
              style:TextStyle(
                  fontFamily: 'Varela', fontSize:20.0, color:Color(0xFF545D68)
              ),
            ),
            ),
          //7분 20초부터

        ],


      ),

      floatingActionButton: FloatingActionButton(onPressed: () {  },
        backgroundColor: Color(0xFFF17532),
        child: Icon(Icons.fastfood),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomBar(),
    );
  }
}
