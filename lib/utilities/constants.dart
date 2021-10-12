import 'package:flutter/material.dart';

const kTextFieldInputDecoration = InputDecoration(


      filled: true,
      fillColor: Colors.grey,
      prefix: Icon(Icons.search, color: Colors.white,),
      hintText: 'Please enter number',
      hintStyle: TextStyle(color: Colors.grey,),
      border: OutlineInputBorder(
      borderRadius: BorderRadius.all(
          Radius.circular((10.0),
              ),
            ),
        ),
    );