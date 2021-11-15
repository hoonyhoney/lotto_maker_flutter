import 'package:flutter/material.dart';
import 'package:lotto_maker_flutter/services/generateNumber.dart';

import 'bottom_bar.dart';

class LocationScreen extends StatefulWidget {

  LocationScreen({this.locationWeather});
  final locationWeather;

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {

  GenerateNumber number = GenerateNumber();

  int temperature;
  String weatherIcon;
  String cityName;
  String message;

  @override
  void initState() {
    super.initState();

    updateUI(widget.locationWeather);
  }

  void updateUI(weatherData){
    setState(() {

      if(weatherData ==null) {
        temperature =0;
        weatherIcon ='Error';
        message = 'Unable to get weather data';
        cityName ='';
        return;
      }

      double temp  = weatherData['main']['temp'];
      temperature = temp.toInt();
      var condition = weatherData['weather'][0]['id'];
      cityName = weatherData['name'];
      weatherIcon =  weather.getWeatherIcon(condition);
      message = weather.getMessage(temperature);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/cloud.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                    onPressed: () async {

                      var weatherData = await weather.getLocationWeather();
                      updateUI(weatherData);
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  FlatButton(
                    onPressed: () async {
                      var typedName = await Navigator.push(
                        context, MaterialPageRoute(
                        builder: (context){
                          return CityScreen();
                        },
                      ),
                      );
                      if(typedName != null) {
                        var weatherData = await weather.getCityWeather(typedName);
                        updateUI(weatherData);
                      }
                    },
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    TypewriterAnimatedTextKit(
                      speed: const Duration(milliseconds: 200),
                      text: ['오늘의 날씨'],
                      textStyle: TextStyle(
                        fontSize: 70.0, color: Colors.white,
                        fontWeight: FontWeight.bold,

                      ),
                    ),


                  ],

                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '$temperature°',
                      style: kTempTextStyle,
                    ),
                    Text(
                      weatherIcon,
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  ' $cityName',
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}












/*
class LocationScreen extends StatefulWidget {

  LocationScreen({this.locationWeather});
  final locationWeather;

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState {

}

class CookieDetail extends StatelessWidget {
  final assetPath, cookieprice, cookiename,luckylist;

  CookieDetail({this.assetPath, this.cookieprice, this.cookiename,this.luckylist});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
            leading:IconButton(
              icon: Icon(Icons.arrow_back, color: Color(0xFF545D68)),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
        title: Text('Pickup',
          style:TextStyle(
              fontFamily: 'Varela', fontSize:20.0, color:Color(0xFF545D68)
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_none, color:Color(0xFF545D68),
            ),
            onPressed: () {  },
          ),
        ],
      ),

      body: ListView(

        children: [
          SizedBox(height: 15.0,),
          Padding(
            padding: EdgeInsets.only(left: 20.0),
            child: Text(
              'Cookie',
              style:TextStyle(
                  fontFamily: 'Varela', fontSize:20.0, color:Color(0xFF545D68)
              ),
            ),
            ),
          //7분 20초부터

        ],


      ),
      bottomNavigationBar: BottomBar(),
    );
  }
}
*/
