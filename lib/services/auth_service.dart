import 'dart:math';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;


  /* Sign In anon */
   Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously(); //userCredential에는 많은 정보가 들어있음.
      User? user = await result.user; // 이중 user정보만 필요해서 user객체로 받는다.
      print("유저"+user.toString());
      String userId = user!.uid;
      print("유저아이디"+userId);
      return userId;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }


}
