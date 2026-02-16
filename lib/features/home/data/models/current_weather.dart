class CurrentWeatherModel {
  final Coord coord;
  final List<Weather> weather;
  final String base;
  final Main main;
  final int visibility;
  final Wind wind;
  final Rain? rain;
  final Clouds clouds;
  final int dt;
  final Sys sys;
  final int timezone;
  final int id;
  final String name;
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
    coord: Coord.fromJson(json['coord']),
    weather: List<Weather>.from(json['weather'].map((x) => Weather.fromJson(x))),
    base: json['base'],
    main: Main.fromJson(json['main']),
    visibility: json['visibility'],
    wind: Wind.fromJson(json['wind']),
    rain: json['rain'] != null ? Rain.fromJson(json['rain']) : null,
    clouds: Clouds.fromJson(json['clouds']),
    dt: json['dt'],
    sys: Sys.fromJson(json['sys']),
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

class Coord {
  final double lon;
  final double lat;

  Coord({required this.lon, required this.lat});

  factory Coord.fromJson(Map<String, dynamic> json) =>
      Coord(
        lon: json['lon'].toDouble(),
        lat: json['lat'].toDouble(),
      );

  Map<String, dynamic> toJson() =>
      {
        'lon': lon,
        'lat': lat,
      };
}

class Weather {
  final int id;
  final String main;
  final String description;
  final String icon;

  Weather({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });

  factory Weather.fromJson(Map<String, dynamic> json) =>
      Weather(
        id: json['id'],
        main: json['main'],
        description: json['description'],
        icon: json['icon'],
      );

  Map<String, dynamic> toJson() =>
      {
        'id': id,
        'main': main,
        'description': description,
        'icon': icon,
      };
}
class Main {
  final double temp;
  final double feelsLike;
  final double tempMin;
  final double tempMax;
  final int pressure;
  final int humidity;
  final int? seaLevel;
  final int? grndLevel;

  Main({
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.humidity,
    this.seaLevel,
    this.grndLevel,
  });

  factory Main.fromJson(Map<String, dynamic> json) => Main(
    temp: (json['temp'] as num).toDouble(),
    feelsLike: (json['feels_like'] as num).toDouble(),
    tempMin: (json['temp_min'] as num).toDouble(),
    tempMax: (json['temp_max'] as num).toDouble(),
    pressure: json['pressure'],
    humidity: json['humidity'],
    seaLevel: json['sea_level'],
    grndLevel: json['grnd_level'],
  );
}


class Wind {
  final double speed;
  final int? deg;
  final double? gust;

  Wind({
    required this.speed,
    this.deg,
    this.gust,
  });

  factory Wind.fromJson(Map<String, dynamic> json) => Wind(
    speed: (json['speed'] as num).toDouble(),
    deg: json['deg'],
    gust: json['gust'] != null
        ? (json['gust'] as num).toDouble()
        : null,
  );
}



class Rain {
  final double h1;

  Rain({required this.h1});

  factory Rain.fromJson(Map<String, dynamic> json) =>
      Rain(
        h1: (json['1h'] as num).toDouble(),
      );

  Map<String, dynamic> toJson() =>
      {
        '1h': h1,
      };
}

class Clouds {
  final int all;

  Clouds({required this.all});

  factory Clouds.fromJson(Map<String, dynamic> json) =>
      Clouds(
        all: json['all'],
      );

  Map<String, dynamic> toJson() =>
      {
        'all': all,
      };
}

class Sys {
  final int? type;
  final int? id;
  final String country;
  final int sunrise;
  final int sunset;

  Sys({
    this.type,
    this.id,
    required this.country,
    required this.sunrise,
    required this.sunset,
  });

  factory Sys.fromJson(Map<String, dynamic> json) => Sys(
    type: json['type'],
    id: json['id'],
    country: json['country'],
    sunrise: json['sunrise'],
    sunset: json['sunset'],
  );
}

