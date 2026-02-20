import 'current_weather_entity.dart';
import 'forecast_weather_entity.dart';

class WeatherDataEntity {
  final CurrentWeatherEntity? current;
  final ForecastWeatherEntity? forecast;
  final bool? isFavourite;

  WeatherDataEntity({
    this.current,
    this.forecast,
    this.isFavourite,
  });
}
