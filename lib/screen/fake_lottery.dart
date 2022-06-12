import 'dart:io';

import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'dart:ui' as ui;
import 'package:path_provider/path_provider.dart';
import 'package:share/share.dart';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share/share.dart';
import 'dart:math' as math;

import '../services/win_numbers.dart';
import 'first_page.dart';

class FakeLottery extends StatefulWidget {
  @override
  State<FakeLottery> createState() => _FakeLotteryState();
}

class _FakeLotteryState extends State<FakeLottery> {
  String comment = '';
  dynamic prize1;
  dynamic title;
  int _counter = 0;
  late Uint8List _imageFile = Uint8List(0); //imageFile초기화
  //ScreenshotController screenshotController = ScreenshotController(); //스크린샷 컨트롤러 객체 생성
  GlobalKey previewContainer = new GlobalKey();

  @override
  void initState() {
    getPrizeNumber();
    super.initState();
  }

  dynamic getPrizeNumber() async {
    prize1 = await WinNumbers().getData();
    String titleData = await WinNumbers().getTitle();
    title = titleData.substring(9);
    setState(() {
      prize1;
      title;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<WinNumbers>(
      create: (_) => WinNumbers(),
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/flag.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: SingleChildScrollView(
              child: Container(
                child: Column(
                  children: [
                    RepaintBoundary(
                      key: previewContainer,
                      child: Stack(
                        children: [
                          Container(
                            //로또 이미지
                            width: 350,
                            height: 250,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image:
                                        AssetImage('images/fake_lottery.png'),
                                    fit: BoxFit.contain)),
                          ),
                          Positioned(
                            top: 50,
                            left: 185,
                            child: Container(
                              child: Transform.rotate(
                                angle: -math.pi / 0,
                                child: Text(
                                  prize1 == null ? 'Loading' : '$prize1',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Color(0xff5C4B30), //색깔은 0xff +
                                    letterSpacing: 7.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 73,
                            left: 180,
                            child: Container(
                              child: Text(title == null ? '' : '$title'),
                            ),
                          ),
                          Positioned(
                            top: 95,
                            left: 200,
                            child: Container(
                              child: Text(
                                '$comment',
                              ),
                            ),
                          ),
                          Positioned(
                            top: 110,
                            left: 215,
                            child: Container(
                              child: Text(
                                '084578',
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: 1.0,
                                  color: Color(0xffDB9161), //색깔은 0xff +
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 143,
                            left: 217,
                            child: Container(
                              child: Text(
                                '8',
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff9F4257), //색깔은 0xff +
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 143,
                            left: 280,
                            child: Container(
                              child: Text(
                                '03',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 3.0,
                                  color: Color(0xff665C5B), //색깔은 0xff +
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    RaisedButton(
                      textColor: Colors.black87,
                      color: Colors.amberAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular((10)),
                      ),
                      child: Wrap(alignment: WrapAlignment.center, children: [
                        Icon(
                          Icons.share,
                          size: 18.0,
                        ),
                        SizedBox(width: 5.0),
                        Text(
                          'Share to Friend ❤️‍',
                        ),
                      ]),
                      onPressed: () {
                        //Uint8List는 정수리스트라고 생각하면됨
                        _captureSocialPng();
                      },
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 30.0, right: 30.0),
                      child: TextField(
                        onChanged: (newText) {
                          setState(() {
                            comment = newText;
                          });
                        },
                        decoration: new InputDecoration(
                            suffixIcon: Icon(Icons.send),
                            contentPadding: EdgeInsets.only(
                                left: 20, right: 5, top: 20, bottom: 5),
                            hintText: 'กรุณาเขียนข้อความใดๆ'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _captureSocialPng() {
    List<String> imagePaths = [];
    final RenderBox box = context.findRenderObject() as RenderBox;
    return new Future.delayed(const Duration(milliseconds: 20), () async {
      RenderRepaintBoundary? boundary = previewContainer.currentContext!
          .findRenderObject() as RenderRepaintBoundary?;
      ui.Image image = await boundary!.toImage();
      final directory = (await getApplicationDocumentsDirectory()).path;
      ByteData? byteData =
          await image.toByteData(format: ui.ImageByteFormat.png);
      Uint8List pngBytes = byteData!.buffer.asUint8List();
      File imgFile = new File('$directory/screenshot.png');
      imagePaths.add(imgFile.path);
      await imgFile.writeAsBytes(pngBytes).then((value) async {
        await Share.shareFiles(imagePaths,
            subject: 'Share',
            text: 'Check this Out!',
            sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
      }).catchError((onError) {
        print(onError);
      });
    });
  }
}

/*
class Data extends ChangeNotifier{
  String fakeNumber = '';
  void changeString(String newString) {
    fakeNumber = newString;
    notifyListeners();
  }
  }
*/
