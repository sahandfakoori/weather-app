import 'package:weather_app/features/home/data/mapper/clouds_mapper.dart';
import 'package:weather_app/features/home/data/mapper/coord_mapper.dart';
import 'package:weather_app/features/home/data/mapper/main_mapper.dart';
import 'package:weather_app/features/home/data/mapper/rain_mapper.dart';
import 'package:weather_app/features/home/data/mapper/sys_mapper.dart';
import 'package:weather_app/features/home/data/mapper/weather_mapper.dart';
import 'package:weather_app/features/home/data/mapper/wind_mapper.dart';
import 'package:weather_app/features/home/data/models/current_weather_model.dart';
import 'package:weather_app/features/home/domain/entities/current_weather_entity.dart';

extension CurrentWeatherMapper on CurrentWeatherModel {
  CurrentWeatherEntity toEntity() {
    return CurrentWeatherEntity(
      coord: coord.toEntity(),
      weather: weather.map((e) => e.toEntity()).toList(),
      base: base,
      main: main.toEntity(),
      visibility: visibility,
      wind: wind.toEntity(),
      rain: rain?.toEntity(),
      clouds: clouds.toEntity(),
      dt: dt,
      sys: sys.toEntity(),
      timezone: timezone,
      id: id,
      name: name,
      cod: cod,
    );
  }
}
