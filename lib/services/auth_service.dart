import 'dart:math';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;


  /* Sign In anon */
  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously(); //무작위 id생성
      User? user = result.user; // reusult의 user값을 user class에 set
      return user?.uid;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

}
