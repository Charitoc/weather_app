import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:location/location.dart';
import 'weather_helper.dart';

const GOOGLE_API_KEY = 'AIzaSyAQmqyQ48oguhkEfvkh_lVVVVdUKRW4e6Y';

class LocationHelper extends ChangeNotifier {
  num latitude;
  num longitude;
  String _cityName;
  List myList;

  LocationHelper() {
    getplace().then((value) {
      myList = value;
      notifyListeners();
    });
  }

  Future<List> getplace() async {
    final myLoc = await Location().getLocation();
    latitude = myLoc.latitude;
    longitude = myLoc.longitude;

    final url = Uri.parse(
        'https://maps.googleapis.com/maps/api/geocode/json?latlng=$latitude,$longitude&key=$GOOGLE_API_KEY');
    final _response = await http.get(url);
    final responseObj = _cityName = json.decode(_response.body)['results'][0]
        ['address_components'][3]['long_name'];
    // var myList = WeatherHelper.getWeather(latitude, longitude);
    // myList.then((value) {
    //   //finalList = [myList, _cityName];
    //   value.insert(0, _cityName);
    // });
    myList = [location, latitude, longitude];

    return myList;
  }

  String get location {
    return _cityName;
  }

  num get lat {
    return latitude;
  }

  num get lon {
    return longitude;
  }
}
