import 'package:flutter/material.dart';
import 'package:lotto_maker_flutter/screen/birthday.dart';
import 'package:lotto_maker_flutter/screen/fake_lottery.dart';
import 'package:lotto_maker_flutter/screen/loading_screen.dart';
import 'package:lotto_maker_flutter/screen/random.dart';

//루트설정하기
class Routes {
  Routes._();

  static const String loadingScreen = '/loadingScreen';
  static const String fakeLottery = '/fakeLottery';
  static const String randomScreen = '/randomScreen';
  static const String birthdayScreen = '/birthdayScreen';


  static final routes = <String, WidgetBuilder>{
    loadingScreen: (BuildContext context) => LoadingScreen(),
    fakeLottery: (BuildContext context) => FakeLottery(),
    randomScreen: (BuildContext context) => RandomScreen(),
    birthdayScreen: (BuildContext context) => BirthdayScreen(),
  };
}