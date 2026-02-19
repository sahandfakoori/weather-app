import 'package:weather_app/features/home/domain/entities/clouds_entity.dart';
import 'package:weather_app/features/home/domain/entities/coord_entity.dart';
import 'package:weather_app/features/home/domain/entities/main_entity.dart';
import 'package:weather_app/features/home/domain/entities/rain_entity.dart';
import 'package:weather_app/features/home/domain/entities/sys_entity.dart';
import 'package:weather_app/features/home/domain/entities/weather_entity.dart';
import 'package:weather_app/features/home/domain/entities/wind_entity.dart';

class CurrentWeatherEntity {
  final CoordEntity coord;
  final List<WeatherEntity> weather;
  final String base;
  final MainEntity main;
  final int visibility;
  final WindEntity wind;
  final RainEntity? rain;
  final CloudsEntity clouds;
  final int dt;
  final SysEntity sys;
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
