import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart';



class GetResultController extends GetxController{

   var prize_1;
   var prize_l2;
   var prize_f3;
   var prize_l3;
   var title;
   var prize_n1;
   var prize_n2;
   List<dynamic> prize_2 = [];
   List<dynamic> prize_3 = [];
   List<dynamic> prize_4 = [];
   List<dynamic> prize_5 = [];


  Future<dynamic> getData() async {
    final response = await http.Client()
        .get(Uri.parse('https://www.matichon.co.th/lottery'));
    if (response.statusCode == 200) {
      var document = parse(response.body);

        prize_1 = document
            .getElementsByClassName("udlotto-section-1-0")[0]
            .children[1]
            .children[0]
            .text;
        prize_f3 = document
            .getElementsByClassName("udlotto-section-1-1")[0]
            .children[1]
            .children[0]
            .text;
        prize_l2 = document
            .getElementsByClassName("udlotto-section-1-3")[0]
            .children[1]
            .children[0]
            .text;
        prize_l3 = document
            .getElementsByClassName("udlotto-section-1-2")[0]
            .children[1]
            .children[0]
            .text;
        title =
            document.getElementsByClassName("udlotto-date")[0].children[1].text;
        prize_n1 = document
            .getElementsByClassName("udlotto-section-2-1")[0]
            .children[0]
            .text
            .replaceAll(" ", "")
            .trim();
        //prize_n1.replaceAll("[^0-9","");
        prize_n2 = document
            .getElementsByClassName("udlotto-section-2-2")[0]
            .children[0]
            .text
            .replaceAll(" ", "")
            .trim();
        //prize_n2.replaceAll("[^0-9","");

        //step 1. 클래스에서 text를 가져온다.

        for (int i = 0; i < 5; i++) {
          var prizeNo = document
              .getElementsByClassName("udlotto-section-3-2")[i]
              .children[0]
              .text
              .replaceAll(" ", "")
              .trim();
          prize_2.add(prizeNo);
        }
        for (int i = 0; i < 10; i++) {
          var prizeNo3 = document
              .getElementsByClassName("udlotto-section-4-2")[i]
              .children[0]
              .text
              .replaceAll(" ", "")
              .trim();
          prize_3.add(prizeNo3);
        }
        for (int i = 0; i < 50; i++) {
          var prizeNo4 = document
              .getElementsByClassName("udlotto-section-5-2")[i]
              .children[0]
              .text
              .replaceAll(" ", "")
              .trim();
          prize_4.add(prizeNo4);
        }
        for (int i = 0; i < 100; i++) {
          var prizeNo5 = document
              .getElementsByClassName("udlotto-section-6-2")[i]
              .children[0]
              .text
              .replaceAll(" ", "")
              .trim();
          prize_5.add(prizeNo5);

        }
      update();
    } else {
      getData();
      update();
    }
  }
}