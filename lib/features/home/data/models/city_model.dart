import 'package:hive/hive.dart';
import 'package:weather_app/features/home/data/models/coord_model.dart';

part 'city_model.g.dart';

@HiveType(typeId: 22)
class CityModel {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final CoordModel coord;
  @HiveField(3)
  final String country;
  @HiveField(4)
  final int? population;
  @HiveField(5)
  final int timezone;
  @HiveField(6)
  final int? sunrise;
  @HiveField(7)
  final int? sunset;

  CityModel({
    required this.id,
    required this.name,
    required this.coord,
    required this.country,
    required this.population,
    required this.timezone,
    required this.sunrise,
    required this.sunset,
  });

  factory CityModel.fromJson(Map<String, dynamic> json) {
    return CityModel(
      id: json['id'],
      name: json['name'],
      coord: CoordModel.fromJson(json['coord']),
      country: json['country'],
      population: json['population'],
      timezone: json['timezone'],
      sunrise: json['sunrise'],
      sunset: json['sunset'],
    );
  }
}
