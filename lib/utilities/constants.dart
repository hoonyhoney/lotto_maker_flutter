import 'package:flutter/material.dart';

const kTextFieldInputDecoration = InputDecoration(

      filled: true,
      fillColor: Colors.white,

      prefix: Icon(
        Icons.search, color: Colors.grey,
        size: 30.0,
        ),
      labelText: 'Please enter number',
      hintStyle: TextStyle(color: Colors.grey,),
      border: OutlineInputBorder(
      borderRadius: BorderRadius.all(
          Radius.circular((10.0),
              ),
            ),
        ),
    );