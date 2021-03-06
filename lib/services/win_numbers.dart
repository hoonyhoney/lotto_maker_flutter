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
      //var elements = document.getElementsByClassName(); //클래스 이름
      //var elementsByTagName = document.getElementsByTagName(); //TagName
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
}