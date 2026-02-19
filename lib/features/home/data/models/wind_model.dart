import 'package:hive/hive.dart';

part 'wind_model.g.dart';

@HiveType(typeId: 4)
class WindModel {
  @HiveField(0)
  final double speed;
  @HiveField(1)
  final int? deg;
  @HiveField(2)
  final double? gust;

  WindModel({required this.speed, this.deg, this.gust});

  factory WindModel.fromJson(Map<String, dynamic> json) => WindModel(
    speed: (json['speed'] as num).toDouble(),
    deg: json['deg'],
    gust: json['gust'] != null ? (json['gust'] as num).toDouble() : null,
  );
}
