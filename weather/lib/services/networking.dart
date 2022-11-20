import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:weather/services/location.dart';

const apiKey = '3f272fb5e3276bae5d4b9f5d38096d69';

class NetworkHelper {
  NetworkHelper();
  static Future getData() async {
    //https://api.openweathermap.org/data/2.5/weather?lat={lat}&lon={lon}&appid={API key}
    //https:///?={lat}&={lon}&={API key}
    Uri url = Uri.https('api.openweathermap.org', '/data/2.5/weather', {
      'lat': Location.getLat().toString(),
      'lon': Location.getLng().toString(),
      'appid': apiKey,
      'units': 'metric',
    });
    http.Response rspns = await http.get(url);
    if (rspns.statusCode == 200) {
      var rowData = convert.jsonDecode(rspns.body);
      return rowData;
    } else {
      print(rspns.statusCode);
    }
  }

  static Future getCityData(String city) async {
// https://api.openweathermap.org/data/2.5/weather?q={city name}&appid={API key}
    Uri url = Uri.https('api.openweathermap.org', '/data/2.5/weather', {
      'q': city,
      'appid': apiKey,
      'units': 'metric',
    });
    http.Response rspns = await http.get(url);
    if (rspns.statusCode == 200) {
      var rowData = convert.jsonDecode(rspns.body);
      return rowData;
    } else {
      print(rspns.statusCode);
    }
  }
}
