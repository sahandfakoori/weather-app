import 'package:hive/hive.dart';

part 'clouds_model.g.dart';



@HiveType(typeId: 6)
class CloudsModel {
  @HiveField(0)
  final int all;

  CloudsModel({required this.all});

  factory CloudsModel.fromJson(Map<String, dynamic> json) =>
      CloudsModel(
        all: json['all'],
      );

  Map<String, dynamic> toJson() =>
      {
        'all': all,
      };
}
