import 'package:clima/screens/location_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:clima/services/weather.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'dart:async';

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

  Future<void> getLocationData() async {
    WeatherModel weatherModel = WeatherModel();
    var weatherData = await weatherModel.getLocationWeather();
    await wait2Seconds();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return LocationScreen(
            locationWeather: weatherData,
          );
        },
      ),
    );
  }

  Future<void> wait2Seconds() async {
    Duration twoSeconds = Duration(seconds: 2);

    await Future.delayed(twoSeconds);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                waitWidget(Colors.red[800]),
                waitWidget(Colors.red[600]),
                waitWidget(Colors.red[400]),
                waitWidget(Colors.red[200]),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                waitWidget(Colors.deepOrange),
                waitWidget(Colors.deepOrangeAccent),
                waitWidget(Colors.orange),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                waitWidget(Colors.yellow[800]),
                waitWidget(Colors.yellow[600]),
//              waitWidget(Colors.yellow[400]),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                waitWidget(Colors.lime),

//              waitWidget(Colors.yellow[400]),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                waitWidget(Colors.yellow[800]),
                waitWidget(Colors.yellow[600]),
//              waitWidget(Colors.yellow[400]),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                waitWidget(Colors.deepOrange),
                waitWidget(Colors.deepOrangeAccent),
                waitWidget(Colors.orange),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                waitWidget(Colors.red[800]),
                waitWidget(Colors.red[600]),
                waitWidget(Colors.red[400]),
                waitWidget(Colors.red[200]),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget waitWidget(Color color) {
    return SpinKitPouringHourglass(
      color: color,
      size: 100,
    );
  }
}
