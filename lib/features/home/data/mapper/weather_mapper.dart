
import 'package:weather_app/features/home/data/models/weather_model.dart';
import 'package:weather_app/features/home/domain/entities/weather_entity.dart';

extension WeatherMapper on WeatherModel {
  WeatherEntity toEntity() {
    return WeatherEntity(
      id: id,
      main: main,
      description: description,
      icon: icon,
    );
  }
}