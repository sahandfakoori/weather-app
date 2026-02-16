import 'package:weather_app/features/home/domain/entities/current_weather_entity.dart';
import 'package:weather_app/features/home/domain/entities/forecast_weather_entity.dart';

class HomeState {
  final ForecastWeatherEntity? forecast;
  final CurrentWeatherEntity? current;
  final bool isLoadingCurrent;
  final bool isLoadingForecast;
  final String? error;

  HomeState({
    this.current,
    this.forecast,
    this.isLoadingCurrent = false,
    this.isLoadingForecast = false,
    this.error,
  });

  HomeState copyWith({
    ForecastWeatherEntity? forecast,
    CurrentWeatherEntity? current,
    bool? isLoadingCurrent,
    bool? isLoadingForecast,
    String? error,
}){
    return HomeState(
      current: current ?? this.current,
      forecast: forecast ?? this.forecast,
      isLoadingCurrent: isLoadingCurrent ?? this.isLoadingCurrent,
      isLoadingForecast: isLoadingForecast ?? this.isLoadingForecast,
      error: error ?? this.error
    );

  }

}
