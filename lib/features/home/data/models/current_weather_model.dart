import 'package:hive/hive.dart';
import 'package:weather_app/features/home/data/models/clouds_model.dart';
import 'package:weather_app/features/home/data/models/coord_model.dart';
import 'package:weather_app/features/home/data/models/current_sys_model.dart';
import 'package:weather_app/features/home/data/models/rain_model.dart';
import 'package:weather_app/features/home/data/models/weather_model.dart';
import 'package:weather_app/features/home/data/models/wind_model.dart';
import 'package:weather_app/features/home/data/models/main_model.dart';


part 'current_weather_model.g.dart';

@HiveType(typeId: 0)
class CurrentWeatherModel extends HiveObject {
  @HiveField(0)
  final CoordModel coord;
  @HiveField(1)
  final List<WeatherModel> weather;
  @HiveField(2)
  final String base;
  @HiveField(3)
  final MainModel main;
  @HiveField(4)
  final int visibility;
  @HiveField(5)
  final WindModel wind;
  @HiveField(6)
  final RainModel? rain;
  @HiveField(7)
  final CloudsModel clouds;
  @HiveField(8)
  final int dt;
  @HiveField(9)
  final CurrentSysModel sys;
  @HiveField(10)
  final int timezone;
  @HiveField(11)
  final int id;
  @HiveField(12)
  final String name;
  @HiveField(13)
  final int cod;

  CurrentWeatherModel({
    required this.coord,
    required this.weather,
    required this.base,
    required this.main,
    required this.visibility,
    required this.wind,
    this.rain,
    required this.clouds,
    required this.dt,
    required this.sys,
    required this.timezone,
    required this.id,
    required this.name,
    required this.cod,
  });


  factory CurrentWeatherModel.fromJson(Map<String, dynamic> json) => CurrentWeatherModel(
    coord: CoordModel.fromJson(json['coord']),
    weather: List<WeatherModel>.from(json['weather'].map((x) => WeatherModel.fromJson(x))),
    base: json['base'],
    main: MainModel.fromJson(json['main']),
    visibility: json['visibility'],
    wind: WindModel.fromJson(json['wind']),
    rain: json['rain'] != null ? RainModel.fromJson(json['rain']) : null,
    clouds: CloudsModel.fromJson(json['clouds']),
    dt: json['dt'],
    sys: CurrentSysModel.fromJson(json['sys']),
    timezone: json['timezone'],
    id: json['id'],
    name: json['name'],
    cod: json['cod'],
  );

  // Map<String, dynamic> toJson() =>
  //     {
  //       'coord': coord.toJson(),
  //       'weather': List<dynamic>.from(weather.map((x) => x.toJson())),
  //       'base': base,
  //       'main': main.toJson(),
  //       'visibility': visibility,
  //       'wind': wind.toJson(),
  //       if (rain != null) 'rain': rain!.toJson(),
  //       'clouds': clouds.toJson(),
  //       'dt': dt,
  //       'sys': sys.toJson(),
  //       'timezone': timezone,
  //       'id': id,
  //       'name': name,
  //       'cod': cod,
  //     };
}

