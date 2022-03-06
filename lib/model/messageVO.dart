import 'package:flutter/material.dart';

class MessageVO {
    String docId;
    String messageText;
    String time;
    String timesAgo;
    int likey;

    MessageVO({required this.docId, required this.messageText, required this.time,required this.timesAgo,required this.likey});

}