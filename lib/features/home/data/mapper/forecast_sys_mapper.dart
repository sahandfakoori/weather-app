import 'package:weather_app/features/home/data/models/forecast_sys_model.dart';
import 'package:weather_app/features/home/domain/entities/forecast_sys_entity.dart';

extension ForecastSysMapper on ForecastSysModel{
  ForecastSysEntity toEntity(){
    return ForecastSysEntity(pod: pod);
  }
}
