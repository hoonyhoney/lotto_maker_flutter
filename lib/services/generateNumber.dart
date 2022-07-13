import 'dart:math';
import 'package:flutter/material.dart';


class GenerateNumber {


// 로또번호 생성 함수, seed:씨드값, times 횟수
  List<dynamic> getRandomLottoNumber(int times) {
    List<dynamic> luckylist = [];
    for (int i = 0; i < times; i++) {
      int number = Random().nextInt(10);
      luckylist.add(number);
      //씨드에 행운의 럭키 7을 곱해줌
    }
    return luckylist;
  }
}
