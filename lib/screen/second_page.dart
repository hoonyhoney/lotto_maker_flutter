import 'package:flutter/material.dart';
import 'package:lotto_maker_flutter/screen/roulette.dart';
import 'package:lotto_maker_flutter/utilities/routes.dart';

import 'number_detail.dart';
import 'loading_screen.dart';

class GenerateScreen extends StatelessWidget {
  var prize_1;
  LoadingScreen _loadingScreen = new LoadingScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFCFAF8),
      body: ListView(
        children: [
          SizedBox(height: 15.0),
          Container(
            padding: EdgeInsets.only(left: 15.0, right: 15.0),
            width: MediaQuery.of(context).size.width - 30.0,
            height: MediaQuery.of(context).size.height - 50.0,
            child: GridView.count(
              crossAxisCount: 2,
              primary: false,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 15.0,
              childAspectRatio: 0.8,
              children: [
                _buildCard('roulette 🍀 ', 'images/wheel.png',
                    Routes.rouletteScreen, context, 1),
                _buildCard('Random 🐒', 'images/random.png',
                    Routes.randomScreen, context, 2),
                _buildCard('Fake 🧙‍️ ', 'images/winning.png',
                    Routes.fakeLottery, context, 3),
                Image.asset(
                  'images/coming-soon2.png',
                  width: 80,
                  height: 80,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  _buildCard(String title, String imgPath, dynamic routes, context, index) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 5.0, bottom: 5.0, left: 5.0, right: 5.0),
        child: InkWell(
          onTap: () {
            if (index == 1) {
              Navigator.of(context).pushNamed(Routes.rouletteScreen);
            }
            if (index == 2) {
              Navigator.of(context).pushNamed(Routes.randomScreen);
            }
            if (index == 3) {
              Navigator.of(context)
                  .pushNamed(Routes.fakeLottery, arguments: prize_1);
            }
          },
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 3.0,
                      blurRadius: 5.0)
                ],
                color: Colors.white),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [],
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
                            image: new ExactAssetImage(imgPath),
                            fit: BoxFit.contain)),
                  ),
                ),
                SizedBox(
                  height: 7.0,
                ),
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
                      Text(
                        title,
                        style: TextStyle(
                            fontFamily: 'Varela',
                            color: Color(0xFFD17E50),
                            fontSize: 18.0),
                      )
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
