import 'package:hive/hive.dart';

part 'forecast_sys_model.g.dart';

@HiveType(typeId: 10)
class ForecastSysModel {
  @HiveField(0)
  final String pod;

  ForecastSysModel({required this.pod});

  factory ForecastSysModel.fromJson(Map<String, dynamic> json) {
    return ForecastSysModel(pod: json['pod']);
  }
}
