import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/HourlyByLatLng.dart';
import 'package:weather_app/weather_helper.dart';

class DayItem extends StatelessWidget {
  DayItem({@required this.response, @required this.i});
  final HourlyByLatLng response;
  int i;
  @override
  Widget build(BuildContext context) {
    // var date = DateTime.fromMillisecondsSinceEpoch(hourlyList[i]['dt'] * 1000)
    //       .toString()
    //       .substring(11, 16);
    return Container(
      height: 100,
      width: 100,
      // decoration: BoxDecoration(border: Border.all(color: Colors.blueAccent)),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 0,
        color: Colors.transparent.withOpacity(0.2),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            DateTime.fromMillisecondsSinceEpoch(response.hourly[i].dt * 1000)
                .toString()
                .substring(11, 16),
            style: TextStyle(color: Theme.of(context).accentColor),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
