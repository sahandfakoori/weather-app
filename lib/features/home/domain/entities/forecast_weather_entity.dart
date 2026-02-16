import 'package:weather_app/features/home/data/models/forecast_weather_model.dart';

class ForecastWeatherEntity {
  final int cod;
  final int message;
  final int cnt;
  final List<ForecastItemModel> list;
  final CityModel city;

  ForecastWeatherEntity({
    required this.cod,
    required this.message,
    required this.cnt,
    required this.list,
    required this.city,
  });
}