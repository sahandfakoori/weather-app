import 'package:weather_app/features/home/data/models/forecast_weather_model.dart';
import 'package:weather_app/features/home/domain/entities/forecast_weather_entity.dart';

extension ForecastModel on ForecastWeatherModel {
  ForecastWeatherEntity toEntity() {
    return ForecastWeatherEntity(
      cod: cod,
      message: message,
      cnt: cnt,
      list: list,
      city: city,
    );
  }
}
