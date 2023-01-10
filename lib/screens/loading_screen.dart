import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_app/screens/location_screen.dart';
import 'package:weather_app/services/weather.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  LoadingScreenState createState() => LoadingScreenState();
}

class LoadingScreenState extends State<LoadingScreen> {
  void getLocationWeather() async {
    var weatherdata = await WeatherModel().getLocationWeather();

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => LocationScreen(weatherData: weatherdata)));
  }

  @override
  void initState() {
    getLocationWeather();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SpinKitRotatingCircle(
        color: Colors.blue,
        size: 50.0,
      ),
    );
  }
}
