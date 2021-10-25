import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';

class IconConverter {
  String iconName;
  double size = 30;
  IconConverter({@required this.iconName});

  BoxedIcon switchIcon() {
    switch (iconName) {
      case '01d':
        return BoxedIcon(
          WeatherIcons.day_sunny,
          size: size,
          color: Colors.white,
        );
      case '02d':
        return BoxedIcon(
          WeatherIcons.day_cloudy,
          size: size,
          color: Colors.white,
        );
      case '03d':
        return BoxedIcon(
          WeatherIcons.cloud,
          size: size,
          color: Colors.white,
        );
      case '04d':
        return BoxedIcon(
          WeatherIcons.day_cloudy,
          size: size,
          color: Colors.white,
        );
      case '09d':
        return BoxedIcon(
          WeatherIcons.rain,
          size: size,
          color: Colors.white,
        );
      case '10d':
        return BoxedIcon(
          WeatherIcons.day_rain,
          size: size,
          color: Colors.white,
        );
      case '11d':
        return BoxedIcon(
          WeatherIcons.thunderstorm,
          size: size,
          color: Colors.white,
        );
      case '13d':
        return BoxedIcon(
          WeatherIcons.snowflake_cold,
          size: size,
          color: Colors.white,
        );
      case '50d':
        return BoxedIcon(
          WeatherIcons.wind,
          size: size,
          color: Colors.white,
        );
      case '01n':
        return BoxedIcon(
          WeatherIcons.night_clear,
          size: size,
          color: Colors.white,
        );
      case '02n':
        return BoxedIcon(
          WeatherIcons.night_alt_cloudy,
          size: size,
          color: Colors.white,
        );
      case '03n':
        return BoxedIcon(
          WeatherIcons.night_alt_cloudy_high,
          size: size,
          color: Colors.white,
        );
      case '04n':
        return BoxedIcon(
          WeatherIcons.cloudy,
          size: size,
          color: Colors.white,
        );
      case '09n':
        return BoxedIcon(
          WeatherIcons.night_rain,
          size: size,
          color: Colors.white,
        );
      case '10n':
        return BoxedIcon(
          WeatherIcons.night_alt_sleet,
          size: size,
          color: Colors.white,
        );
      case '11n':
        return BoxedIcon(
          WeatherIcons.thunderstorm,
          size: size,
          color: Colors.white,
        );
      case '13n':
        return BoxedIcon(
          WeatherIcons.snowflake_cold,
          size: size,
          color: Colors.white,
        );
      case '50n':
        return BoxedIcon(
          WeatherIcons.wind,
          size: size,
          color: Colors.white,
        );

      default:
        return BoxedIcon(
          WeatherIcons.raindrop,
          size: size,
          color: Colors.white,
        );
    }
  }
}
