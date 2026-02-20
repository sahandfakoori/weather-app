import 'package:weather_app/features/home/data/mapper/current_weather_mapper.dart';
import 'package:weather_app/features/home/data/mapper/forecast_mapper.dart';
import 'package:weather_app/features/home/data/models/weather_data_model.dart';
import 'package:weather_app/features/home/domain/entities/weather_data_entity.dart';


extension WeatherDataMapper on WeatherDataModel {
  WeatherDataEntity toEntity() {
    return WeatherDataEntity(
      current: current?.toEntity(),
      forecast: forecast?.toEntity(),
      isFavourite: isFavourite,
    );
  }
}
