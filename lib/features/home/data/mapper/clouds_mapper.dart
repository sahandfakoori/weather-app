import 'package:weather_app/features/home/data/models/clouds_model.dart';
import 'package:weather_app/features/home/domain/entities/clouds_entity.dart';

extension CloudsMapper on CloudsModel{
  CloudsEntity toEntity(){
    return CloudsEntity(all: all);
  }
}
