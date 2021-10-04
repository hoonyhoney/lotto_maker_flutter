import 'package:flutter/material.dart';


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
                const Text('Home', style: TextStyle(fontSize: 18.0)),
                const Text('LuckyNumber',style: TextStyle(fontSize: 15.0)),
                const Text('Board',style: TextStyle(fontSize: 18.0)),
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
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.search),
              hintText: 'Please enter number',
            ),
          ),
          Column()


        ],
      ),
    );
  }
}
