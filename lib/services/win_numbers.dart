import 'dart:core';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:html/parser.dart';
import 'package:lotto_maker_flutter/subViews/dialogs.dart';
import 'package:lotto_maker_flutter/subViews/reply.dart';
import 'package:http/http.dart' as http;
import 'package:share/share.dart';


class WinNumbers with ChangeNotifier {
  String prize_1="";
  String title="";
  dynamic get _prize_1 => prize_1;


  dynamic getData() async {
    final response = await http.Client().get(
        Uri.parse('https://www.matichon.co.th/lottery'));
    if (response.statusCode == 200) {
      var document = parse(response.body);
      var  prize1 = document.getElementsByClassName("udlotto-section-1-0")[0].children[1].children[0].text;

      prize_1 = prize1;
      print("결과" + prize_1);
    }
    return prize_1;
    notifyListeners();
  }
  dynamic getTitle() async {
    final response = await http.Client().get(
        Uri.parse('https://www.matichon.co.th/lottery'));
    if (response.statusCode == 200) {
      var document = parse(response.body);
      //var elements = document.getElementsByClassName(); //클래스 이름
      //var elementsByTagName = document.getElementsByTagName(); //TagName
      var  _title = document.getElementsByClassName("udlotto-date")[0].children[1].text;

      title = _title;
    }
    return title;
  }


  //결과확인
  dynamic getResult(var value, var prize_1, var prize_f3,var prize_l2,var prize_l3,var prize_n1,var prize_n2,dynamic prize_2, dynamic prize_3, dynamic prize_4, dynamic prize_5) {
    print("getResult실행됨");
    var f3 = prize_f3;
    var l3 = prize_l3;
    var l2 = prize_l2;

    value = value.toString();

    if (value.length == 6) {
      f3 = value.substring(0, 3);
      l3 = value.substring(3, 6);
      l2 = value.substring(4, 6);
    } else {
      return 'โปรดป้อนหมายเลขที่ถูกต้อง';
    }

    if (value == prize_1) {
      return 'ยินดีด้วย!!! รางวัลที่ 1';
    } else if (prize_n1.contains(value)) {
      return 'ยินดีด้วย!!! ข้างเคียงรางวัลที่ 1';
    } else if (prize_n2.contains(value)) {
      return 'ยินดีด้วย!!! ข้างเคียงรางวัลที่ 1';
    } else if (prize_2.contains(value)) {
      return 'ยินดีด้วย!!! รางวัลที่ 2';
    } else if (prize_3.contains(value)) {
      return 'ยินดีด้วย!!! รางวัลที่ 3';
    } else if (prize_4.contains(value)) {
      return 'ยินดีด้วย!!! รางวัลที่ 4';
    } else if (prize_5.contains(value)) {
      return 'ยินดีด้วย!!! รางวัลที่ 5';
    } else if (prize_f3.contains(f3)) {
      return 'ยินดีด้วย!!! เลขหน้าหน้า 3ตัว';
    } else if (prize_l3.contains(l3)) {
      return 'ยินดีด้วย!!! เลขท้าย 3ตัว';
    } else if (prize_l2.contains(l2)) {
      return 'ยินดีด้วย!!! เลขท้าย 2 ตัว';
    } else {
      return "ไม่ถูกรางวัล T,.T";
    }
  }
}