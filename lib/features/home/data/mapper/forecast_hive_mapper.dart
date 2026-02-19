// import 'package:weather_app/features/home/domain/entities/forecast_weather_entity.dart';
// import 'package:weather_app/features/home/data/datasource/local/forecast_weather/forecast_hive_model.dart';
// import 'package:weather_app/features/home/data/datasource/local/forecast_weather/forecast_city_hive_model.dart';
// import 'package:weather_app/features/home/data/datasource/local/forecast_weather/forecast_coord_hive_model.dart';
// import 'package:weather_app/features/home/data/datasource/local/forecast_weather/forecast_item_hive_model.dart';
// import 'package:weather_app/features/home/data/datasource/local/forecast_weather/forecast_main_hive_model.dart';
// import 'package:weather_app/features/home/data/datasource/local/forecast_weather/forecast_clouds_hive_model.dart';
// import 'package:weather_app/features/home/data/datasource/local/forecast_weather/forecast_weather_hive_model.dart';
// import 'package:weather_app/features/home/data/datasource/local/forecast_weather/forecast_wind_hive_model.dart';
// import 'package:weather_app/features/home/data/datasource/local/forecast_weather/forecast_rain_hive_model.dart';
// import 'package:weather_app/features/home/data/datasource/local/forecast_weather/forecast_sys_hive_model.dart';
//
// extension ForecastEntityHiveMapper on ForecastWeatherEntity {
//   ForecastHiveModel toHiveModel() {
//     return ForecastHiveModel(
//       cod: cod,
//       message: message,
//       cnt: cnt,
//       list: list.map((item) {
//         return ForecastItemHiveModel(
//           dt: item.dt,
//           main: ForecastMainHiveModel(
//             temp: item.main.temp,
//             feelsLike: item.main.feelsLike,
//             tempMin: item.main.tempMin,
//             tempMax: item.main.tempMax,
//             pressure: item.main.pressure,
//             humidity: item.main.humidity,
//           ),
//           weather: item.weather
//               .map(
//                 (w) => ForecastWeatherHiveModel(
//               id: w.id,
//               main: w.main,
//               description: w.description,
//               icon: w.icon,
//             ),
//           )
//               .toList(),
//           clouds: ForecastCloudsHiveModel(all: item.clouds.all),
//           wind: ForecastWindHiveModel(
//             speed: item.wind.speed,
//             deg: item.wind.deg,
//             gust: item.wind.gust,
//           ),
//           visibility: item.visibility,
//           pop: item.pop,
//           rain: item.rain != null
//               ? ForecastRainHiveModel(oneHour: item.rain!.oneHour)
//               : null,
//           sys: ForecastSysHiveModel(pod: item.sys.pod),
//           dtTxt: item.dtTxt,
//         );
//       }).toList(),
//       city: ForecastCityHiveModel(
//         id: city.id,
//         name: city.name,
//         coord: ForecastCoordHiveModel(
//           lat: city.coord.lat,
//           lon: city.coord.lon,
//         ),
//         country: city.country,
//         population: city.population,
//         timezone: city.timezone,
//         sunrise: city.sunrise,
//         sunset: city.sunset,
//       ),
//     );
//   }
// }
