import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';
import 'location_helper.dart';

const OPENWEATHER_API_KEY = 'bf44fb7452f5021bcf6d6b2d3f59700c';

class DetailScreen extends StatefulWidget {
  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  var location;
  var temperature;
  var isLoading;
  var windSpeed;
  var humidity;
  var visibility;
  var time;

  @override
  void initState() {
    super.initState();
    isLoading = true;
    LocationHelper.getplace().then((value) {
      setState(() {
        this.location = value[0];
        this.temperature = value[1];
        this.windSpeed = value[2];
        this.humidity = value[3];
        this.visibility = value[4];
        this.time = value[5];
      });
    }).then((_) {
      isLoading = false;
    });
  }

  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    return Container(
      decoration: time == 'day'
          ? BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/day.jpg"),
                fit: BoxFit.fill,
              ),
            )
          // : BoxDecoration(
          //     gradient: LinearGradient(
          //         begin: Alignment.topRight,
          //         end: Alignment.bottomLeft,
          //         colors: [Colors.blue[900], Colors.black12])),
          : BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/night.jpg"),
                fit: BoxFit.fill,
              ),
            ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            '',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: isLoading == true
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      location,
                      style: TextStyle(
                          fontSize: 30, color: Theme.of(context).accentColor),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          ('$temperature°'),
                          style: TextStyle(
                              fontSize: deviceWidth / 3,
                              color: Theme.of(context).accentColor),
                        ),
                        BoxedIcon(
                          WeatherIcons.day_sunny,
                          size: deviceWidth / 4,
                          color: Theme.of(context).accentColor,
                        )
                      ],
                    ),
                    Expanded(
                      child: Container(),
                    ),
                    Card(
                      color: Colors.transparent.withOpacity(0.2),
                      elevation: 0,
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                          side:
                              BorderSide(color: Theme.of(context).accentColor)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Flexible(
                              flex: 1,
                              child: Container(
                                height: 80,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text('Wind',
                                        style: TextStyle(
                                            color:
                                                Theme.of(context).accentColor)),
                                    Text('$windSpeed Km/h',
                                        style: TextStyle(
                                            color:
                                                Theme.of(context).accentColor)),
                                    Text('')
                                  ],
                                ),
                              ),
                            ),
                            Flexible(
                              flex: 1,
                              child: Container(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text('Humidity',
                                        style: TextStyle(
                                            color:
                                                Theme.of(context).accentColor)),
                                    Text('$humidity %',
                                        style: TextStyle(
                                            color:
                                                Theme.of(context).accentColor)),
                                    Text('')
                                  ],
                                ),
                                height: 80,
                              ),
                            ),
                            Flexible(
                              flex: 1,
                              child: Container(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      'Visibility',
                                      style: TextStyle(
                                          color: Theme.of(context).accentColor),
                                    ),
                                    Text(
                                      '$visibility Km',
                                      style: TextStyle(
                                          color: Theme.of(context).accentColor),
                                    ),
                                    Text('')
                                  ],
                                ),
                                height: 80,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
