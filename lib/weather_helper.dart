import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:http/retry.dart';
import 'package:weather_app/models/CurrentByLatLng.dart';
import 'package:weather_app/models/HourlyByLatLng.dart';

import 'Day.dart';
import 'utils/Secrets.dart';

//const API_KEY = 'bf44fb7452f5021bcf6d6b2d3f59700c';

class WeatherHelper {
  static var lat;
  static var lon;
  var responseObject2;
  static Future<CurrentByLatLng> getWeather(
      double latitude, double longitude) async {
    final url = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&units=metric&appid=${Secrets.API_KEY}');
    final response = await http.get(url);
    final responseObject = currentByLatLngFromJson(response.body);
    //print("${responseObject.main.humidity}");
    // final body = json.decode(response.body)['main']['temp'].round();
    // final humidity = json.decode(response.body)['main']['humidity'].toString();
    // final windSpeed =
    //     (json.decode(response.body)['wind']['speed'] * 3.6).toStringAsFixed(1);
    // final visibility =
    //     (json.decode(response.body)['visibility'] / 1000).toString();

    // final time = json
    //         .decode(response.body)['weather'][0]['icon']
    //         .toString()
    //         .contains('d')
    //     ? 'day'
    //     : 'night';
    // final myList = [body, windSpeed, humidity, visibility, time];

    lat = latitude;
    lon = longitude;
    //print(responseObject.main.humidity);

    return responseObject;
  }

  // CurrentByLatLng get{

  // }

  static Future<HourlyByLatLng> getHourlyWeather(double lat, double lon) async {
    final url = Uri.parse(
        'https://api.openweathermap.org/data/2.5/onecall?lat=$lat&lon=$lon&cnt=3&units=metric&appid=${Secrets.API_KEY}');
    final response = await http.get(url);
    final responseObject2 = hourlyByLatLngFromJson(response.body);
    // final hourlyList = json.decode(response.body)['hourly'];
    // List<DayCard> finList = [];
    // for (var i = 0; i < 47; i++) {
    //   //print(hourlyList[i]['dt']);
    //   // finList[i] = hourlyList[i][0];
    //   // print(finList[0]);
    //   var date = DateTime.fromMillisecondsSinceEpoch(hourlyList[i]['dt'] * 1000)
    //       .toString()
    //       .substring(11, 16);
    //   var temp = hourlyList[i]['temp'].round();
    //   final newDay = DayCard(date, temp);
    //   finList.add(newDay);
    // print(date);
    // print(temp);
    // dailyInfo[i] = temp;
    // print(finList[i].hour);
    //}

    //print(hourlyList[50]);
    //print(json.decode(response.body)['hourly'][1]);
    // notifyListeners();
    //print(responseObject2);
    return responseObject2;
  }

  HourlyByLatLng get hello {
    return responseObject2;
  }
}
