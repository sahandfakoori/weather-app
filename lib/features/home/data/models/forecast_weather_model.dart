import 'package:intl/intl.dart';

class ForecastWeatherModel {
  final int cod;
  final int message;
  final int cnt;
  final List<ForecastItemModel> list;
  final CityModel city;

  ForecastWeatherModel({
    required this.cod,
    required this.message,
    required this.cnt,
    required this.list,
    required this.city,
  });

  factory ForecastWeatherModel.fromJson(Map<String, dynamic> json) {
    return ForecastWeatherModel(
      cod: json['cod'] is String
          ? int.parse(json['cod'])
          : json['cod'],
      message: json['message'],
      cnt: json['cnt'],
      list: (json['list'] as List)
          .map((e) => ForecastItemModel.fromJson(e))
          .toList(),
      city: CityModel.fromJson(json['city']),
    );
  }
}


class ForecastItemModel {
  final int dt;
  final MainModel main;
  final List<WeatherModel> weather;
  final CloudsModel clouds;
  final WindModel wind;
  final int? visibility;
  final double? pop;
  final RainModel? rain;
  final SysModel sys;
  final String dtTxt;

  ForecastItemModel({
    required this.dt,
    required this.main,
    required this.weather,
    required this.clouds,
    required this.wind,
    required this.visibility,
    required this.pop,
    this.rain,
    required this.sys,
    required this.dtTxt,
  });

  factory ForecastItemModel.fromJson(Map<String, dynamic> json) {
    return ForecastItemModel(
      dt: json['dt'],
      main: MainModel.fromJson(json['main']),
      weather: (json['weather'] as List)
          .map((e) => WeatherModel.fromJson(e))
          .toList(),
      clouds: CloudsModel.fromJson(json['clouds']),
      wind: WindModel.fromJson(json['wind']),
      visibility: json['visibility'],
      pop: (json['pop'] as num).toDouble(),
      rain: json['rain'] != null ? RainModel.fromJson(json['rain']) : null,
      sys: SysModel.fromJson(json['sys']),
      dtTxt: json['dt_txt'],
    );
  }



  String get formattedTime {
    final date = DateTime.fromMillisecondsSinceEpoch(dt * 1000, isUtc: true).toLocal();
    return DateFormat('HH:mm').format(date);
  }

}


class MainModel {
  final double temp;
  final double feelsLike;
  final double tempMin;
  final double tempMax;
  final int pressure;
  final int humidity;

  MainModel({
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.humidity,
  });

  factory MainModel.fromJson(Map<String, dynamic> json) {
    return MainModel(
      temp: (json['temp'] as num).toDouble(),
      feelsLike: (json['feels_like'] as num).toDouble(),
      tempMin: (json['temp_min'] as num).toDouble(),
      tempMax: (json['temp_max'] as num).toDouble(),
      pressure: json['pressure'],
      humidity: json['humidity'],
    );
  }
}



class WeatherModel {
  final int id;
  final String main;
  final String description;
  final String icon;

  WeatherModel({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      id: json['id'],
      main: json['main'],
      description: json['description'],
      icon: json['icon'],
    );
  }
}

class CloudsModel {
  final int all;

  CloudsModel({required this.all});

  factory CloudsModel.fromJson(Map<String, dynamic> json) {
    return CloudsModel(all: json['all']);
  }
}


class WindModel {
  final double speed;
  final int deg;
  final double? gust;

  WindModel({
    required this.speed,
    required this.deg,
    this.gust,
  });

  factory WindModel.fromJson(Map<String, dynamic> json) {
    return WindModel(
      speed: (json['speed'] as num).toDouble(),
      deg: json['deg'],
      gust: json['gust'] != null ? (json['gust'] as num).toDouble() : null,
    );
  }
}


class RainModel {
  final double oneHour;

  RainModel({required this.oneHour});

  factory RainModel.fromJson(Map<String, dynamic> json) {
    return RainModel(
      oneHour: (json['1h'] ?? 0).toDouble(),
    );
  }
}


class SysModel {
  final String pod;

  SysModel({required this.pod});

  factory SysModel.fromJson(Map<String, dynamic> json) {
    return SysModel(pod: json['pod']);
  }
}


class CityModel {
  final int id;
  final String name;
  final CoordModel coord;
  final String country;
  final int? population;
  final int timezone;
  final int? sunrise;
  final int? sunset;

  CityModel({
    required this.id,
    required this.name,
    required this.coord,
    required this.country,
    required this.population,
    required this.timezone,
    required this.sunrise,
    required this.sunset,
  });

  factory CityModel.fromJson(Map<String, dynamic> json) {
    return CityModel(
      id: json['id'],
      name: json['name'],
      coord: CoordModel.fromJson(json['coord']),
      country: json['country'],
      population: json['population'],
      timezone: json['timezone'],
      sunrise: json['sunrise'],
      sunset: json['sunset'],
    );
  }
}

class CoordModel {
  final double lat;
  final double lon;

  CoordModel({
    required this.lat,
    required this.lon,
  });

  factory CoordModel.fromJson(Map<String, dynamic> json) {
    return CoordModel(
      lat: (json['lat'] as num).toDouble(),
      lon: (json['lon'] as num).toDouble(),
    );
  }
}

