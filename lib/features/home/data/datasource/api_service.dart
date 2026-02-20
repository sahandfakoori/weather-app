import 'package:dio/dio.dart';
import 'package:weather_app/core/constants/constants.dart';

class ApiService {
  final Dio _dio = Dio();
  final String apiKey = Constants.apiKey;

  Future<dynamic> currentWeather(String city) async {
    final response = await _dio.get(
      '${Constants.baseUrl}/weather',
      queryParameters: {'q': city, 'appid': apiKey, 'units': 'metric'},
    );
    return response;
  }

  Future<Response> forecastWeather(String city) async {
    final response = await _dio.get(
      '${Constants.baseUrl}/forecast',
      queryParameters: {'q': city, 'appid': apiKey, 'units': 'metric'},
    );
    return response;
  }

  Future<dynamic> sendRequestSuggestion(String prefix) async {
    var response = await _dio.get(
      'http://geodb-free-service.wirefreethought.com/v1/geo/cities',
      queryParameters: {'limit': 10, 'offset': 0, 'namePrefix': prefix},
    );
    return response;
  }

  Future<dynamic> currentWeatherLocation(double lat, double lon) async {
    final response = await _dio.get(
      '${Constants.baseUrl}/weather',
      queryParameters: {'lat': lat,'lon': lon, 'appid': apiKey, 'units': 'metric'},
    );
    print(response.data);
    return response;
  }

  Future<dynamic> currentForecastLocation(double lat, double lon) async {
    final response = await _dio.get(
      '${Constants.baseUrl}/forecast',
      queryParameters: {'lat': lat,'lon': lon, 'appid': apiKey, 'units': 'metric'},
    );
    print(response.data);

    return response;
  }

}
