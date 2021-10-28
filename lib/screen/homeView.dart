import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lotto_maker_flutter/model/lottoNumbers.dart';
import 'package:lotto_maker_flutter/utilities/constants.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class homeView extends StatelessWidget {

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: DefaultTabController(
        length:3,
        child: Scaffold(
          appBar: AppBar(

            backgroundColor: Colors.amber,
            bottom:  TabBar(
              indicatorWeight: 4,
              indicatorColor: Colors.black87,


              /*
                  탭 배경색 넣기
                  indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(50), // Creates border
                  color: Colors.black),*/
              tabs: [
                const Icon(Icons.home),
                const Icon(Icons.casino),
                const Icon(Icons.textsms),
              ],
            ),
            title:Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children :[ AnimatedTextKit(
                animatedTexts: [
                  WavyAnimatedText('รวย รวย รวย',
                textStyle: TextStyle(
                  fontSize: 30.0, color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                speed: Duration(milliseconds: 300)),
                ],
                isRepeatingAnimation: true,
                onTap: () {
                },
              ),
              ],
            ),

          ),
          body: _buildBody(),
        ),
      ),
    );
  }


  _buildBody() {
    return TabBarView(
      children:[ Container(

        child: Column(
          children: [
            SizedBox(height:20.0),
            Container(
              width: 400.0,
              height: 50.0,
              child: TextField(
                textAlign:TextAlign.center,
                keyboardType: TextInputType.number,
                decoration: kTextFieldInputDecoration,
                onChanged: (value){
                },

              ),
            ),
            SizedBox(height:50.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '2021.10.12 Number',
                ),
                Icon(
                    Icons.expand_more
                ),
              ],
            ),
            Container(
                height:300,
                child: _buildListView()
            ),
            TextButton.icon(
              onPressed: () {
              print('heel');
            },
              icon: Icon(
                Icons.expand_more,
                size:20,
              ),
              label:Text('더보기'),

            ),
                Container(width: 500,child: Divider(color: Colors.grey,thickness: 1.0,),),
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

                  Expanded(
                    child: Text(
                      '로또 드럽게 안맞네',
                    ),
                  ),
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

                Expanded(
                  child: Text(
                    '동감임당',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
        Container(
          child: Text(
            'Center'
          ),
        ),
        Container(
          child: Text(
            'last'
          )

        ),

    ],
    );

  }
}

Widget _buildListView(){

  ListTile _tile(String number) => ListTile(
      title: Text(number),
      /*leading: Image.network("https://randomuser.me/api/portraits/men/28.jpg")*/
  );


  return ListView(
    children: [
      _tile("123345"),
      _tile("40"),
      _tile("154"), _tile("598"),
      _tile("123"), _tile("456"),
    ],
  );
}