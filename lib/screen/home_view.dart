import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lotto_maker_flutter/screen/second_page.dart';
import 'package:lotto_maker_flutter/utilities/qrcode_scanner.dart';
import '../services/get_result.dart';
import 'first_page.dart';

class MyHomePage extends StatefulWidget {


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _selectedIndex = 0;
  final controller = Get.put(GetResultController());
  String qrCode = Get.arguments;



  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 2,
      vsync: this,
    );
    _tabController.addListener(_handleSelection);
    controller.getData();
  }

  void _handleSelection() {
    setState(() {
      _selectedIndex = _tabController.index;
    });
  }

  void onTabTapped(int index) {
    setState(() {
      _tabController.index = index;
      qrCode="";
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
          NumberPage(qrCode: qrCode),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
        Get.to(QRViewExample());
          },
        child:Image.asset(
          'images/qrScan.png',
        ),
      ),
      floatingActionButtonLocation: CustomFloatingActionButtonLocation(Offset(335,160)),
    );
  }
}

class CustomFloatingActionButtonLocation extends FloatingActionButtonLocation{
  final Offset offset;

  CustomFloatingActionButtonLocation(this.offset);

  @override
  Offset getOffset(ScaffoldPrelayoutGeometry scaffoldPrelayoutGeometry){
    return offset;
  }
  @override
  String toString() => 'CustomFloatingAcationButtonLocation';
}
