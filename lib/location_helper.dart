import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:location/location.dart';
import 'weather_helper.dart';

const GOOGLE_API_KEY = 'AIzaSyAQmqyQ48oguhkEfvkh_lVVVVdUKRW4e6Y';

class LocationHelper extends ChangeNotifier {
  double latitude;
  double longitude;
  String _cityName;

  LocationHelper() {
    getplace().then((value) {
      _cityName = value;
      notifyListeners();
    });
  }

  Future<String> getplace() async {
    final myLoc = await Location().getLocation();
    latitude = myLoc.latitude;
    longitude = myLoc.longitude;

    final url = Uri.parse(
        'https://maps.googleapis.com/maps/api/geocode/json?latlng=$latitude,$longitude&key=$GOOGLE_API_KEY');
    final _response = await http.get(url);
    _cityName = json.decode(_response.body)['results'][0]['address_components']
        [3]['long_name'];
    // var myList = WeatherHelper.getWeather(latitude, longitude);
    // myList.then((value) {
    //   //finalList = [myList, _cityName];
    //   value.insert(0, _cityName);
    // });

    return _cityName;
  }

  String get location {
    return _cityName;
  }

  double get lat {
    return latitude;
  }

  double get lon {
    return longitude;
  }
}
