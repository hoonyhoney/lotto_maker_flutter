import 'package:flutter/material.dart';
import 'package:lotto_maker_flutter/services/generateNumber.dart';

class Name extends StatefulWidget {
  const Name({Key? key}) : super(key: key);

  @override
  _NameState createState() => _NameState();
}

class _NameState extends State<Name> {


  @override
  void initState() {
    super.initState();
    getNumber();
  }
  void getNumber() async{
    int seed=3;
    int times=2;

  }
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}


