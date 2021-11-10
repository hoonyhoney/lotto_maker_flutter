import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lotto_maker_flutter/utilities/pinput.dart';
import 'package:pinput/pin_put/pin_put.dart';
import 'package:pinput/pin_put/pin_put_state.dart';

class NumberPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(

        children: [
          Row(
            children: [
            ],
          ),
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(right: 25.0),
            height: 54.0,
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                offset: Offset(0, 10),
                blurRadius: 50,
                  color: Colors.black.withOpacity(0.18),
                ),
              ],

            ),
            child: TextField(
              style: TextStyle(
                fontFamily: 'Varela',
                fontSize: 20.0,
              ),
              decoration: InputDecoration(
                hintText: "    Search",
                hintStyle: TextStyle(
                  fontFamily: 'Varela',
                  color:Colors.black87.withOpacity(0.5),
                ),
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                suffixIcon: Icon(
                  Icons.search,
                 color: Colors.black,
                  size: 36.0,

                ),
              ),
            ),
          ),

          SizedBox(height: 15.0,),
          Divider( thickness: 1, color: Colors.grey, ),
          Container(
            height: 50.0,
            width: 200.0,
            child: Text('November 07, 2021',
                style:TextStyle(
                  fontFamily: 'Varela',
                fontSize: 20.0,
            )
            ),
          ),
          SingleChildScrollView(
            child: Column(
            children: [
            Container(
              child: Column(
                children: [
                  Column(
                    children: [
                      Text('1등',
                      style: TextStyle(
                        fontFamily: 'Varela',
                        fontSize: 20.0,
                        ),
                      ),
                      Text('114475',
                      style: TextStyle(
                        fontFamily: 'Varela',
                        fontSize: 20.0,
                        ),
                      ),
                      SizedBox(height: 15.0,),

                    ],
                  ),
                  Column(
                    children: [
                      Text('2자리',
                      style: TextStyle(
                        fontFamily: 'Varela',
                        fontSize: 20.0,
                        ),
                      ),
                      Text('79',
                      style: TextStyle(
                        fontFamily: 'Varela',
                        fontSize: 20.0,
                        ),
                      ),
                      SizedBox(height: 15.0,),
                    ],
                  ),
                  Column(
                    children: [

                      Text('3자리(앞)',
                      style: TextStyle(
                        fontFamily: 'Varela',
                        fontSize: 20.0,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                      children:[
                        Text('287',
                      style: TextStyle(
                        fontFamily: 'Varela',
                        fontSize: 20.0,
                        ),
                      ),
                        SizedBox(width:10),
                      Text('302',
                      style: TextStyle(
                        fontFamily: 'Varela',
                        fontSize: 20.0,
                        ),
                      ),
                        ],
                      ),
                      SizedBox(height: 15.0,),

                      Text('3자리(뒤)',
                        style: TextStyle(
                          fontFamily: 'Varela',
                          fontSize: 20.0,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:[
                          Text('123',
                            style: TextStyle(
                              fontFamily: 'Varela',
                              fontSize: 20.0,
                            ),
                          ),
                          SizedBox(width:10),
                          Text('456',
                            style: TextStyle(
                              fontFamily: 'Varela',
                              fontSize: 20.0,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),

              height: 300,

            ),
            ],
          ),
          ),
          Divider( thickness: 1, color: Colors.grey, ),

          Row(
            children: [
              SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircleAvatar(
                  backgroundImage: NetworkImage("https://randomuser.me/api/portraits/men/28.jpg"),
                ),
              ),
              SizedBox(
                width: 20.0,
              ),
              Expanded(
                child: Text('1등 가즈아!!!!!!!!!!!!',
                  style: TextStyle(
                    fontFamily: 'Varela',
                    fontSize: 20.0,
                  ),
                ),
              ),


            ],
          ),
          Row(
            children: [
              SizedBox(width:75.0),
            Text('좋아요',
                  style: TextStyle(
                    fontFamily: 'Varela',
                    fontSize: 14.0,
                  ),
                ),
            SizedBox(width: 10.0,),
           Text('답글달기',
                  style: TextStyle(
                    fontFamily: 'Varela',
                    fontSize: 14.0,
                  ),
                ),
            ],
          ),
          Row(
            children: [
              SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircleAvatar(
                  backgroundImage: NetworkImage("https://randomuser.me/api/portraits/men/28.jpg"),
                ),
              ),
              SizedBox(
                width: 20.0,
              ),
              Expanded(
                child: Text('1등 가즈아!!!!!!!!!!!!',
                  style: TextStyle(
                    fontFamily: 'Varela',
                    fontSize: 20.0,
                  ),
                ),
              ),


            ],
          ),
          Row(
            children: [
              SizedBox(width:75.0),
              Text('좋아요',
                style: TextStyle(
                  fontFamily: 'Varela',
                  fontSize: 14.0,
                ),
              ),
              SizedBox(width: 10.0,),
              Text('답글달기',
                style: TextStyle(
                  fontFamily: 'Varela',
                  fontSize: 14.0,
                ),
              ),
            ],
          ),
          Row(
            children: [
              SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircleAvatar(
                  backgroundImage: NetworkImage("https://randomuser.me/api/portraits/men/28.jpg"),
                ),
              ),
              SizedBox(
                width: 20.0,
              ),
              Expanded(
                child: Text('1등 가즈아!!!!!!!!!!!!',
                  style: TextStyle(
                    fontFamily: 'Varela',
                    fontSize: 20.0,
                  ),
                ),
              ),


            ],
          ),
          Row(
            children: [
              SizedBox(width:75.0),
              Text('좋아요',
                style: TextStyle(
                  fontFamily: 'Varela',
                  fontSize: 14.0,
                ),
              ),
              SizedBox(width: 10.0,),
              Text('답글달기',
                style: TextStyle(
                  fontFamily: 'Varela',
                  fontSize: 14.0,
                ),
              ),
            ],
          ),
          SizedBox(height:20.0),
          Row(
            children: [
              SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircleAvatar(
                  backgroundImage: NetworkImage("https://randomuser.me/api/portraits/men/28.jpg"),
                ),
              ),
              SizedBox(
                width: 20.0,
              ),


            ],
          ),

        ],
      ),
    );
  }
}



