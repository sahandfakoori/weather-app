import 'package:weather_app/features/home/data/models/main_model.dart';
import 'package:weather_app/features/home/domain/entities/main_entity.dart';

extension MainMapper on MainModel {
  MainEntity toEntity() {
    return MainEntity(
      temp: temp,
      feelsLike: feelsLike,
      tempMin: tempMin,
      tempMax: tempMax,
      pressure: pressure,
      humidity: humidity,
    );
  }
}
