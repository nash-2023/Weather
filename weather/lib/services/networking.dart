import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:weather/services/location.dart';
import '../utilities/weatherCode.dart';

const apiKey = '3f272fb5e3276bae5d4b9f5d38096d69';

class NetworkHelper {
  NetworkHelper(this.lat, this.long);
  final double lat, long;
  Future getData() async {
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
}








// *****************************************************************************

// void getData() async {
// https://api.open-meteo.com/v1/forecast?latitude=29.9804626&longitude=31.159573&daily=temperature_2m_max&daily=temperature_2m_min&timezone=auto&current_weather=true
//   Uri url = Uri.https('api.open-meteo.com', '/v1/forecast', {
//     'latitude': Location.getLat().toString(),
//     'longitude': Location.getLng().toString(),
//     'daily': {'temperature_2m_max', 'temperature_2m_min'},
//     // 'daily': 'temperature_2m_min',
//     'timezone': 'auto',
//     'current_weather': 'true',
//   });
//   http.Response rspns = await http.get(url);
//   if (rspns.statusCode == 200) {
//     var rowData = convert.jsonDecode(rspns.body);
//     int wtherCode = rowData['current_weather']['weathercode'];
//     double CrntTemp = rowData['current_weather']['temperature'];
//     double maxTemp = rowData['daily']['temperature_2m_max'][0];
//     double minTemp = rowData['daily']['temperature_2m_min'][0];
//     print(weatherDescription[wtherCode]);
//     print(CrntTemp);
//     print(maxTemp);
//     print(minTemp);
//   } else {
//     print(rspns.statusCode);
//   }
// }

// ***************************************************************************