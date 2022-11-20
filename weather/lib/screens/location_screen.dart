import 'package:flutter/material.dart';
import 'package:weather/utilities/constants.dart';
import 'package:weather/services/weather.dart';

import 'city_screen.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen(this.locationWeather);

  final locationWeather;
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  double temp = -100.0;
  String weatherIcon = '🤷';
  String msg = '';
  String city = '';

  WeatherModel weather = WeatherModel();

  @override
  void initState() {
    // TODO: implement initState
    // print(widget.locationWeather);
    updateUI(widget.locationWeather);

    super.initState();
  }
  // var rowData = widget.locationWeather;

  void updateUI(var weatherData) {
    setState(() {
      if (weatherData == null) return;
      temp = weatherData['main']['temp'];
      int cond = weatherData['weather'][0]['id'];
      weatherIcon = weather.getWeatherIcon(cond);
      msg = weather.getMessage(temp.toInt());
      city = weatherData['name'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage('assets/images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  MaterialButton(
                    onPressed: () async {
                      var weatherxData = await weather.getLocationWeather();
                      // print(weatherxData);
                      updateUI(weatherxData);
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  MaterialButton(
                    onPressed: () async {
                      var typedName = await Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return CityScreen();
                      }));
                      if (typedName != null) {
                        var weatherxData =
                            await weather.getCityWeather(typedName);
                        // print(weatherxData);
                        updateUI(weatherxData);
                      }
                      ;
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
                    Text(
                      temp.toStringAsFixed(1),
                      style: kTempTextStyle,
                    ),
                    SizedBox(width: 20.0),
                    Text(
                      weatherIcon,
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Text(
                  (temp == -100.0)
                      ? "unable to find weather data !"
                      : "$msg \nin $city",
                  textAlign: TextAlign.left,
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
