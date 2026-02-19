import 'package:weather_app/features/home/data/mapper/coord_mapper.dart';
import 'package:weather_app/features/home/data/models/city_model.dart';
import 'package:weather_app/features/home/domain/entities/city_entity.dart';

extension CityMapper on CityModel {
  CityEntity toEntity() {
    return CityEntity(
      id: id,
      name: name,
      coord: coord.toEntity(),
      country: country,
      population: population,
      timezone: timezone,
      sunrise: sunrise,
      sunset: sunset,
    );
  }
}
