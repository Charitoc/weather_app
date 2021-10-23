// To parse this JSON data, do
//
//     final currentByLatLng = currentByLatLngFromJson(jsonString);
// @dart=2.9
import 'dart:convert';

CurrentByLatLng currentByLatLngFromJson(String str) =>
    CurrentByLatLng.fromJson(json.decode(str));

String currentByLatLngToJson(CurrentByLatLng data) =>
    json.encode(data.toJson());

class CurrentByLatLng {
  CurrentByLatLng({
    this.coord,
    this.weather,
    this.base,
    this.main,
    this.wind,
    this.clouds,
    this.dt,
    this.sys,
    this.timezone,
    this.id,
    this.name,
    this.cod,
  });

  Coord coord;
  List<Weather> weather;
  String base;
  Main main;
  Wind wind;
  Clouds clouds;
  int dt;
  Sys sys;
  var timezone;
  int id;
  String name;
  var cod;

  factory CurrentByLatLng.fromJson(Map<String, dynamic> json) =>
      CurrentByLatLng(
        coord: json["coord"] == null ? null : Coord.fromJson(json["coord"]),
        weather: json["weather"] == null
            ? null
            : List<Weather>.from(
                json["weather"].map((x) => Weather.fromJson(x))),
        base: json["base"] == null ? null : json["base"],
        main: json["main"] == null ? null : Main.fromJson(json["main"]),
        wind: json["wind"] == null ? null : Wind.fromJson(json["wind"]),
        clouds: json["clouds"] == null ? null : Clouds.fromJson(json["clouds"]),
        dt: json["dt"] == null ? null : json["dt"],
        sys: json["sys"] == null ? null : Sys.fromJson(json["sys"]),
        timezone: json["timezone"] == null ? null : json["timezone"],
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        cod: json["cod"] == null ? null : json["cod"],
      );

  Map<String, dynamic> toJson() => {
        "coord": coord == null ? null : coord.toJson(),
        "weather": weather == null
            ? null
            : List<dynamic>.from(weather.map((x) => x.toJson())),
        "base": base == null ? null : base,
        "main": main == null ? null : main.toJson(),
        "wind": wind == null ? null : wind.toJson(),
        "clouds": clouds == null ? null : clouds.toJson(),
        "dt": dt == null ? null : dt,
        "sys": sys == null ? null : sys.toJson(),
        "timezone": timezone == null ? null : timezone,
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "cod": cod == null ? null : cod,
      };
}

class Clouds {
  Clouds({
    this.all,
  });

  int all;

  factory Clouds.fromJson(Map<String, dynamic> json) => Clouds(
        all: json["all"] == null ? null : json["all"],
      );

  Map<String, dynamic> toJson() => {
        "all": all == null ? null : all,
      };
}

class Coord {
  Coord({
    this.lon,
    this.lat,
  });

  double lon;
  double lat;

  factory Coord.fromJson(Map<String, dynamic> json) => Coord(
        lon: json["lon"] == null ? null : json["lon"],
        lat: json["lat"] == null ? null : json["lat"],
      );

  Map<String, dynamic> toJson() => {
        "lon": lon == null ? null : lon,
        "lat": lat == null ? null : lat,
      };
}

class Main {
  Main({
    this.temp,
    this.feelsLike,
    this.tempMin,
    this.tempMax,
    this.pressure,
    this.humidity,
  });

  double temp;
  double feelsLike;
  double tempMin;
  double tempMax;
  int pressure;
  int humidity;

  factory Main.fromJson(Map<String, dynamic> json) => Main(
        temp: json["temp"] == null ? null : json["temp"].toDouble(),
        feelsLike:
            json["feels_like"] == null ? null : json["feels_like"].toDouble(),
        tempMin: json["temp_min"] == null ? null : json["temp_min"].toDouble(),
        tempMax: json["temp_max"] == null ? null : json["temp_max"].toDouble(),
        pressure: json["pressure"] == null ? null : json["pressure"],
        humidity: json["humidity"] == null ? null : json["humidity"],
      );

  Map<String, dynamic> toJson() => {
        "temp": temp == null ? null : temp,
        "feels_like": feelsLike == null ? null : feelsLike,
        "temp_min": tempMin == null ? null : tempMin,
        "temp_max": tempMax == null ? null : tempMax,
        "pressure": pressure == null ? null : pressure,
        "humidity": humidity == null ? null : humidity,
      };
}

class Sys {
  Sys({
    this.type,
    this.id,
    this.message,
    this.country,
    this.sunrise,
    this.sunset,
  });

  int type;
  int id;
  double message;
  String country;
  int sunrise;
  int sunset;

  factory Sys.fromJson(Map<String, dynamic> json) => Sys(
        type: json["type"] == null ? null : json["type"],
        id: json["id"] == null ? null : json["id"],
        message: json["message"] == null ? null : json["message"].toDouble(),
        country: json["country"] == null ? null : json["country"],
        sunrise: json["sunrise"] == null ? null : json["sunrise"],
        sunset: json["sunset"] == null ? null : json["sunset"],
      );

  Map<String, dynamic> toJson() => {
        "type": type == null ? null : type,
        "id": id == null ? null : id,
        "message": message == null ? null : message,
        "country": country == null ? null : country,
        "sunrise": sunrise == null ? null : sunrise,
        "sunset": sunset == null ? null : sunset,
      };
}

class Weather {
  Weather({
    this.id,
    this.main,
    this.description,
    this.icon,
  });

  int id;
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

class Wind {
  Wind({
    this.speed,
    this.deg,
  });

  double speed;
  double deg;

  factory Wind.fromJson(Map<String, dynamic> json) => Wind(
        speed: json["speed"] == null ? null : json["speed"].toDouble(),
        deg: json["deg"] == null ? null : json["deg"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "speed": speed == null ? null : speed,
        "deg": deg == null ? null : deg,
      };
}
