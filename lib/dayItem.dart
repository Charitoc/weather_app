import 'package:flutter/material.dart';
import 'package:weather_app/icons.dart';
import 'package:weather_app/models/HourlyByLatLng.dart';

class DayItem extends StatelessWidget {
  DayItem({@required this.response, @required this.i});
  final HourlyByLatLng response;
  final i;

  @override
  Widget build(BuildContext context) {
    // var date = DateTime.fromMillisecondsSinceEpoch(hourlyList[i]['dt'] * 1000)
    //       .toString()
    //       .substring(11, 16);

    final iconReceived = response.hourly[i].weather[0].icon;
    final icon = IconConverter(iconName: iconReceived).switchIcon();
    return Container(
      height: 120,
      width: 100,
      // decoration: BoxDecoration(border: Border.all(color: Colors.blueAccent)),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 0,
        color: Colors.transparent.withOpacity(0.2),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                DateTime.fromMillisecondsSinceEpoch(
                        response.hourly[i].dt * 1000)
                    .toString()
                    .substring(11, 16),
                style: TextStyle(color: Theme.of(context).accentColor),
                textAlign: TextAlign.center,
              ),
              icon,
              // Image.network(
              //   'https://openweathermap.org/img/w/$icon.png',
              //   fit: BoxFit.fill,
              // ), //response.hourly[i].weather[0].icon),
              Text(
                '${response.hourly[i].temp.round().toString()}°',
                style: TextStyle(color: Theme.of(context).accentColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
