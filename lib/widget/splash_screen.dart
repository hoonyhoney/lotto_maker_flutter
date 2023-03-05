import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lotto_maker_flutter/screen/home_view.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Center(
        child:
            // Load a Lottie file from your assets
            Lottie.asset(
          'assets/lottery.json',
          controller: controller,
          animate: true,
          onLoaded: (composition) {
            controller
              ..duration = composition.duration
              ..forward().whenComplete(() => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => MyHomePage()),
                  ));
          },
        ),
      ),
    );
  }
}
