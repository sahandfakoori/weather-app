import 'package:weather_app/features/home/domain/entities/city_entity.dart';
import 'package:weather_app/features/home/domain/entities/forecast_item_entity.dart';

class ForecastWeatherEntity {
  final int cod;
  final int message;
  final int cnt;
  final List<ForecastItemEntity> list;
  final CityEntity city;

  ForecastWeatherEntity({
    required this.cod,
    required this.message,
    required this.cnt,
    required this.list,
    required this.city,
  });
}