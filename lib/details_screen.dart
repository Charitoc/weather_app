import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/dayItem.dart';
import 'package:weather_app/models/CurrentByLatLng.dart';
import 'package:weather_app/models/HourlyByLatLng.dart';
import 'package:weather_app/weather_helper.dart';
import 'package:weather_icons/weather_icons.dart';
import 'location_helper.dart';

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
  CurrentByLatLng response;
  HourlyByLatLng response2;
  Future myFuture;
  Future dayresponse;
  Future myFuture2;
  var fut;

  Future<void> asyncMethod() async {
    await Provider.of<LocationHelper>(context, listen: false)
        .getplace()
        .then((value) {
      location = value[0];
      lat = value[1];
      lon = value[2];
      print("Loc");
    });
    await Future.wait([
      Provider.of<WeatherHelper>(context, listen: false)
          .getWeather(lat, lon)
          .then((value) => response = value),
      Provider.of<WeatherHelper>(context, listen: false)
          .getHourlyWeather(lat, lon)
          .then((value) => response2 = value)
    ]);
  }

  @override
  void initState() {
    super.initState();
    // Provider.of<LocationHelper>(context, listen: false).initLocation();
    myFuture = asyncMethod();

    // myFuture = Provider.of<LocationHelper>(context, listen: false)
    //     .getplace()
    //     .then((value) async {
    //   location = value[0];
    //   lat = value[1];
    //   lon = value[2];
    //   await Future.wait([
    //     Provider.of<WeatherHelper>(context, listen: false)
    //         .getWeather(lat, lon)
    //         .then((value) => response = value),
    //     Provider.of<WeatherHelper>(context, listen: false)
    //         .getHourlyWeather(lat, lon)
    //         .then((value) => response2 = value)
    //   ]);
    // });
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

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.red,
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
            future: myFuture,
            builder: (ctx, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting ||
                  snapshot.connectionState == ConnectionState.active ||
                  snapshot.connectionState == ConnectionState.none) {
                return Center(child: CircularProgressIndicator());
                // return Scaffold(
                //   appBar: AppBar(),
                //   body:
                //   Center(
                //     child: CircularProgressIndicator(),
                //   ),
                // );
              }
              // else if (snapshot.connectionState != ConnectionState.done) {
              //   return Center(child: CircularProgressIndicator());
              // }
              // else if (snapshot.error != null) {
              //   print(snapshot.error);
              //   return Text(
              //     snapshot.error.toString(),
              //     style: TextStyle(color: Colors.white),
              //   );
              // }
              else if (snapshot.error != null) {
                return Center(
                  child: Text(
                      "Error on future2 ${snapshot?.error?.toString() ?? ""}"),
                );
              }
              // else if (snapshot.connectionState == ConnectionState.done) {
              //   print("${response.toJson()}");
              //   print("DONE");
              //   if (snapshot.hasError) {
              //     return Center(
              //       child: Text(
              //           "Error on future2 ${snapshot?.error?.toString() ?? ""}"),
              //     );
              //   }
              else if (snapshot.connectionState == ConnectionState.done) {
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
                              // BoxedIcon(
                              //   WeatherIcons.day_sunny,
                              //   size: deviceWidth / 4,
                              //   color: Theme.of(context).accentColor,
                              // )
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
                  child: Text("None of the above  ?? " "}"),
                );
              }
            }),
      ),
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
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 24,
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
            Center(
              // flex: 1,
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
              // flex: 1,
              child: Container(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    BoxedIcon(
                      WeatherIcons.humidity,
                      color: Theme.of(context).accentColor,
                      // size: 26,
                    ),
                    Text('$humidity %',
                        style: TextStyle(color: Theme.of(context).accentColor)),
                  ],
                ),
                height: 80,
              ),
            ),
            Center(
              // flex: 1,
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
