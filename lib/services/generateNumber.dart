import 'dart:math';
import 'package:flutter/material.dart';


class GenerateNumber {


// 로또번호 생성 함수, seed:씨드값, times 횟수
  List<int> getRandomLottoNumber(int seed, int times) {
    List<int> luckylist = [];
    for (int i = 0; i < times; i++) {
      int number = Random(seed).nextInt(10);
      luckylist.add(number);
      //씨드에 행운의 럭키 7을 곱해줌
      seed = seed * 7;
    }
    return luckylist;
  }
}





//    fun getRandomLottoNumberHashDate(): Int {
//        val targetString = SimpleDateFormat("yyyy-MM-dd", Locale.KOREA).format(Date())
//        return kotlin.random.Random(targetString.hashCode().toLong()).nextInt(10)
//    }

//        fun getLottoNumbersFromHash(str: String): MutableList<Int> {
////            암호숫자로으로 걸기
//            val list = mutableListOf<Int>()
////            리스트는 뭉탱이
//            for (number in 0..9) {
//                list.add(number)
////            }
////            val targetString = SimpleDateFormat("yyyy-MM-dd", Locale.KOREA).format(Date()) + str
////
////            list.shuffle(Random(targetString.hashCode().toLong()))
//////            어차피 해쉬도 정수 1234L형이니까, 이 씨드값으로 랜덤가능한지 확인
//
//
//            return list.subList(0, 6)
//        }

//        val targetString = SimpleDateFormat("yyyy-MM-dd", Locale.KOREA).format(Date()) + str
//        fun getRandomLottoNumber1(): Int {
//            return kotlin.random.Random(targetString.hashCode().toLong()).nextInt(10)
//        }
//    이코드다 씨드값넣고 랜덤 돌리는 코드 이걸 6번 반복하면됨 중복으로 6번반복, 2번반복, 3번반복 ,3번반복


