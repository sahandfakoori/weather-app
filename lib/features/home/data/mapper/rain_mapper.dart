import 'package:weather_app/features/home/data/models/rain_model.dart';
import 'package:weather_app/features/home/domain/entities/rain_entity.dart';

extension RainMapper on RainModel{
  RainEntity toEntity(){
    return RainEntity(h1: h1);
  }
}
