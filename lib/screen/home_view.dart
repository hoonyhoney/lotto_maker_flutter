import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lotto_maker_flutter/model/lotto_numbers.dart';
import 'package:lotto_maker_flutter/screen/second_page.dart';
import 'package:lotto_maker_flutter/utilities/constants.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'bottom_bar.dart';
import 'first_page.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _selectedIndex = 0;

  @override
  void initState() {
    //tabController를 set함
    super.initState();
    _tabController = TabController(
      length: 2,
      vsync: this,
    );
    _tabController.addListener(_handleSelection);
  }

  void _handleSelection() {
    setState(() {
      _selectedIndex = _tabController.index;
    });
  }

  void onTabTapped(int index) {
    setState(() {
      _tabController.index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
/*            leading:IconButton(
              icon: Icon(Icons.arrow_back, color: Color(0xFF545D68)),
              onPressed: () {  },
            ),*/
        title: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedTextKit(
                animatedTexts: [
                  WavyAnimatedText('หวย 로또 Lotto',
                      textStyle: TextStyle(
                        fontSize: 30.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      speed: Duration(milliseconds: 300)),
                ],
                isRepeatingAnimation: true,
                onTap: () {},
              ),
              SizedBox(
                width: 20.0,
              ),
              Image.asset(
                'images/th.png',
                width: 40,
                height: 40,
              ),
              SizedBox(
                width: 5.0,
              ),
              Image.asset(
                'images/kr.png',
                width: 40,
                height: 40,
              ),
            ],
          ),
        ),
        //앱바

        actions: [
/*           IconButton(
             icon: Icon(Icons.notifications_none, color: Color(0xFF545D68),
             ),
             onPressed: () {},
           ),*/
        ],
      ),
      body: TabBarView(
        controller: _tabController,
        physics: NeverScrollableScrollPhysics(), //탭바 슬라이드 안되게 설정
        children: [
          NumberPage(),
          GenerateScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _tabController.index,
        selectedItemColor: Colors.amberAccent[900],
        unselectedItemColor: Colors.grey[800],
        showUnselectedLabels: true,
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.casino),
            label: 'Lucky',
          ),
        ],
      ),
    );
  }
}
