import 'package:weather_app/features/home/data/models/current_sys_model.dart';
import 'package:weather_app/features/home/domain/entities/sys_entity.dart';

extension SysMapper on CurrentSysModel{
  SysEntity toEntity(){
    return SysEntity(country: country, sunrise: sunrise, sunset: sunset);
  }
}
