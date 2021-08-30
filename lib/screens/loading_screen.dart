import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_app_dev/services/location.dart';
import 'package:weather_app_dev/services/networking.dart';
import 'package:weather_app_dev/services/weather.dart';

import 'location_screen.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    WeatherModel weatherObj = WeatherModel();

    var decodedData = await weatherObj.getWeatherData();

    print(decodedData);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => LocationScreen(
          weatherData: decodedData,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitWave(
          color: Colors.white,
          size: 50.0,
        ),
      ),
    );
  }
}
