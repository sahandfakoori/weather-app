import 'package:weather_app/features/home/data/mapper/city_mapper.dart';
import 'package:weather_app/features/home/data/mapper/forecast_item_mapper.dart';
import 'package:weather_app/features/home/data/models/forecast_weather_model.dart';
import 'package:weather_app/features/home/domain/entities/forecast_weather_entity.dart';

extension ForecastModel on ForecastWeatherModel {
  ForecastWeatherEntity toEntity() {
    return ForecastWeatherEntity(
      cod: cod,
      message: message,
      cnt: cnt,
      list: list.map((e) => e.toEntity()).toList(),
      city: city.toEntity(),
    );
  }
}
