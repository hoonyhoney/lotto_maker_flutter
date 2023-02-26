import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lotto_maker_flutter/services/get_result.dart';
import 'package:share/share.dart';

import '../utilities/qrcode_scanner.dart';

class PrizeOneToFive extends StatefulWidget {

  @override
  State<PrizeOneToFive> createState() => _PrizeOneToFiveState();
}

class _PrizeOneToFiveState extends State<PrizeOneToFive> {
  final ButtonStyle = ElevatedButton.styleFrom(
    textStyle: const TextStyle(
      color: Colors.black87,
    ),
    backgroundColor: Colors.amberAccent,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular((10)),
    ),
  );
  final ScrollController _scrollController = ScrollController();
  bool isVisible = false;
  String text = 'https://play.google.com/store/apps/details?id=com.lotto.tab';
  String subject = 'Oppa Lotto ตรวจหวย ฟรีเลขเด็ด แสดงความคิดเห็น';


  @override
  Widget build(BuildContext context) {
    return GetBuilder<GetResultController>(
      builder: (_) {
        return Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              TextButton(onPressed:(){
                Get.to(QRViewExample());
              }, child: Text("QR찍기")),
              Text(
                '🏆🏆🏆 รางวัลที่ 1 🏆🏆🏆',
                style: TextStyle(
                  fontFamily: 'Varela',
                  fontSize: 15.0,
                ),
              ),
              Text(
                _.prize_1 == null ? '' : '${_.prize_1}',
                style: TextStyle(
                  fontFamily: 'Varela',
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0,
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              Text(
                '🏆🏆 เลขท้าย 2 ตัว 🏆🏆',
                style: TextStyle(
                  fontFamily: 'Varela',
                  fontSize: 15.0,
                ),
              ),
              Text(
                _.prize_l2 == null ? '' : '${_.prize_l2}',
                style: TextStyle(
                  fontFamily: 'Varela',
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              Text(
                '🏆🏆 เลขหน้า 3 ตัว 🏆🏆',
                style: TextStyle(
                  fontFamily: 'Varela',
                  fontSize: 15.0,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    _.prize_f3 == null ? '' : '${_.prize_f3}',
                    style: TextStyle(
                      fontFamily: 'Varela',
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15.0,
              ),
              Text(
                '🏆🏆 เลขท้าย 3 ตัว 🏆🏆 ',
                style: TextStyle(
                  fontFamily: 'Varela',
                  fontSize: 15.0,
                ),
              ),
              Text(
                _.prize_l3 == null ? '' : '${_.prize_l3}',
                style: TextStyle(
                  fontFamily: 'Varela',
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              Text(
                '🏆🏆 รางวัลข้างเคียง 🏆🏆',
                style: TextStyle(
                  fontFamily: 'Varela',
                  fontSize: 15.0,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    _.prize_n1 == null ? '' : '${_.prize_n1}',
                    style: TextStyle(
                      fontFamily: 'Varela',
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 50.0),
                  Text(
                    _.prize_n2 == null ? '' : '${_.prize_n2}',
                    style: TextStyle(
                      fontFamily: 'Varela',
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 10),
                ],
              ),
              SizedBox(height: 30.0),

              //숨김부분
              Visibility(
                visible: isVisible,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Divider(thickness: 2.0),
                    ElevatedButton(
                      style: ButtonStyle,
                      child: Icon(Icons.keyboard_arrow_up_outlined),
                      onPressed: () {
                        setState(() {
                          isVisible = !isVisible;
                        });
                        _scrollController.animateTo(0, // 가고자하는 높이
                            duration: const Duration(milliseconds: 1),
                            //시간
                            curve: Curves.fastOutSlowIn); //효과
                      },
                    ),
                    SizedBox(height: 30),
                    Text(
                      'รางวัลที่ 2',
                      style: TextStyle(
                        fontFamily: 'Varela',
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 100,
                      child: GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: _.prize_2.length,
                        itemBuilder: (context, index) => Text(
                          _.prize_2[index],
                          style: TextStyle(fontSize: 15),
                        ),
                        gridDelegate:
                        SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 5,
                          //childAspectRatio: (3/2),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    SizedBox(
                      height: 15.0,
                    ),
                    Text(
                      'รางวัลที่ 3',
                      style: TextStyle(
                        fontFamily: 'Varela',
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 150,
                      child: GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: _.prize_3.length,
                        itemBuilder: (context, index) => Text(
                          _.prize_3[index],
                          style: TextStyle(fontSize: 15),
                        ),
                        gridDelegate:
                        SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 5,
                          childAspectRatio: (3 / 2),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    SizedBox(
                      height: 15.0,
                    ),
                    Text(
                      'รางวัลที่ 4',
                      style: TextStyle(
                        fontFamily: 'Varela',
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 600,
                      child: GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: _.prize_4.length,
                        itemBuilder: (context, index) => Text(
                          _.prize_4[index],
                          style: TextStyle(fontSize: 15),
                        ),
                        gridDelegate:
                        SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 5,
                          childAspectRatio: (3 / 2),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    SizedBox(
                      height: 15.0,
                    ),
                    Text(
                      'รางวัลที่ 5',
                      style: TextStyle(
                        fontFamily: 'Varela',
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 1200,
                      child: GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: _.prize_5.length,
                        itemBuilder: (context, index) => Text(
                          _.prize_5[index],
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        gridDelegate:
                        SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 5,
                          childAspectRatio: (3 / 2),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    SizedBox(
                      height: 15.0,
                    ),
                  ],
                ),
              ),




              ElevatedButton(
                style: ButtonStyle,
                child: Icon(Icons.keyboard_arrow_down_outlined),
                onPressed: () {
                  setState(() {
                    isVisible = !isVisible;
                  });
                  _scrollController.animateTo(0, // 가고자하는 높이
                      duration: const Duration(milliseconds: 1), //시간
                      curve: Curves.fastOutSlowIn); //효과
                },
              ),
              ElevatedButton(
                  style: ButtonStyle,
                  child: Wrap(
                      alignment: WrapAlignment.center,
                      children: [
                        Icon(
                          Icons.share,
                          size: 18.0,
                        ),
                        SizedBox(width: 5.0),
                        Text(
                          'Please Share ❤️‍',
                        ),
                      ]),
                  onPressed: () {
                    final RenderObject? box =
                    context.findRenderObject();
                    Share.share(
                      text,
                      subject: subject,
                    );
                  }),
            ], //로또번호 컬럼
          ),
        );
      }
    ); //1등부
  }
}
