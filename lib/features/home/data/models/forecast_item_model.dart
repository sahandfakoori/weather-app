import 'package:hive/hive.dart';
import 'package:weather_app/features/home/data/models/clouds_model.dart';
import 'package:weather_app/features/home/data/models/forecast_sys_model.dart';
import 'package:weather_app/features/home/data/models/main_model.dart';
import 'package:weather_app/features/home/data/models/rain_model.dart';
import 'package:weather_app/features/home/data/models/weather_model.dart';
import 'package:weather_app/features/home/data/models/wind_model.dart';

part 'forecast_item_model.g.dart';

@HiveType(typeId: 21)
class ForecastItemModel {
  @HiveField(0)
  final int dt;
  @HiveField(1)
  final MainModel main;
  @HiveField(2)
  final List<WeatherModel> weather;
  @HiveField(3)
  final CloudsModel clouds;
  @HiveField(4)
  final WindModel wind;
  @HiveField(5)
  final int? visibility;
  @HiveField(6)
  final double? pop;
  @HiveField(7)
  final RainModel? rain;
  @HiveField(8)
  final ForecastSysModel sys;
  @HiveField(9)
  final String dtTxt;

  ForecastItemModel({
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

  factory ForecastItemModel.fromJson(Map<String, dynamic> json) {
    return ForecastItemModel(
      dt: json['dt'],
      main: MainModel.fromJson(json['main']),
      weather: (json['weather'] as List? ?? [])
          .map((e) => WeatherModel.fromJson(e))
          .toList(),
      clouds: CloudsModel.fromJson(json['clouds']),
      wind: WindModel.fromJson(json['wind']),
      visibility: json['visibility'],
      pop: (json['pop'] as num?)?.toDouble() ?? 0.0,
      rain: json['rain'] != null ? RainModel.fromJson(json['rain']) : null,
      sys: ForecastSysModel.fromJson(json['sys']),
      dtTxt: json['dt_txt'],
    );
  }
}
