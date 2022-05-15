import 'dart:convert';

import 'package:flutter/material.dart';

class FakeLottoVO {
  String prize1="";
  String title="";

  get _prize {
    return prize1;
  }
  get _title {
    return title;
  }

  FakeLottoVO(
      {required this.prize1, required this.title});

}
