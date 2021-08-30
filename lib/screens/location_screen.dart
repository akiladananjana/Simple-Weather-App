import 'package:flutter/material.dart';
import 'package:weather_app_dev/services/weather.dart';
import '../utilities/constants.dart';

class LocationScreen extends StatefulWidget {
  var weatherData;

  LocationScreen({required this.weatherData});

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  int temp = 0;
  String messsage = "";
  String weatherIcon = "";
  String? cityName;

  @override
  void initState() {
    super.initState();

    WeatherModel weathermodel = new WeatherModel();
    temp = (widget.weatherData['main']['temp']).toInt();
    var condition = widget.weatherData['weather'][0]['id'];

    weatherIcon = weathermodel.getWeatherIcon(condition);
    messsage = weathermodel.getMessage(temp);
    cityName = widget.weatherData['name'];
  }

  void updateUI(WeatherModel weathermodel) {
    setState(() {
      temp = (widget.weatherData['main']['temp']).toInt();
      var condition = widget.weatherData['weather'][0]['id'];

      weatherIcon = weathermodel.getWeatherIcon(condition);
      messsage = weathermodel.getMessage(temp);
      cityName = widget.weatherData['name'];
      print("Pressed");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
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
                    onPressed: () {
                      WeatherModel newModel = WeatherModel();
                      updateUI(newModel);
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  FlatButton(
                    onPressed: () {},
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
                    Text(
                      '$temp°',
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
                  messsage,
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
