import 'package:weather/services/location.dart';
import 'package:weather/services/networking.dart' as net;

class WeatherModel {
  Future<dynamic> getLocationWeather() async {
    await Location.getCrdntls();
    await Location.getLocation();
    var weatherData = await net.NetworkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getCityWeather(String city) async {
    var weatherData = await net.NetworkHelper.getCityData(city);
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }

  NetworkHelper(int i, int j) {}
}
