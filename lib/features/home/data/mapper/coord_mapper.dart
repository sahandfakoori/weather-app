import 'package:weather_app/features/home/data/models/coord_model.dart';
import 'package:weather_app/features/home/domain/entities/coord_entity.dart';

extension CoordMapper on CoordModel {
  CoordEntity toEntity() {
    return CoordEntity(lon: lon, lat: lat);
  }
}
