import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';

class BottomCard extends StatelessWidget {
  const BottomCard({
    Key key,
    @required this.windSpeed,
    @required this.humidity,
    @required this.feelsLike,
  }) : super(key: key);

  final windSpeed;
  final humidity;
  final feelsLike;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.transparent.withOpacity(0.2),
      elevation: 0,
      shadowColor: Colors.transparent,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(color: Theme.of(context).accentColor)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Center(
              child: Container(
                alignment: Alignment.center,
                height: 80,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    BoxedIcon(
                      WeatherIcons.windy,
                      color: Theme.of(context).accentColor,
                      size: 26,
                    ),
                    Text('$windSpeed Km/h',
                        style: TextStyle(color: Theme.of(context).accentColor)),
                  ],
                ),
              ),
            ),
            Center(
              child: Container(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    BoxedIcon(
                      WeatherIcons.humidity,
                      color: Theme.of(context).accentColor,
                    ),
                    Text('$humidity %',
                        style: TextStyle(color: Theme.of(context).accentColor)),
                  ],
                ),
                height: 80,
              ),
            ),
            Center(
              child: Container(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Feels Like',
                      style: TextStyle(color: Theme.of(context).accentColor),
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    Text(
                      '$feelsLike°',
                      style: TextStyle(color: Theme.of(context).accentColor),
                    ),
                  ],
                ),
                height: 80,
              ),
            )
          ],
        ),
      ),
    );
  }
}
