import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/location_helper.dart';
import 'package:weather_app/weather_helper.dart';
import 'details_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<WeatherHelper>(
          create: (ctx) => WeatherHelper(),
        ),
        Provider<LocationHelper>(
          create: (ctx) => LocationHelper(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Weather App',
        theme: ThemeData(
          accentColor: Colors.white,
        ),
        home: DetailScreen(),
      ),
    );
  }
}
