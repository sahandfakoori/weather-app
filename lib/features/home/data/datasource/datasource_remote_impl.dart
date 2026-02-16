import 'package:weather_app/features/home/data/datasource/api_service.dart';
import 'package:weather_app/features/home/data/datasource/datasource_remote.dart';
import 'package:weather_app/features/home/data/models/current_weather.dart';
import 'package:weather_app/features/home/data/models/forecast_weather_model.dart';
import 'package:weather_app/features/home/data/models/suggest_city_model.dart';

class DatasourceRemoteImpl extends DatasourceRemote {
  final ApiService apiService;

  DatasourceRemoteImpl(this.apiService);

  @override
  Future<CurrentWeatherModel> getCurrentWeather(String city) async {
    final response = await apiService.currentWeather(city);
    if (response.statusCode == 200) {
      return CurrentWeatherModel.fromJson(response.data);
    } else {
      throw Exception('error can not get current weather');
    }
  }

  @override
  Future<ForecastWeatherModel> getCurrentForecast(String city) async {
    final response = await apiService.forecastWeather(city);
    if (response.statusCode == 200) {
      return ForecastWeatherModel.fromJson(response.data);
    } else {
      throw Exception('error can not get forecast weather');
    }
  }

  @override
  Future<SuggestCityModel> getSuggestPlace(String prefix) async {
    final response = await apiService.sendRequestSuggestion(prefix);
    if (response.statusCode == 200) {
      return SuggestCityModel.fromJson(response.data);
    } else {
      throw Exception('error can not get forecast weather');
    }
  }
}
