import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/CurrentByLatLng.dart';
import 'package:weather_app/models/HourlyByLatLng.dart';
import 'package:weather_app/providers/weather_helper.dart';
import 'bottom_card.dart';
import 'next_days.dart';
import 'providers/location_helper.dart';

class DetailScreen extends StatefulWidget {
  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  var location;
  num lat;
  num lon;
  CurrentByLatLng response;
  HourlyByLatLng response2;
  Future myFuture;

  Future<void> asyncMethod() async {
    await Provider.of<LocationHelper>(context, listen: false)
        .getplace()
        .then((value) {
      location = value[0];
      lat = value[1];
      lon = value[2];
    });
    await Future.wait([
      Provider.of<WeatherHelper>(context, listen: false)
          .getWeather(lat, lon)
          .then((value) {
        response = value;
      }),
      Provider.of<WeatherHelper>(context, listen: false)
          .getHourlyWeather(lat, lon)
          .then((value) {
        response2 = value;
      })
    ]);
  }

  @override
  void initState() {
    super.initState();
    myFuture = asyncMethod();
  }

  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: FutureBuilder(
            future: myFuture,
            builder: (ctx, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting ||
                  snapshot.connectionState == ConnectionState.active ||
                  snapshot.connectionState == ConnectionState.none) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.error != null) {
                return Center(
                  child: Text(
                    "${snapshot?.error?.toString() ?? ""}",
                  ),
                );
              } else if (snapshot.connectionState == ConnectionState.done) {
                return Container(
                    decoration: (response?.weather?.length ?? 0) > 0
                        ? response.weather[0].icon.toString().contains('d')
                            ? BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage("assets/images/day.jpg"),
                                  fit: BoxFit.cover,
                                ),
                              )
                            : BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage("assets/images/night.png"),
                                  fit: BoxFit.fill,
                                ),
                              )
                        : BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/images/night.png"),
                              fit: BoxFit.fill,
                            ),
                          ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            location ?? "",
                            style: TextStyle(
                                fontSize: 30,
                                color: Theme.of(context).accentColor),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                ('${response.main.temp.round()}°'),
                                style: TextStyle(
                                    fontSize: deviceWidth / 3,
                                    color: Theme.of(context).accentColor),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 140,
                          ),
                          response2 != null
                              ? NextDaysScroll(
                                  response: response2,
                                )
                              : CircularProgressIndicator(),
                          Expanded(
                            child: Container(),
                          ),
                          BottomCard(
                              windSpeed: response.wind.speed,
                              humidity: response.main.humidity,
                              feelsLike: response.main.feelsLike),
                        ],
                      ),
                    ));
              } else {
                return Center(
                  child: Text("Unknown Error  ?? " "}"),
                );
              }
            }),
      ),
    );
  }
}
