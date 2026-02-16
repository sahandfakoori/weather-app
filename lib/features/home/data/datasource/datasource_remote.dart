import 'package:weather_app/features/home/data/models/current_weather.dart';
import 'package:weather_app/features/home/data/models/forecast_weather_model.dart';
import 'package:weather_app/features/home/data/models/suggest_city_model.dart';

abstract class DatasourceRemote {
  Future<CurrentWeatherModel> getCurrentWeather(String city);
  Future<ForecastWeatherModel> getCurrentForecast(String city);
  Future<SuggestCityModel> getSuggestPlace(String prefix);
}