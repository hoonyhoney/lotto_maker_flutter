import 'dart:core';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:html/parser.dart';
import 'package:http/http.dart' as http;


class WinNumbers with ChangeNotifier {
  String prize_1="";
  String title="";

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