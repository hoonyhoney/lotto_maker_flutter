import 'package:flutter/material.dart';
import 'package:lotto_maker_flutter/screen/fake_lottery.dart';
import 'package:lotto_maker_flutter/screen/loading_screen.dart';

//루트설정하기
class Routes {
  Routes._();

  static const String loadingScreen = '/loadingScreen';
  static const String fakeLottery = '/fakeLottery';

  static final routes = <String, WidgetBuilder>{
    loadingScreen: (BuildContext context) => LoadingScreen(),
    fakeLottery: (BuildContext context) => FakeLottery(),
  };
}