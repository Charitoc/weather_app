// To parse this JSON data, do
//
//     final hourlyByLatLng = hourlyByLatLngFromJson(jsonString);

import 'dart:convert';

HourlyByLatLng hourlyByLatLngFromJson(String str) =>
    HourlyByLatLng.fromJson(json.decode(str));

String hourlyByLatLngToJson(HourlyByLatLng data) => json.encode(data.toJson());

class HourlyByLatLng {
  HourlyByLatLng({
    this.lat,
    this.lon,
    this.timezone,
    this.timezoneOffset,
    this.current,
    this.minutely,
    this.hourly,
    this.daily,
  });

  num lat;
  num lon;
  String timezone;
  num timezoneOffset;
  Current current;
  List<Minutely> minutely;
  List<Current> hourly;
  List<Daily> daily;

  factory HourlyByLatLng.fromJson(Map<String, dynamic> json) => HourlyByLatLng(
        lat: json["lat"] == null ? null : json["lat"],
        lon: json["lon"] == null ? null : json["lon"],
        timezone: json["timezone"] == null ? null : json["timezone"],
        timezoneOffset:
            json["timezone_offset"] == null ? null : json["timezone_offset"],
        current:
            json["current"] == null ? null : Current.fromJson(json["current"]),
        minutely: json["minutely"] == null
            ? null
            : List<Minutely>.from(
                json["minutely"].map((x) => Minutely.fromJson(x))),
        hourly: json["hourly"] == null
            ? null
            : List<Current>.from(
                json["hourly"].map((x) => Current.fromJson(x))),
        daily: json["daily"] == null
            ? null
            : List<Daily>.from(json["daily"].map((x) => Daily.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "lat": lat == null ? null : lat,
        "lon": lon == null ? null : lon,
        "timezone": timezone == null ? null : timezone,
        "timezone_offset": timezoneOffset == null ? null : timezoneOffset,
        "current": current == null ? null : current.toJson(),
        "minutely": minutely == null
            ? null
            : List<dynamic>.from(minutely.map((x) => x.toJson())),
        "hourly": hourly == null
            ? null
            : List<dynamic>.from(hourly.map((x) => x.toJson())),
        "daily": daily == null
            ? null
            : List<dynamic>.from(daily.map((x) => x.toJson())),
      };
}

class Current {
  Current({
    this.dt,
    this.sunrise,
    this.sunset,
    this.temp,
    this.feelsLike,
    this.pressure,
    this.humidity,
    this.dewPoint,
    this.uvi,
    this.clouds,
    this.visibility,
    this.windSpeed,
    this.windDeg,
    this.windGust,
    this.weather,
    this.pop,
    this.rain,
  });

  num dt;
  num sunrise;
  num sunset;
  num temp;
  num feelsLike;
  num pressure;
  num humidity;
  num dewPoint;
  num uvi;
  num clouds;
  num visibility;
  num windSpeed;
  num windDeg;
  num windGust;
  List<Weather> weather;
  num pop;
  Rain rain;

  factory Current.fromJson(Map<String, dynamic> json) => Current(
        dt: json["dt"] == null ? null : json["dt"],
        sunrise: json["sunrise"] == null ? null : json["sunrise"],
        sunset: json["sunset"] == null ? null : json["sunset"],
        temp: json["temp"] == null ? null : json["temp"].toDouble(),
        feelsLike:
            json["feels_like"] == null ? null : json["feels_like"].toDouble(),
        pressure: json["pressure"] == null ? null : json["pressure"],
        humidity: json["humidity"] == null ? null : json["humidity"],
        dewPoint:
            json["dew_point"] == null ? null : json["dew_point"].toDouble(),
        uvi: json["uvi"] == null ? null : json["uvi"].toDouble(),
        clouds: json["clouds"] == null ? null : json["clouds"],
        visibility: json["visibility"] == null ? null : json["visibility"],
        windSpeed:
            json["wind_speed"] == null ? null : json["wind_speed"].toDouble(),
        windDeg: json["wind_deg"] == null ? null : json["wind_deg"],
        windGust:
            json["wind_gust"] == null ? null : json["wind_gust"].toDouble(),
        weather: json["weather"] == null
            ? null
            : List<Weather>.from(
                json["weather"].map((x) => Weather.fromJson(x))),
        pop: json["pop"] == null ? null : json["pop"].toDouble(),
        rain: json["rain"] == null ? null : Rain.fromJson(json["rain"]),
      );

  Map<String, dynamic> toJson() => {
        "dt": dt == null ? null : dt,
        "sunrise": sunrise == null ? null : sunrise,
        "sunset": sunset == null ? null : sunset,
        "temp": temp == null ? null : temp,
        "feels_like": feelsLike == null ? null : feelsLike,
        "pressure": pressure == null ? null : pressure,
        "humidity": humidity == null ? null : humidity,
        "dew_point": dewPoint == null ? null : dewPoint,
        "uvi": uvi == null ? null : uvi,
        "clouds": clouds == null ? null : clouds,
        "visibility": visibility == null ? null : visibility,
        "wind_speed": windSpeed == null ? null : windSpeed,
        "wind_deg": windDeg == null ? null : windDeg,
        "wind_gust": windGust == null ? null : windGust,
        "weather": weather == null
            ? null
            : List<dynamic>.from(weather.map((x) => x.toJson())),
        "pop": pop == null ? null : pop,
        "rain": rain == null ? null : rain.toJson(),
      };
}

class Rain {
  Rain({
    this.the1H,
  });

  num the1H;

  factory Rain.fromJson(Map<String, dynamic> json) => Rain(
        the1H: json["1h"] == null ? null : json["1h"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "1h": the1H == null ? null : the1H,
      };
}

class Weather {
  Weather({
    this.id,
    this.main,
    this.description,
    this.icon,
  });

  num id;
  String main;
  String description;
  String icon;

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        id: json["id"] == null ? null : json["id"],
        main: json["main"] == null ? null : json["main"],
        description: json["description"] == null ? null : json["description"],
        icon: json["icon"] == null ? null : json["icon"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "main": main == null ? null : main,
        "description": description == null ? null : description,
        "icon": icon == null ? null : icon,
      };
}

class Daily {
  Daily({
    this.dt,
    this.sunrise,
    this.sunset,
    this.moonrise,
    this.moonset,
    this.moonPhase,
    this.temp,
    this.feelsLike,
    this.pressure,
    this.humidity,
    this.dewPoint,
    this.windSpeed,
    this.windDeg,
    this.windGust,
    this.weather,
    this.clouds,
    this.pop,
    this.rain,
    this.uvi,
  });

  num dt;
  num sunrise;
  num sunset;
  num moonrise;
  num moonset;
  num moonPhase;
  Temp temp;
  FeelsLike feelsLike;
  num pressure;
  num humidity;
  num dewPoint;
  num windSpeed;
  num windDeg;
  num windGust;
  List<Weather> weather;
  num clouds;
  num pop;
  num rain;
  num uvi;

  factory Daily.fromJson(Map<String, dynamic> json) => Daily(
        dt: json["dt"] == null ? null : json["dt"],
        sunrise: json["sunrise"] == null ? null : json["sunrise"],
        sunset: json["sunset"] == null ? null : json["sunset"],
        moonrise: json["moonrise"] == null ? null : json["moonrise"],
        moonset: json["moonset"] == null ? null : json["moonset"],
        moonPhase:
            json["moon_phase"] == null ? null : json["moon_phase"].toDouble(),
        temp: json["temp"] == null ? null : Temp.fromJson(json["temp"]),
        feelsLike: json["feels_like"] == null
            ? null
            : FeelsLike.fromJson(json["feels_like"]),
        pressure: json["pressure"] == null ? null : json["pressure"],
        humidity: json["humidity"] == null ? null : json["humidity"],
        dewPoint:
            json["dew_point"] == null ? null : json["dew_point"].toDouble(),
        windSpeed:
            json["wind_speed"] == null ? null : json["wind_speed"].toDouble(),
        windDeg: json["wind_deg"] == null ? null : json["wind_deg"],
        windGust:
            json["wind_gust"] == null ? null : json["wind_gust"].toDouble(),
        weather: json["weather"] == null
            ? null
            : List<Weather>.from(
                json["weather"].map((x) => Weather.fromJson(x))),
        clouds: json["clouds"] == null ? null : json["clouds"],
        pop: json["pop"] == null ? null : json["pop"].toDouble(),
        rain: json["rain"] == null ? null : json["rain"].toDouble(),
        uvi: json["uvi"] == null ? null : json["uvi"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "dt": dt == null ? null : dt,
        "sunrise": sunrise == null ? null : sunrise,
        "sunset": sunset == null ? null : sunset,
        "moonrise": moonrise == null ? null : moonrise,
        "moonset": moonset == null ? null : moonset,
        "moon_phase": moonPhase == null ? null : moonPhase,
        "temp": temp == null ? null : temp.toJson(),
        "feels_like": feelsLike == null ? null : feelsLike.toJson(),
        "pressure": pressure == null ? null : pressure,
        "humidity": humidity == null ? null : humidity,
        "dew_point": dewPoint == null ? null : dewPoint,
        "wind_speed": windSpeed == null ? null : windSpeed,
        "wind_deg": windDeg == null ? null : windDeg,
        "wind_gust": windGust == null ? null : windGust,
        "weather": weather == null
            ? null
            : List<dynamic>.from(weather.map((x) => x.toJson())),
        "clouds": clouds == null ? null : clouds,
        "pop": pop == null ? null : pop,
        "rain": rain == null ? null : rain,
        "uvi": uvi == null ? null : uvi,
      };
}

class FeelsLike {
  FeelsLike({
    this.day,
    this.night,
    this.eve,
    this.morn,
  });

  num day;
  num night;
  num eve;
  num morn;

  factory FeelsLike.fromJson(Map<String, dynamic> json) => FeelsLike(
        day: json["day"] == null ? null : json["day"].toDouble(),
        night: json["night"] == null ? null : json["night"].toDouble(),
        eve: json["eve"] == null ? null : json["eve"].toDouble(),
        morn: json["morn"] == null ? null : json["morn"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "day": day == null ? null : day,
        "night": night == null ? null : night,
        "eve": eve == null ? null : eve,
        "morn": morn == null ? null : morn,
      };
}

class Temp {
  Temp({
    this.day,
    this.min,
    this.max,
    this.night,
    this.eve,
    this.morn,
  });

  num day;
  num min;
  num max;
  num night;
  num eve;
  num morn;

  factory Temp.fromJson(Map<String, dynamic> json) => Temp(
        day: json["day"] == null ? null : json["day"].toDouble(),
        min: json["min"] == null ? null : json["min"].toDouble(),
        max: json["max"] == null ? null : json["max"].toDouble(),
        night: json["night"] == null ? null : json["night"].toDouble(),
        eve: json["eve"] == null ? null : json["eve"].toDouble(),
        morn: json["morn"] == null ? null : json["morn"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "day": day == null ? null : day,
        "min": min == null ? null : min,
        "max": max == null ? null : max,
        "night": night == null ? null : night,
        "eve": eve == null ? null : eve,
        "morn": morn == null ? null : morn,
      };
}

class Minutely {
  Minutely({
    this.dt,
    this.precipitation,
  });

  num dt;
  num precipitation;

  factory Minutely.fromJson(Map<String, dynamic> json) => Minutely(
        dt: json["dt"] == null ? null : json["dt"],
        precipitation:
            json["precipitation"] == null ? null : json["precipitation"],
      );

  Map<String, dynamic> toJson() => {
        "dt": dt == null ? null : dt,
        "precipitation": precipitation == null ? null : precipitation,
      };
}
