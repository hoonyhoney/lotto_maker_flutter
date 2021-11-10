import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lotto_maker_flutter/model/lottoNumbers.dart';
import 'package:lotto_maker_flutter/screen/cookie_page.dart';
import 'package:lotto_maker_flutter/utilities/constants.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'bottom_bar.dart';
import 'number.dart';

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}
 class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {

   late TabController _tabController;

   @override
   void initState() {
     //tabController를 set함
     super.initState();
     _tabController = TabController(length: 2, vsync: this);
   }

   @override
   Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(
         backgroundColor: Colors.white,
         elevation: 0.0,
         centerTitle: true,
/*            leading:IconButton(
              icon: Icon(Icons.arrow_back, color: Color(0xFF545D68)),
              onPressed: () {  },
            ),*/
           title:Row(
             mainAxisAlignment: MainAxisAlignment.center,
             children :[ AnimatedTextKit(
               animatedTexts: [
                 WavyAnimatedText('Finger Crossed',
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
               Container(
                 height: 50.0,
                 width: 50.0,
                 decoration: BoxDecoration(
                     image: DecorationImage(
                         image: AssetImage('images/finger.png'),
                         fit: BoxFit.contain
                     )
                 ),
               ),
             ],
           ),

       actions: [
           IconButton(
             icon: Icon(Icons.notifications_none, color: Color(0xFF545D68),
             ),
             onPressed: () {},
           ),
         ],
       ),
       body: ListView(
         padding: EdgeInsets.only(left: 5.0),
         children: [
           SizedBox(height: 15.0),
           SizedBox(height: 15.0),
           TabBar(
             controller: _tabController,
             indicatorColor: Colors.transparent,
             labelColor: Color(0xFFC88D67),
             isScrollable: true,
             labelPadding: EdgeInsets.only(right: 45.0),
             unselectedLabelColor: Color(0xFFCDCDCD),
             tabs: [
               Expanded(
                 child: Tab(

                   child: Icon(
                     Icons.home
                   ),
                 ),

               ),
               Expanded(
                 child: Tab(
                   child: Icon(
                       Icons.casino
                   ),
                 ),

               ),
             ],


           ),
           Container(
             height: MediaQuery
                 .of(context)
                 .size
                 .height - 20.0,
             width: double.infinity,
             child: TabBarView(
               controller: _tabController,
               children: [
                 NumberPage(),
                 CookiePage(),
               ],
             ),
           )
         ],
       ),

       /*  bottomNavigationBar: BottomBar(),*/
     );
   }
 }