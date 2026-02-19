import 'package:weather_app/features/home/domain/entities/clouds_entity.dart';
import 'package:weather_app/features/home/domain/entities/forecast_sys_entity.dart';
import 'package:weather_app/features/home/domain/entities/main_entity.dart';
import 'package:weather_app/features/home/domain/entities/rain_entity.dart';
import 'package:weather_app/features/home/domain/entities/weather_entity.dart';
import 'package:weather_app/features/home/domain/entities/wind_entity.dart';

class ForecastItemEntity {
  final int dt;
  final MainEntity main;
  final List<WeatherEntity> weather;
  final CloudsEntity clouds;
  final WindEntity wind;
  final int? visibility;
  final double? pop;
  final RainEntity? rain;
  final ForecastSysEntity sys;
  final String dtTxt;

  ForecastItemEntity({
    required this.dt,
    required this.main,
    required this.weather,
    required this.clouds,
    required this.wind,
    required this.visibility,
    required this.pop,
    this.rain,
    required this.sys,
    required this.dtTxt,
  });
}