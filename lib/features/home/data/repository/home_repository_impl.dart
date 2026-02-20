import 'package:hive/hive.dart';
import 'package:weather_app/core/resources/data_state.dart';
import 'package:weather_app/features/home/data/datasource/datasource.dart';
import 'package:weather_app/features/home/data/mapper/current_weather_mapper.dart';
import 'package:weather_app/features/home/data/mapper/forecast_mapper.dart';
import 'package:weather_app/features/home/data/mapper/weather_data_mapper.dart';
import 'package:weather_app/features/home/data/models/suggest_city_model.dart';
import 'package:weather_app/features/home/data/models/weather_data_model.dart';
import 'package:weather_app/features/home/domain/entities/current_weather_entity.dart';
import 'package:weather_app/features/home/domain/entities/forecast_weather_entity.dart';
import 'package:weather_app/features/home/domain/entities/weather_data_entity.dart';
import 'package:weather_app/features/home/domain/repository/home_repository.dart';

class HomeRepositoryImpl extends HomeRepository {
  final Datasource datasourceRemote;

  HomeRepositoryImpl(this.datasourceRemote);

  @override
  Future<DataState<CurrentWeatherEntity>> getCurrentWeather(String city) async {
    final box = Hive.box<WeatherDataModel>('weather');
    try {
      final model = await datasourceRemote.getCurrentWeather(city);

      final old = box.get(city);
      final newData = (old ?? WeatherDataModel()).copyWith(current: model);
      await box.put(city, newData);

      return DataSuccess(model.toEntity());
    } catch (e) {
      final cache = box.get(city);

      if (cache?.current != null) {
        return DataSuccess(cache!.current!.toEntity());
      }
      return DataFailed('خطا در دریافت پیش‌بینی');
    }
  }

  @override
  Future<DataState<ForecastWeatherEntity>> getForecastWeather(
    String city,
  ) async {
    final box = Hive.box<WeatherDataModel>('weather');
    try {
      final model = await datasourceRemote.getCurrentForecast(city);

      final old = box.get(city);

      final newData = (old ?? WeatherDataModel()).copyWith(forecast: model);

      await box.put(city, newData);

      return DataSuccess(model.toEntity());
    } catch (e) {
      final cache = box.get(city);

      if (cache?.forecast != null) {
        return DataSuccess(cache!.forecast!.toEntity());
      }
      return DataFailed('خطا در دریافت پیش‌بینی');
    }
  }

  @override
  Future<List<Data>> getSuggestPlace(String prefix) async {
    final model = await datasourceRemote.getSuggestPlace(prefix);
    return model.data ?? [];
  }

  @override
  Future<List<WeatherDataEntity>> getSavedCities() async {
    final box = Hive.box<WeatherDataModel>('weather');

    final models = box.values.toList();

    return models.map((e) => e.toEntity()).toList();
  }

  @override
  Future<DataState<ForecastWeatherEntity>> getForecastCurrentLocation(
    double lat,
    double lon,
  ) async {
    final model = await datasourceRemote.getForecastCurrentLocation(lat, lon);
    return DataSuccess(model.toEntity());
  }

  @override
  Future<DataState<CurrentWeatherEntity>> getWeatherCurrentLocation(
    double lat,
    double lon,
  ) async {
    final model = await datasourceRemote.getWeatherCurrentLocation(lat, lon);
    return DataSuccess(model.toEntity());
  }
}
