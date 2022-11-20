import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather/screens/location_screen.dart';
import '../services/location.dart';
import '../services/weather.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    getDataLocation();
    super.initState();
  }

  Future<void> getDataLocation() async {
    WeatherModel weathermodel = WeatherModel();
    var weatherxData = await weathermodel.getLocationWeather();
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(weatherxData);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitSpinningLines(
          color: Colors.white,
          size: 150.0,
        ),
      ),
    );
  }
}


/**
 * 
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                print("lat: ${Location.getLat()}");
                print("lntg: ${Location.getLng()}");
              },
              child: const Text('Get Position'),
            ),
            SizedBox(
              height: 20.0,
            ),
            ElevatedButton(
              onPressed: () {
                getDataLocation();
              },
              child: const Text('Get Data'),
            ),
          ],
        ),
 */