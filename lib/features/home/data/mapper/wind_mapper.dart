import 'package:weather_app/features/home/data/models/wind_model.dart';
import 'package:weather_app/features/home/domain/entities/wind_entity.dart';

extension WindMapper on WindModel{
  WindEntity toEntity(){
    return WindEntity(speed: speed);
  }
}
