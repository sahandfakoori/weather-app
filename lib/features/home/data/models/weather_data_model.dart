import 'package:hive/hive.dart';
import 'package:weather_app/features/home/data/models/current_weather_model.dart';
import 'package:weather_app/features/home/data/models/forecast_weather_model.dart';
part 'weather_data_model.g.dart';

@HiveType(typeId: 50)
class WeatherDataModel extends HiveObject {
  @HiveField(0)
  final CurrentWeatherModel? current;

  @HiveField(1)
  final ForecastWeatherModel? forecast;

  @HiveField(2)
  final bool? isFavourite;

  WeatherDataModel({
    this.current,
    this.forecast,
    this.isFavourite,
  });

  WeatherDataModel copyWith({
    CurrentWeatherModel? current,
    ForecastWeatherModel? forecast,
  }) {
    return WeatherDataModel(
      current: current ?? this.current,
      forecast: forecast ?? this.forecast,
    );
  }

}
