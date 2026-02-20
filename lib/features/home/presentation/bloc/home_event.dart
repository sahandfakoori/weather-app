abstract class HomeEvent {}

class CityWeatherEvent extends HomeEvent {
  // final String city;

  CityWeatherEvent();
}

class CityForecastEvent extends HomeEvent {
  // final String city;

  CityForecastEvent();
}

class SaveCityEvent extends HomeEvent {
  final String city;

  SaveCityEvent(this.city);
}

class LoadCityWeatherEvent extends HomeEvent {
  LoadCityWeatherEvent();
}

class LoadSavedCitiesEvent extends HomeEvent {}

class CurrentLocation extends HomeEvent {
  final double lat;
  final double lon;

  CurrentLocation(this.lat, this.lon);
}
