import 'package:hive/hive.dart';

part 'weather_model.g.dart';

@HiveType(typeId: 2)
class WeatherModel {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String main;
  @HiveField(2)
  final String description;
  @HiveField(3)
  final String icon;

  WeatherModel({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) => WeatherModel(
    id: json['id'],
    main: json['main'],
    description: json['description'],
    icon: json['icon'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'main': main,
    'description': description,
    'icon': icon,
  };
}
