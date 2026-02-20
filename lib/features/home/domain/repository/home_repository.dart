import 'package:weather_app/core/resources/data_state.dart';
import 'package:weather_app/features/home/data/models/suggest_city_model.dart';
import 'package:weather_app/features/home/domain/entities/current_weather_entity.dart';
import 'package:weather_app/features/home/domain/entities/forecast_weather_entity.dart';
import 'package:weather_app/features/home/domain/entities/weather_data_entity.dart';

abstract class HomeRepository {
  Future<DataState<CurrentWeatherEntity>> getCurrentWeather(String city);

  Future<DataState<ForecastWeatherEntity>> getForecastWeather(String city);

  Future<List<Data>> getSuggestPlace(String prefix);

  Future<List<WeatherDataEntity>> getSavedCities();

  Future<DataState<CurrentWeatherEntity>> getWeatherCurrentLocation(
    double lat,
    double lon,
  );

  Future<DataState<ForecastWeatherEntity>> getForecastCurrentLocation(
    double lat,
    double lon,
  );

}
