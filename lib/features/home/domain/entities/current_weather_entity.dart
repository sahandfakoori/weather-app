import 'package:weather_app/features/home/data/models/current_weather.dart';

class CurrentWeatherEntity {
  final Coord coord;
  final List<WeatherEntity> weather;
  final String base;
  final Main main;
  final int visibility;
  final Wind wind;
  final Rain? rain;
  final Clouds clouds;
  final int dt;
  final Sys sys;
  final int timezone;
  final int id;
  final String name;
  final int cod;

  CurrentWeatherEntity({
    required this.coord,
    required this.weather,
    required this.base,
    required this.main,
    required this.visibility,
    required this.wind,
    this.rain,
    required this.clouds,
    required this.dt,
    required this.sys,
    required this.timezone,
    required this.id,
    required this.name,
    required this.cod,
  });
}


class WeatherEntity{
  final int id;
  final String main;
  final String description;
  final String icon;

  WeatherEntity({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });
}
