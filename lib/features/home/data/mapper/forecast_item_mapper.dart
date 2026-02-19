import 'package:weather_app/features/home/data/mapper/clouds_mapper.dart';
import 'package:weather_app/features/home/data/mapper/forecast_sys_mapper.dart';
import 'package:weather_app/features/home/data/mapper/main_mapper.dart';
import 'package:weather_app/features/home/data/mapper/weather_mapper.dart';
import 'package:weather_app/features/home/data/mapper/wind_mapper.dart';
import 'package:weather_app/features/home/data/models/forecast_item_model.dart';
import 'package:weather_app/features/home/domain/entities/forecast_item_entity.dart';

extension ForecastItemMapper on ForecastItemModel {
  ForecastItemEntity toEntity() {
    return ForecastItemEntity(
      dt: dt,
      main: main.toEntity(),
      weather: weather.map((e) => e.toEntity()).toList(),
      clouds: clouds.toEntity(),
      wind: wind.toEntity(),
      visibility: visibility,
      pop: pop,
      sys: sys.toEntity(),
      dtTxt: dtTxt,
    );
  }
}
