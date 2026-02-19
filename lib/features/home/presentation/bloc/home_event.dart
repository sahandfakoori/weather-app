abstract class HomeEvent {}

class CityWeatherEvent extends HomeEvent {
  // final String city;

  CityWeatherEvent();
}


class CityForecastEvent extends HomeEvent{
  // final String city;

  CityForecastEvent();
}

class SaveCityEvent extends HomeEvent{
  final String city;

  SaveCityEvent(this.city);
}
class LoadCityWeatherEvent extends HomeEvent {

  LoadCityWeatherEvent();
}

