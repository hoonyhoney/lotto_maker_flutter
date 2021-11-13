import 'package:flutter/material.dart';

import 'cookie_detail.dart';

class CookiePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFCFAF8),
      body: ListView(
        children: [
          SizedBox(height: 15.0),
          Container(
            padding: EdgeInsets.only(right: 15.0),
            width: MediaQuery.of(context).size.width -30.0,
            height: MediaQuery.of(context).size.height -50.0,
            child: GridView.count(
              crossAxisCount: 2,
              primary: false,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 15.0,
              childAspectRatio: 0.8,
              children: [
                _buildCard('Random 🍀 ',"https://randomuser.me/api/portraits/men/28.jpg", context),
                _buildCard('Zodiac 🐒','https://randomuser.me/api/portraits/men/29.jpg', context),
                _buildCard('Name ✍ ','https://randomuser.me/api/portraits/men/30.jpg', context),
                _buildCard('Fake 🧙‍️ ','https://randomuser.me/api/portraits/men/31.jpg', context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _buildCard(String title, String imgPath, context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 5.0, bottom: 5.0, left: 5.0, right: 5.0),
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder:(context) => CookieDetail(
                assetPath: imgPath,
                cookiename: title,
              )));
          },

          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 3.0,
                  blurRadius: 5.0
                )
              ],
              color: Colors.white
            ),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                    ],
                  ),
                ),

                //이미지
                Hero(
                  tag: imgPath,
                  child: Container(
                    height: 150.0,
                    width: 150.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(imgPath),
                          fit: BoxFit.contain
                      )
                    ),
                  ),
                ),
                SizedBox(height: 7.0,),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Container(
                    color: Color(0xFFEBEBEB),
                    height: 1.0,
                  ),
                ),

                //구분선
                Padding(
                  padding: EdgeInsets.only(left: 5.0, right: 5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                        Text( title,
                          style: TextStyle(fontFamily: 'Varela',color: Color(0xFFD17E50), fontSize: 18.0),)
                    ],
                  ),
                ),
                SizedBox(height: 7.0),

              ],
            ),
          ),
        ),
      ),
    );

  }
}
