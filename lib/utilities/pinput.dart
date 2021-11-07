import 'package:flutter/material.dart';
import 'package:pinput/pin_put/pin_put.dart';


class PinPutObj extends StatefulWidget {
  @override
  PinPutObjState createState() => PinPutObjState();
}

class PinPutObjState extends State<PinPutObj> {
  final TextEditingController _pinPutController = TextEditingController();
  final FocusNode _pinPutFocusNode = FocusNode();

  BoxDecoration get _pinPutDecoration {
    return BoxDecoration(
      border: Border.all(color: Colors.deepPurpleAccent),
      borderRadius: BorderRadius.circular(15.0),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.green,
        hintColor: Colors.green,
      ),
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Builder(
          builder: (context) {
            return SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    color: Colors.white,
                    margin: const EdgeInsets.all(20.0),
                    padding: const EdgeInsets.all(20.0),
                    child: PinPut(
                      fieldsCount: 6,
                      onSubmit: (String pin) => _showSnackBar(pin, context),
                      focusNode: _pinPutFocusNode,
                      controller: _pinPutController,
                      submittedFieldDecoration: _pinPutDecoration.copyWith(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      selectedFieldDecoration: _pinPutDecoration,
                      followingFieldDecoration: _pinPutDecoration.copyWith(
                        borderRadius: BorderRadius.circular(5.0),
                        border: Border.all(
                          color: Colors.deepPurpleAccent.withOpacity(.5),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30.0),
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      FlatButton(
                        onPressed: () => _pinPutFocusNode.requestFocus(),
                        child: const Text('Focus'),
                      ),
                      FlatButton(
                        onPressed: () => _pinPutFocusNode.unfocus(),
                        child: const Text('Unfocus'),
                      ),
                      FlatButton(
                        onPressed: () => _pinPutController.text = '',
                        child: const Text('Clear All'),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  void _showSnackBar(String pin, BuildContext context) {
    final snackBar = SnackBar(
      duration: const Duration(seconds: 3),
      content: Container(
        height: 80.0,
        child: Text(
          'Pin Submitted. Value: $pin',
          style: const TextStyle(fontSize: 25.0),
        ),
      ),
      backgroundColor: Colors.deepPurpleAccent,
    );
    Scaffold.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}