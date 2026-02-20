🌤 Weather App

Current Location Weather: Ask for user permission and display the weather for their current location.

City Search: Users can manually enter city names to get weather updates.

Offline Caching: Weather data is cached using Hive, so users can see previously loaded data even without internet.

Favourite Locations: Users can save their current location as favourite and quickly access it.

Drawer Navigation: Easily switch between saved cities and refresh their weather.

Skeleton Screens: Smooth loading placeholders using Skeletonizer.

Real-Time Updates: Uses Dio to fetch data from OpenWeatherMap API (or any weather API you integrate).

Persistent Storage: User preferences (like city name and current location consent) are saved using SharedPreferences.

Permissions Handling: Works with permission_handler to safely request location permissions.

dependencies:
  dio: ^5.9.0
  permission_handler: ^12.0.1
  get_it: ^9.2.0
  flutter_bloc: ^9.1.1
  shared_preferences: ^2.5.4
  flutter_svg: ^2.2.3
  smooth_page_indicator: ^2.0.1
  json_annotation: ^4.9.0
  equatable: ^2.0.7
  bloc: ^9.2.0
  intl: ^0.20.2
  geolocator: ^14.0.2
  path_provider: ^2.1.5
  hive: ^2.2.3
  hive_flutter: ^1.1.0
  skeletonizer: ^2.1.3

  Key Implementation Details

Hive for Offline Storage

Caches both current weather and forecast.

Stores favourite locations for quick access.

Uses WeatherDataModel as the main Hive object.

Bloc State Management

Handles async fetching and caching seamlessly.

HomeBloc manages current weather, forecast, saved cities, and loading states.

Location Handling

Requests permission from user.

Saves consent in SharedPreferences (agree or disagree).

Uses geolocator to determine current GPS coordinates.

Search and Suggestions

Debounced search input.

Suggests cities using API.

Stores selected city and fetches current weather and forecast.

Skeleton Loading

Smooth placeholders for current weather and hourly forecasts.

Improves user experience during API calls.

git clone https://github.com/sahandfakoori/weather_app.git
cd weather_app

flutter pub get
flutter packages pub run build_runner build --delete-conflicting-outputs
flutter run

