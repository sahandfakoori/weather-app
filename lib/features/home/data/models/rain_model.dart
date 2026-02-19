import 'package:hive/hive.dart';

part 'rain_model.g.dart';


@HiveType(typeId: 5)
class RainModel {
  @HiveField(0)
  final double h1;

  RainModel({required this.h1});

  factory RainModel.fromJson(Map<String, dynamic> json) =>
      RainModel(
        h1: (json['1h'] as num).toDouble(),
      );

  Map<String, dynamic> toJson() =>
      {
        '1h': h1,
      };
}
