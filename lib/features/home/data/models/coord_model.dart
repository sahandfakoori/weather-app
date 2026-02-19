import 'package:hive/hive.dart';

part 'coord_model.g.dart';

@HiveType(typeId: 1)
class CoordModel {
  @HiveField(0)
  final double lon;
  @HiveField(1)
  final double lat;

  CoordModel({required this.lon, required this.lat});

  factory CoordModel.fromJson(Map<String, dynamic> json) =>
      CoordModel(lon: json['lon'].toDouble(), lat: json['lat'].toDouble());

  Map<String, dynamic> toJson() => {'lon': lon, 'lat': lat};
}
