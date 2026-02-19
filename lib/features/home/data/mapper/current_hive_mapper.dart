// import 'package:weather_app/features/home/data/datasource/local/current_weather/clouds_hive_model.dart';
// import 'package:weather_app/features/home/data/datasource/local/current_weather/coord_hive_model.dart';
// import 'package:weather_app/features/home/data/datasource/local/current_weather/current_hive_model.dart';
// import 'package:weather_app/features/home/data/datasource/local/current_weather/main_hive_model.dart';
// import 'package:weather_app/features/home/data/datasource/local/current_weather/rain_hive_model.dart';
// import 'package:weather_app/features/home/data/datasource/local/current_weather/sys_hive_model.dart';
// import 'package:weather_app/features/home/data/datasource/local/current_weather/weather_hive_model.dart';
// import 'package:weather_app/features/home/data/datasource/local/current_weather/wind_hive_model.dart';
// import 'package:weather_app/features/home/domain/entities/current_weather_entity.dart';
//
// extension CurrentWeatherEntityMapper on CurrentWeatherEntity {
//   CurrentHiveModel toModel() => CurrentHiveModel(
//     coord: CoordHiveModel(lat: coord.lat, lon: coord.lon),
//     weather: weather
//         .map(
//           (w) => WeatherHiveModel(
//             id: w.id,
//             main: w.main,
//             description: w.description,
//             icon: w.icon,
//           ),
//         )
//         .toList(),
//     main: MainHiveModel(
//       temp: main.temp,
//       feelsLike: main.feelsLike,
//       tempMin: main.tempMin,
//       tempMax: main.tempMax,
//       pressure: main.pressure,
//       humidity: main.humidity,
//       seaLevel: main.seaLevel,
//       grndLevel: main.grndLevel,
//     ),
//     wind: WindHiveModel(
//       speed: wind.speed,
//       deg: wind.deg,
//       gust: wind.gust,
//     ),
//     visibility: visibility,
//     rain: rain != null ? RainHiveModel(h1: rain!.h1) : null,
//     clouds: CloudsHiveModel(all: clouds.all),
//     dt: dt,
//     sys: SysHiveModel(
//       type: sys.type,
//       id: sys.id,
//       country: sys.country,
//       sunrise: sys.sunrise,
//       sunset: sys.sunset,
//     ),
//     timezone: timezone,
//     id: id,
//     name: name,
//     base: base,
//     cod: cod,
//   );
// }
//
