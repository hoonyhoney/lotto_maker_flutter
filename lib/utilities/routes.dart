import 'package:flutter/material.dart';
import 'package:lotto_maker_flutter/screen/random.dart';
import 'package:lotto_maker_flutter/screen/fake_lottery.dart';
import 'package:lotto_maker_flutter/screen/loading_screen.dart';
import 'package:lotto_maker_flutter/screen/name.dart';
import 'package:lotto_maker_flutter/screen/roulette.dart';

//루트설정하기
class Routes {
  Routes._();

  static const String loadingScreen = '/loadingScreen';
  static const String fakeLottery = '/fakeLottery';
  static const String rouletteScreen = '/rouletteScreen';
  static const String randomScreen = '/randomScreen';
  static const String nameScreen = '/name';


  static final routes = <String, WidgetBuilder>{
    loadingScreen: (BuildContext context) => LoadingScreen(),
    nameScreen: (BuildContext context) => Name(),
    fakeLottery: (BuildContext context) => FakeLottery(),
    rouletteScreen: (BuildContext context) => RouletteScreen(),
    randomScreen: (BuildContext context) => RandomScreen(),
  };
}