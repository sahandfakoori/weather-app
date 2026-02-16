
import 'package:weather_app/features/home/data/models/suggest_city_model.dart';
import 'package:weather_app/features/home/domain/entities/suggest_city_entity.dart';

extension SuggestModelMapper on SuggestCityModel {
  SuggestCityEntity toEntity() {
    return SuggestCityEntity(
      data: data,
      metadata: metadata,
    );
  }
}