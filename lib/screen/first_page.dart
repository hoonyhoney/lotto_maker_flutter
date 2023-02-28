import 'dart:core';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lotto_maker_flutter/screen/prize_one_to_five.dart';
import 'package:lotto_maker_flutter/services/win_numbers.dart';

import '../services/get_result.dart';
import '../utilities/qrcode_scanner.dart';
import '../widget/dialogs.dart';
import '../widget/reply.dart';


class NumberPage extends StatefulWidget with ChangeNotifier {
   NumberPage({required this.qrCode});
   final String qrCode;

  @override
  State<NumberPage> createState() => _NumberPageState();
}

class _NumberPageState extends State<NumberPage> {

  final textController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final controller = Get.put(GetResultController());
  final _firestore = FirebaseFirestore.instance;
  bool isVisible = false;
  WinNumbers winNumbers = new WinNumbers();
  dynamic url = 'sample';


  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () {
      qrCodeScanResult(widget.qrCode.substring(9));

    });
  }


  @override
  Widget build(BuildContext context) {


    final ButtonStyle = ElevatedButton.styleFrom(
      textStyle: const TextStyle(
        color: Colors.black87,
      ),
      backgroundColor: Colors.amberAccent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular((10)),
      ),
    );

    return GetBuilder<GetResultController>(
      builder: (_) {
        return SingleChildScrollView(
          padding: EdgeInsets.only(left: 5.0),
          controller: _scrollController,
          child: Row(
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(bottom: 150.0),
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.only(right: 10.0),
                        height: 50.0,
                        decoration: BoxDecoration(
                          color: Colors.amberAccent,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: TextField(
                          controller: textController,
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          cursorColor: Colors.black87,

                          //autofocus: true,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Varela',
                            fontSize: 20.0,
                          ),
                          decoration: InputDecoration(
                            hintText: "    พิมพ์หมายเลข",
                            hintStyle: TextStyle(
                              fontFamily: 'Varela',
                              fontSize: 20,
                              color: Colors.black87.withOpacity(0.5),
                            ),
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                          ),
                          onSubmitted: (value) {
                            var result = winNumbers.getResult(
                                value,
                                _.prize_1,
                                _.prize_f3,
                                _.prize_l2,
                                _.prize_l3,
                                _.prize_n1,
                                _.prize_n2,
                                _.prize_2,
                                _.prize_3,
                                _.prize_4,
                                _.prize_5);
                            textController.clear();
                            _showDialog(result);
                          },
                        ),
                      ), //검색창
                      SizedBox(
                        height: 70.0,
                      ),
                      Container(
                        child: Text(_.title == null ? 'Loading' : '${_.title}',
                            style: TextStyle(
                              fontFamily: 'Varela',
                              fontSize: 20.0,
                            )),
                      ), //날짜
                      SizedBox(
                        height: 50,
                      ),
                      //당첨 리스트
                      PrizeOneToFive(),
                      Divider(
                        thickness: 1,
                        color: Colors.grey,
                      ),
                      SizedBox(height: 20.0),

                      //댓글리스트

                      Row(
                        children: [
                          Expanded(child: ReplyScreen(url: url)),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      }
    );
  }
  void getMessages() async {
    final messages = await _firestore.collection('post').get();
    for (var message in messages.docs) {
      print(message.data());
    }
  }

  //메시지 구독 , 메시지가 업데이트되면 전체 내용을 다시 불러옴
  void messagesStream() async {
    //bunch of 스냅샷 중 snap을 하나 꺼냄
    await for (var snapshot in _firestore.collection('post').snapshots()) {
      // 그 snapshot 에서 메시지를 하나 꺼냄
      for (var message in snapshot.docs) {}
    }
  }

  void _showDialog(dynamic result) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialogs(result: result);
        });
  }
  void qrCodeScanResult(String qrCode) {
    print("QrCode"+qrCode);
      var result = winNumbers.getResult(
          qrCode,
          GetResultController().prize_1,
          GetResultController().prize_f3,
          GetResultController().prize_l2,
          GetResultController().prize_l3,
          GetResultController().prize_n1,
          GetResultController().prize_n2,
          GetResultController().prize_2,
          GetResultController().prize_3,
          GetResultController().prize_4,
          GetResultController().prize_5);
      print("result"+result);
      _showDialog(result);
  }
}
