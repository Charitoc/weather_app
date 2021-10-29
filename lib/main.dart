import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/providers/location_helper.dart';
import 'package:weather_app/providers/weather_helper.dart';
import 'details_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<WeatherHelper>(
          create: (ctx) => WeatherHelper(),
        ),
        ChangeNotifierProvider<LocationHelper>(
          create: (ctx) => LocationHelper(),
        ),
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
