import 'dart:convert';

import 'package:flutter/material.dart';

class MessageVO {
  String docId;
  String messageText;
  String time;
  String timesAgo;
  dynamic anonymousId;
  List<dynamic> likey;
  int likeyCnt;

  MessageVO(
       {required this.docId,
        required this.messageText,
        required this.time,
        required this.timesAgo,
        required this.anonymousId,
        required this.likey,
        required this.likeyCnt
       });

}
