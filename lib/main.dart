import 'package:flutter/material.dart';
import 'package:lotto_maker_flutter/utilities/constants.dart';


//push test
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LottoMaker',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: homeView()
    );
  }
}

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
            title: const Text('เราไม่ทิ้งกัน Lotto', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
          ),
          body: _buildBody(),
        ),
      ),
    );
  }


  _buildBody() {
    return Container(

      child: Column(
        children: [
          SizedBox(height:20.0),
          TextField(
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


        ],
      ),
    );
  }
}
