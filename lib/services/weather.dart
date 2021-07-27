import 'dart:io';

import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const apiKey = 'beaf39d73917591a5baba23a61c85e69';
const weatherMapUrl = 'http://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getCityWeatherData(String cityName) async {
    NetworkHelper networkHelper =
        NetworkHelper('$weatherMapUrl?q=$cityName&appid=$apiKey&units=metric');
    var weatherCityData = await networkHelper.getData();
    return weatherCityData;
  }

  Future<dynamic> getWeatherData() async {
    Location location = Location();
    await location.getCurrentLocation();

    NetworkHelper networkHelper = NetworkHelper(
        '$weatherMapUrl?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');
    var weatherData = await networkHelper.getData();
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
}
