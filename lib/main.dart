import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lotto_maker_flutter/screen/homeView.dart';
import 'package:lotto_maker_flutter/services/win_numbers.dart';
import 'package:lotto_maker_flutter/utilities/constants.dart';
import 'package:lotto_maker_flutter/utilities/routes.dart';
import 'package:provider/provider.dart';

import 'screen/fake_lottery.dart';
import 'screen/splash_screen.dart';


//push test
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
     ChangeNotifierProvider<WinNumbers>(create: (_) => WinNumbers()),

      ],
      child: MaterialApp(
        title: 'LottoMaker',
        routes: Routes.routes,
        theme: ThemeData(
          primarySwatch: Colors.amber,
        ),
        home: FirstPage(),
      ),
    );
  }
}

class FirstPage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return SplashScreen();
  }
}