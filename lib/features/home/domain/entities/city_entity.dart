import 'package:weather_app/features/home/domain/entities/coord_entity.dart';

class CityEntity {
  final int id;
  final String name;
  final CoordEntity coord;
  final String country;
  final int? population;
  final int timezone;
  final int? sunrise;
  final int? sunset;

  CityEntity({
    required this.id,
    required this.name,
    required this.coord,
    required this.country,
    required this.population,
    required this.timezone,
    required this.sunrise,
    required this.sunset,
  });
}