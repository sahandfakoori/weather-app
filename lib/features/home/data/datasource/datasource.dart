import 'dart:async';
import 'package:weather_app/features/home/data/models/current_weather_model.dart';
import 'package:weather_app/features/home/data/models/forecast_weather_model.dart';
import 'package:weather_app/features/home/data/models/suggest_city_model.dart';

abstract class Datasource {
  Future<CurrentWeatherModel> getCurrentWeather(String city);
  Future<ForecastWeatherModel> getCurrentForecast(String city);
  Future<SuggestCityModel> getSuggestPlace(String prefix);
  Future<CurrentWeatherModel> getWeatherCurrentLocation(double lat , double lon);
  Future<ForecastWeatherModel> getForecastCurrentLocation(double lat , double lon);
}