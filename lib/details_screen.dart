import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/Day.dart';
import 'package:weather_app/dayItem.dart';
import 'package:weather_app/models/CurrentByLatLng.dart';
import 'package:weather_app/models/HourlyByLatLng.dart';
import 'package:weather_app/weather_helper.dart';
import 'package:weather_icons/weather_icons.dart';
import 'location_helper.dart';

const OPENWEATHER_API_KEY = 'bf44fb7452f5021bcf6d6b2d3f59700c';

class DetailScreen extends StatefulWidget {
  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  var location;
  num lat;
  num lon;
  var weather;
  var time;
  Future<List<DayCard>> dayCards;
  List<DayCard> listofDayCards;
  CurrentByLatLng response;
  HourlyByLatLng response2;
  Future myFuture;
  Future dayresponse;
  Future myFuture2;
  Future<HourlyByLatLng> _myFuture;

  @override
  void initState() {
    super.initState();

    //isLoading = true;
    // location = Provider.of<LocationHelper>(context).location;
    // weather = Provider.of<WeatherHelper>(context).weather;
    // LocationHelper.getplace().then((value) {
    //   setState(() {
    //     this.location = value;
    //   });
    // }).then((_) {
    //   //List hourList = List<Object>.from(element);
    //   //Future<List> hourList =
    // });
    // .then((_) {
    //   WeatherHelper.getHourlyWeather(
    //           LocationHelper.latitude, LocationHelper.latitude)
    //       .then((value) {
    //     response2 = value;
    //     print(response2.hourly.length);
    //   });

    //WeatherHelper.getHourlyWeather(WeatherHelper.lat, WeatherHelper.lon);
    // dayCards.then((value) {
    //   response = val;
    // });
    // dayCards.then((value) {
    //   listofDayCards = value;
    // });
    //print(object)

    //print(hourList);
  }

  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    // Future fun() async {
    //   final aFuture = await Future.wait([
    //     Provider.of<LocationHelper>(context, listen: false)
    //         .getplace()
    //         .then((value) {
    //       location = value[0];
    //       lat = value[1];
    //       lon = value[2];
    //     }).then((value) {
    //       //     .then((value) {
    //       //   print("NEXT VALUE ${value.toJson()}");
    //       //   response = value;
    //       // }),

    //       return 1;
    //     }),
    //   ]);
    // }

    //fun().then((value) => null);

    //final resp = Provider.of<WeatherHelper>(context).hello;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: FutureBuilder(
          // future: Future.wait([
          //   Provider.of<LocationHelper>(context, listen: false)
          //       .getplace()
          //       .then((val) {
          //     location = val;
          //     Provider.of<WeatherHelper>(context, listen: false)
          //         .getWeather(40.0, 20.0)
          //         .then((value) {
          //       response = value;
          //       print(response.main.humidity);
          //     });
          //   }),
          // ]),
          future: Provider.of<LocationHelper>(context)
              .getplace()
              .then((value) async {
            location = value[0];
            lat = value[1];
            lon = value[2];
            await Future.wait([
              myFuture = Provider.of<WeatherHelper>(context, listen: false)
                  .getWeather(lat, lon)
                  .then((value) => response = value),
              myFuture2 = Provider.of<WeatherHelper>(context, listen: false)
                  .getHourlyWeather(lat, lon)
                  .then((value) => response2 = value)
            ]);
          }),
          builder: (ctx, snapshot) {
            if (snapshot.connectionState != ConnectionState.done) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.error != null) {
              print(snapshot.error);
              return Text(
                snapshot.error.toString(),
                style: TextStyle(color: Colors.white),
              );
            } else {
              //print("${response.toJson()}");
              print("DONE");
              return Container(
                  decoration: (response?.weather?.length ?? 0) > 0
                      ? response.weather[0].icon.toString().contains('d')
                          ? BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("assets/images/day.jpg"),
                                fit: BoxFit.fill,
                              ),
                            )
                          : BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("assets/images/night.jpg"),
                                fit: BoxFit.fill,
                              ),
                            )
                      : BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/night.jpg"),
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
                            BoxedIcon(
                              WeatherIcons.day_sunny,
                              size: deviceWidth / 4,
                              color: Theme.of(context).accentColor,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 30,
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
            }
          }),
    );
  }
}

class NextDaysScroll extends StatelessWidget {
  NextDaysScroll({@required this.response});

  final HourlyByLatLng response;

  @override
  Widget build(BuildContext context) {
    // final wer = Provider.of<WeatherHelper>(context);
    // var response = wer.hello;
    return Container(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 9,
        itemBuilder: (ctx, i) {
          return DayItem(response: response, i: i);
          // return Container(
          //   height: 50,
          //   width: 50,
          //   child: Text(DateTime.fromMillisecondsSinceEpoch(
          //           response.hourly[i].dt * 1000)
          //       .toString()
          //       .substring(11, 16)),
          // );
        },
      ),
    );
  }
}

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
            Flexible(
              flex: 1,
              child: Container(
                height: 80,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('Wind',
                        style: TextStyle(color: Theme.of(context).accentColor)),
                    Text('$windSpeed Km/h',
                        style: TextStyle(color: Theme.of(context).accentColor)),
                    Text('')
                  ],
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('Humidity',
                        style: TextStyle(color: Theme.of(context).accentColor)),
                    Text('$humidity %',
                        style: TextStyle(color: Theme.of(context).accentColor)),
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
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Feels Like',
                      style: TextStyle(color: Theme.of(context).accentColor),
                    ),
                    Text(
                      '$feelsLike Km',
                      style: TextStyle(color: Theme.of(context).accentColor),
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
    );
  }
}
