import 'package:http/http.dart' as http;
import 'dart:convert';

class WeatherHelper {
  static Future<List> getWeather(double latitude, double longitude) async {
    final url = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&units=metric&appid=bf44fb7452f5021bcf6d6b2d3f59700c');
    final response = await http.get(url);
    final body = json.decode(response.body)['main']['temp'].round();
    final humidity = json.decode(response.body)['main']['humidity'].toString();
    final windSpeed =
        (json.decode(response.body)['wind']['speed'] * 3.6).toStringAsFixed(1);
    final visibility =
        (json.decode(response.body)['visibility'] / 1000).toString();

    final time = json
            .decode(response.body)['weather'][0]['icon']
            .toString()
            .contains('d')
        ? 'day'
        : 'night';
    final myList = [body, windSpeed, humidity, visibility, time];
    //print(json.decode(response.body)['weather'][0]['icon']);
    return myList;
  }
}
