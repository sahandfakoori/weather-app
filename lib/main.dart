import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/features/home/data/models/city_model.dart';
import 'package:weather_app/features/home/data/models/clouds_model.dart';
import 'package:weather_app/features/home/data/models/coord_model.dart';
import 'package:weather_app/features/home/data/models/current_sys_model.dart';
import 'package:weather_app/features/home/data/models/current_weather_model.dart';
import 'package:weather_app/features/home/data/models/forecast_item_model.dart';
import 'package:weather_app/features/home/data/models/forecast_sys_model.dart';
import 'package:weather_app/features/home/data/models/forecast_weather_model.dart';
import 'package:weather_app/features/home/data/models/main_model.dart';
import 'package:weather_app/features/home/data/models/rain_model.dart';
import 'package:weather_app/features/home/data/models/weather_data_model.dart';
import 'package:weather_app/features/home/data/models/weather_model.dart';
import 'package:weather_app/features/home/data/models/wind_model.dart';
import 'package:weather_app/features/home/presentation/bloc/home_bloc.dart';
import 'package:weather_app/features/home/presentation/pages/home_screen.dart';
import 'package:weather_app/features/home/presentation/pages/search_screen.dart';
import 'package:weather_app/locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await getitInitial();

  await initHive();

  runApp(
    BlocProvider<HomeBloc>(
      create: (_) => locator<HomeBloc>(),
      child: const MyApp(),
    ),
  );
  // runApp(const MyApp());
}

Future<void> initHive() async {
  await Hive.initFlutter();

  /// -------- Current Adapters --------
  Hive.registerAdapter(CoordModelAdapter());
  Hive.registerAdapter(WeatherModelAdapter());
  Hive.registerAdapter(MainModelAdapter());
  Hive.registerAdapter(WindModelAdapter());
  Hive.registerAdapter(RainModelAdapter());
  Hive.registerAdapter(CloudsModelAdapter());
  Hive.registerAdapter(CurrentSysModelAdapter());
  Hive.registerAdapter(CurrentWeatherModelAdapter());

  /// -------- Forecast Adapters --------
  Hive.registerAdapter(ForecastWeatherModelAdapter());
  Hive.registerAdapter(ForecastItemModelAdapter());
  Hive.registerAdapter(CityModelAdapter());
  Hive.registerAdapter(ForecastSysModelAdapter());

  /// -------- Wrapper Adapter --------
  Hive.registerAdapter(WeatherDataModelAdapter());

  /// -------- Open Box --------
  await Hive.openBox<WeatherDataModel>('weather');
  await Hive.openBox<CurrentWeatherModel>('current_weather');
  await Hive.openBox<ForecastWeatherModel>('forecast_weather');
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather App',
      home: const SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkCity();
  }

  Future<void> _checkCity() async {
    final prefs = await SharedPreferences.getInstance();
    final city = prefs.getString('city');

    if (city != null && city.isNotEmpty) {
      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => HomeScreen()),
      );
    } else {
      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const SearchScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
