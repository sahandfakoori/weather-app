import 'package:weather_app/features/home/data/models/current_weather.dart';
import 'package:weather_app/features/home/domain/entities/current_weather_entity.dart';

extension WeatherModelMapper on CurrentWeatherModel {
  CurrentWeatherEntity toEntity() {
    return CurrentWeatherEntity(
      coord: coord,
      weather: weather.map((e) => e.toEntity()).toList(),
      base: base,
      main: main,
      visibility: visibility,
      wind: wind,
      rain: rain,
      clouds: clouds,
      dt: dt,
      sys: sys,
      timezone: timezone,
      id: id,
      name: name,
      cod: cod,
    );
  }
}


extension WeatherMapper on Weather {
  WeatherEntity toEntity() {
    return WeatherEntity(
      id: id,
      main: main,
      description: description,
      icon: icon,
    );
  }
}
