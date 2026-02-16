import 'package:weather_app/core/resources/data_state.dart';
import 'package:weather_app/features/home/data/datasource/datasource_remote.dart';
import 'package:weather_app/features/home/data/mapper/forecast_mapper.dart';
import 'package:weather_app/features/home/data/mapper/suggest_mapper.dart';
import 'package:weather_app/features/home/data/mapper/weather_mapper.dart';
import 'package:weather_app/features/home/data/models/suggest_city_model.dart';
import 'package:weather_app/features/home/domain/entities/current_weather_entity.dart';
import 'package:weather_app/features/home/domain/entities/forecast_weather_entity.dart';
import 'package:weather_app/features/home/domain/repository/home_repository.dart';

class HomeRepositoryImpl extends HomeRepository {
  final DatasourceRemote datasourceRemote;
    HomeRepositoryImpl(this.datasourceRemote);

  @override
  Future<DataState<CurrentWeatherEntity>> getCurrentWeather(String city) async {
    try {
      final model = await datasourceRemote.getCurrentWeather(city);
      final entity = model.toEntity();
      return DataSuccess(entity);

    } catch (e) {
      return DataFailed('خطا در دریافت پیش‌بینی');
    }
  }

  @override
  Future<DataState<ForecastWeatherEntity>> getForecastWeather(
    String city,
  ) async {
    try {
      final model = await datasourceRemote.getCurrentForecast(city);
      final entity = model.toEntity();
      return DataSuccess(entity);
    } catch (e) {
      return DataFailed('خطا در دریافت پیش‌بینی');
    }
  }

  @override
  Future<List<Data>> getSuggestPlace(String prefix) async {
    final model = await datasourceRemote.getSuggestPlace(prefix);
    final entity = model.toEntity();
    return entity.data ?? [];
  }
}
