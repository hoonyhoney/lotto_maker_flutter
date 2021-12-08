import 'package:flutter/material.dart';

class FakeLottery extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Stack(
            children: [
              Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage('image/fake_lottery.jpg'),
                      fit: BoxFit.contain
                  )
              ),
              ),
              Container(
                child: Text('123456'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

