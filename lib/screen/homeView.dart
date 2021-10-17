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
            bottom: const TabBar(
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
                  WavyAnimatedText('LottoMaker',speed: Duration(milliseconds: 300)),
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

  Widget _buildListView(){

    ListTile _tile(String prize, String number) => ListTile(
        title: Text(prize + number),
        leading: Image.network("https://randomuser.me/api/portraits/men/28.jpg")
    );


    return ListView(
      children: [
        _tile("1등","  123345"),
        _tile("2등","  123345"),
        _tile("3등","  123345"),
        _tile("4등","  123345"),
        _tile("5등","  123345"),
      ],
    );
  }


  _buildBody() {
    return Container(

      child: Column(
        children: [
          SizedBox(height:20.0),
          TextField(

            textAlign:TextAlign.center,
            keyboardType: TextInputType.number,
            decoration: kTextFieldInputDecoration,
            onChanged: (value){

            },

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
        ],

      ),
    );
  }
}