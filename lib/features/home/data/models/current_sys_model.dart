import 'package:hive/hive.dart';

part 'current_sys_model.g.dart';

@HiveType(typeId: 7)
class CurrentSysModel {
  @HiveField(0)
  final int? type;
  @HiveField(1)
  final int? id;
  @HiveField(2)
  final String country;
  @HiveField(3)
  final int sunrise;
  @HiveField(4)
  final int sunset;

  CurrentSysModel({
    this.type,
    this.id,
    required this.country,
    required this.sunrise,
    required this.sunset,
  });

  factory CurrentSysModel.fromJson(Map<String, dynamic> json) =>
      CurrentSysModel(
        type: json['type'],
        id: json['id'],
        country: json['country'],
        sunrise: json['sunrise'],
        sunset: json['sunset'],
      );
}
