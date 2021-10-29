import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/models/CurrentByLatLng.dart';
import 'package:weather_app/models/HourlyByLatLng.dart';
import '../utils/Secrets.dart';

class WeatherHelper with ChangeNotifier {
  num lat;
  num lon;
  var responseObject;
  var responseObject2;

  WeatherHelper() {
    getWeather(40, 20);
    notifyListeners();
  }

  Future<CurrentByLatLng> getWeather(num latitude, num longitude) async {
    final url = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&units=metric&appid=${Secrets.API_KEY}');
    final response = await http.get(url);
    responseObject = currentByLatLngFromJson(response.body);

    lat = latitude;
    lon = longitude;

    return responseObject;
  }

  CurrentByLatLng get weather {
    return responseObject;
  }

  Future<HourlyByLatLng> getHourlyWeather(num lat, num lon) async {
    final url = Uri.parse(
        'https://api.openweathermap.org/data/2.5/onecall?lat=$lat&lon=$lon&cnt=3&units=metric&appid=${Secrets.API_KEY}');
    final response = await http.get(url);
    responseObject2 = hourlyByLatLngFromJson(response.body);

    return responseObject2;
  }

  HourlyByLatLng get hourlyWeather {
    return responseObject2;
  }
}
