import 'package:hive/hive.dart';
import 'package:weather_app/features/home/data/models/city_model.dart';
import 'package:weather_app/features/home/data/models/forecast_item_model.dart';

part 'forecast_weather_model.g.dart';

@HiveType(typeId: 20)
class ForecastWeatherModel extends HiveObject {
  @HiveField(0)
  final int cod;
  @HiveField(1)
  final int message;
  @HiveField(2)
  final int cnt;
  @HiveField(3)
  final List<ForecastItemModel> list;
  @HiveField(4)
  final CityModel city;

  ForecastWeatherModel({
    required this.cod,
    required this.message,
    required this.cnt,
    required this.list,
    required this.city,
  });

  factory ForecastWeatherModel.fromJson(Map<String, dynamic> json) {
    return ForecastWeatherModel(
      cod: json['cod'] is String ? int.parse(json['cod']) : json['cod'],
      message: json['message'],
      cnt: json['cnt'],
      list: (json['list'] as List)
          .map((e) => ForecastItemModel.fromJson(e))
          .toList(),
      city: CityModel.fromJson(json['city']),
    );
  }
}

// class MainModel {
//   final double temp;
//   final double feelsLike;
//   final double tempMin;
//   final double tempMax;
//   final int pressure;
//   final int humidity;
//
//   MainModel({
//     required this.temp,
//     required this.feelsLike,
//     required this.tempMin,
//     required this.tempMax,
//     required this.pressure,
//     required this.humidity,
//   });
//
//   factory MainModel.fromJson(Map<String, dynamic> json) {
//     return MainModel(
//       temp: (json['temp'] as num).toDouble(),
//       feelsLike: (json['feels_like'] as num).toDouble(),
//       tempMin: (json['temp_min'] as num).toDouble(),
//       tempMax: (json['temp_max'] as num).toDouble(),
//       pressure: json['pressure'],
//       humidity: json['humidity'],
//     );
//   }
// } //
// class WeatherModel {
//   final int id;
//   final String main;
//   final String description;
//   final String icon;
//
//   WeatherModel({
//     required this.id,
//     required this.main,
//     required this.description,
//     required this.icon,
//   });
//
//   factory WeatherModel.fromJson(Map<String, dynamic> json) {
//     return WeatherModel(
//       id: json['id'],
//       main: json['main'],
//       description: json['description'],
//       icon: json['icon'],
//     );
//   }
// } //
// class CloudsModel {
//   final int all;
//
//   CloudsModel({required this.all});
//
//   factory CloudsModel.fromJson(Map<String, dynamic> json) {
//     return CloudsModel(all: json['all']);
//   }
// } //
// class WindModel {
//   final double speed;
//   final int deg;
//   final double? gust;
//
//   WindModel({
//     required this.speed,
//     required this.deg,
//     this.gust,
//   });
//
//   factory WindModel.fromJson(Map<String, dynamic> json) {
//     return WindModel(
//       speed: (json['speed'] as num).toDouble(),
//       deg: json['deg'],
//       gust: json['gust'] != null ? (json['gust'] as num).toDouble() : null,
//     );
//   }
// } //
// class RainModel {
//   final double oneHour;
//
//   RainModel({required this.oneHour});
//
//   factory RainModel.fromJson(Map<String, dynamic> json) {
//     return RainModel(
//       oneHour: (json['1h'] ?? 0).toDouble(),
//     );
//   }
// } //
// class CoordModel {
//   final double lat;
//   final double lon;
//
//   CoordModel({
//     required this.lat,
//     required this.lon,
//   });
//
//   factory CoordModel.fromJson(Map<String, dynamic> json) {
//     return CoordModel(
//       lat: (json['lat'] as num).toDouble(),
//       lon: (json['lon'] as num).toDouble(),
//     );
//   }
// } //
