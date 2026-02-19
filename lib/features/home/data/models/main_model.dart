import 'package:hive/hive.dart';

part 'main_model.g.dart';

@HiveType(typeId: 3)
class MainModel {
  @HiveField(0)
  final double temp;
  @HiveField(1)
  final double feelsLike;
  @HiveField(2)
  final double tempMin;
  @HiveField(3)
  final double tempMax;
  @HiveField(4)
  final int pressure;
  @HiveField(5)
  final int humidity;
  @HiveField(6)
  final int? seaLevel;
  @HiveField(7)
  final int? grndLevel;

  MainModel({
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.humidity,
    this.seaLevel,
    this.grndLevel,
  });

  factory MainModel.fromJson(Map<String, dynamic> json) => MainModel(
    temp: (json['temp'] as num).toDouble(),
    feelsLike: (json['feels_like'] as num).toDouble(),
    tempMin: (json['temp_min'] as num).toDouble(),
    tempMax: (json['temp_max'] as num).toDouble(),
    pressure: json['pressure'],
    humidity: json['humidity'],
    seaLevel: json['sea_level'],
    grndLevel: json['grnd_level'],
  );
}
