import 'dart:async';
import 'package:hive/hive.dart';
import 'package:weather_app/features/home/data/datasource/datasource.dart';
import 'package:weather_app/features/home/data/models/current_weather_model.dart';
import 'package:weather_app/features/home/data/models/forecast_weather_model.dart';
import 'package:weather_app/features/home/data/models/suggest_city_model.dart';

class DatasourceLocalImpl extends Datasource {
  @override
  Future<ForecastWeatherModel> getCurrentForecast(String city) async {
    try {
      final box = Hive.box<ForecastWeatherModel>('weather');
      return box.get(city)!;
    } catch (e) {
      throw Exception('error can not get current_weather');
    }
  }

  @override
  Future<CurrentWeatherModel> getCurrentWeather(String city) async {
    try {
      final box = Hive.box<CurrentWeatherModel>('weather');
      return box.get(city)!;
    } catch (e) {
      throw Exception('error can not get current_weather');
    }
  }

  @override
  Future<SuggestCityModel> getSuggestPlace(String prefix) {
    return throw Exception('turn on your internet');
  }

  @override
  Future<ForecastWeatherModel> getForecastCurrentLocation(
    double lat,
    double lon,
  ) {
    // TODO: implement getForecastCurrentLocation
    throw UnimplementedError();
  }

  @override
  Future<CurrentWeatherModel> getWeatherCurrentLocation(
    double lat,
    double lon,
  )  {
    // TODO: implement getWeatherCurrentLocation
    throw UnimplementedError();
  }
}
