import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:location/location.dart';
import 'utils/Secrets.dart';

class LocationHelper with ChangeNotifier {
  num latitude;
  num longitude;
  String _cityName;
  List myList;
  Location location = new Location();

  bool _serviceEnabled;
  PermissionStatus _permissionGranted;
  LocationData _locationData;

  // LocationHelper() {
  //   initLocation().then((_) {
  //     getplace().then((value) {
  //       myList = value;
  //       notifyListeners();
  //     });
  //   });
  // }

  initLocation() async {
    try {
      _serviceEnabled = await location.serviceEnabled();
      if (!_serviceEnabled) {
        _serviceEnabled = await location.requestService();
        if (!_serviceEnabled) {
          return;
        }
      }

      _permissionGranted = await location.hasPermission();
      if (_permissionGranted == PermissionStatus.denied) {
        _permissionGranted = await location.requestPermission();
        if (_permissionGranted != PermissionStatus.granted) {
          return;
        }
      }
    } catch (error) {
      _serviceEnabled = false;
    }
    //initLocation();
  }

  Future getplace() async {
    // _locationData = await location.getLocation();
    await initLocation();
    final myLoc = await location.getLocation();
    latitude = myLoc.latitude;
    longitude = myLoc.longitude;

    final url = Uri.parse(
        'https://maps.googleapis.com/maps/api/geocode/json?latlng=$latitude,$longitude&key=${Secrets.GOOGLE_API_KEY}');
    final _response = await http.get(url);
    final _cityName = json.decode(_response.body)['results'][0]
            ['address_components'][3]['long_name'] ??
        "";
    // var myList = WeatherHelper.getWeather(latitude, longitude);
    // myList.then((value) {
    //   //finalList = [myList, _cityName];
    //   value.insert(0, _cityName);
    // });
    myList = [_cityName, latitude, longitude];

    return myList;
  }

  // String get location {
  //   return _cityName;
  // }

  // num get lat {
  //   return latitude;
  // }

  // num get lon {
  //   return longitude;
  // }
}
