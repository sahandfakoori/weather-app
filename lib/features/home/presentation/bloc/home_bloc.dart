import 'package:bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/core/resources/data_state.dart';
import 'package:weather_app/features/home/domain/entities/current_weather_entity.dart';
import 'package:weather_app/features/home/domain/entities/forecast_weather_entity.dart';
import 'package:weather_app/features/home/domain/repository/home_repository.dart';
import 'package:weather_app/features/home/presentation/bloc/home_event.dart';
import 'package:weather_app/features/home/presentation/bloc/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  // final GetCurrentWeatherUsecase getCurrentWeather;
  // final GetForecastWeather getForecastWeather;
  final HomeRepository homeRepository;

  // HomeBloc(this.getCurrentWeather, this.getForecastWeather)
  HomeBloc(this.homeRepository)
  : super(HomeState()) {
    on<CityWeatherEvent>(_onCurrentCityWeather);
    on<CityForecastEvent>(_onForecastCityWeather);
    on<SaveCityEvent>(_onSaveCity);
  }


  Future<void> _onSaveCity(
      SaveCityEvent event,
      Emitter<HomeState> emit
      ) async{

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('city', event.city);

  }



  Future<void> _onCurrentCityWeather(
    CityWeatherEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(isLoadingCurrent: true));

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? city = prefs.getString('city');

    final DataState<CurrentWeatherEntity> dataState = await homeRepository.getCurrentWeather(
      city!,
    );

    if (dataState is DataSuccess<CurrentWeatherEntity>) {
      emit(
        state.copyWith(
          current: dataState.data,
          isLoadingCurrent: false,
          error: null,
        ),
      );
    } else if (dataState is DataFailed<CurrentWeatherEntity>) {
      emit(
        state.copyWith(
          error: dataState.message ?? 'Something went wrong',
          isLoadingCurrent: false,
        ),
      );
    }
  }

  Future<void> _onForecastCityWeather(
    CityForecastEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(isLoadingForecast: true));

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? city = prefs.getString('city');

    final DataState<ForecastWeatherEntity> dataState = await homeRepository.getForecastWeather(
      city!,
    );

    if (dataState is DataSuccess<ForecastWeatherEntity>) {
      emit(
        state.copyWith(
          forecast: dataState.data,
          isLoadingForecast: false,
          error: null,
        ),
      );
    } else if (dataState is DataFailed<ForecastWeatherEntity>) {
      emit(
        state.copyWith(
          error: dataState.message ?? 'Something went wrong',
          isLoadingForecast: false,
        ),
      );
    }
  }
}
