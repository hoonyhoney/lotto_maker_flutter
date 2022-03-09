import 'dart:convert';

import 'package:flutter/material.dart';

class MessageVO {
  String docId;
  String messageText;
  String time;
  String timesAgo;
  int likey;

  MessageVO(
      {required this.docId, required this.messageText, required this.time, required this.timesAgo, required this.likey});

  MessageVO.fromJson(Map<String, dynamic> json)
      : docId = json['docId'],
        messageText = json['messageText'],
        time = json['time'],
        timesAgo = json['timesAgo'],
        likey = json['likey'];

  Map<String, dynamic> toJson() => {
    'docId': docId,
    'messageText': messageText,
    'time': time,
    'timesAgo': timesAgo,
    'likey': likey,
  };

}
